"""GPU semantic-drift audit over the whole corpus.

For every verse, embed its translation and its commentary (all-mpnet-base-v2,
mean-pooled, L2-normalized) and record their cosine similarity. Low similarity
flags verses where translation and commentary may have drifted apart —
a review queue, not a verdict. Runs on CUDA (GB10).

Run with a CUDA-enabled python (e.g. pranava's venv):
  /home/sharaths/projects/pranava/.venv/bin/python scripts/semantic_audit.py
"""

import json
from pathlib import Path

import torch
from transformers import AutoModel, AutoTokenizer

ROOT = Path(__file__).parents[1]
MODEL = "sentence-transformers/all-mpnet-base-v2"
BATCH = 64
MAX_LEN = 384


def embed(texts: list[str], tok, model, device) -> torch.Tensor:
    out = []
    with torch.inference_mode():
        for i in range(0, len(texts), BATCH):
            batch = tok(
                texts[i : i + BATCH],
                padding=True,
                truncation=True,
                max_length=MAX_LEN,
                return_tensors="pt",
            ).to(device)
            hidden = model(**batch).last_hidden_state
            mask = batch["attention_mask"].unsqueeze(-1).float()
            pooled = (hidden * mask).sum(1) / mask.sum(1).clamp(min=1e-9)
            out.append(torch.nn.functional.normalize(pooled, dim=-1).cpu())
            print(f"  embedded {min(i + BATCH, len(texts))}/{len(texts)}", flush=True)
    return torch.cat(out)


def main() -> None:
    device = "cuda" if torch.cuda.is_available() else "cpu"
    print("device:", device, torch.cuda.get_device_name(0) if device == "cuda" else "")
    records = [
        json.loads(x)
        for x in (ROOT / "data" / "corpus" / "vakyapadiya.jsonl").read_text().splitlines()
    ]
    tok = AutoTokenizer.from_pretrained(MODEL)
    model = AutoModel.from_pretrained(MODEL).to(device).eval()

    print("embedding translations…")
    t_emb = embed([r["translation"] for r in records], tok, model, device)
    print("embedding commentaries…")
    c_emb = embed([r["commentary"] for r in records], tok, model, device)

    sims = (t_emb * c_emb).sum(-1).tolist()
    ranked = sorted(
        (
            {
                "id": r["id"],
                "kanda": r["kanda"],
                "similarity": round(s, 4),
                "contested": bool(r["contested"]),
            }
            for r, s in zip(records, sims)
        ),
        key=lambda x: x["similarity"],
    )
    out_dir = ROOT / "research" / "audit"
    out_dir.mkdir(parents=True, exist_ok=True)
    report = {
        "model": MODEL,
        "device": device,
        "verses": len(ranked),
        "mean_similarity": round(sum(sims) / len(sims), 4),
        "p05": ranked[len(ranked) // 20]["similarity"],
        "lowest_50": ranked[:50],
        "note": (
            "similarity of translation vs commentary embeddings; low values are a "
            "review queue, not a verdict — short aphoristic translations with long "
            "technical commentary naturally score lower"
        ),
    }
    (out_dir / "semantic_drift.json").write_text(json.dumps(report, indent=1))
    contested_low = sum(1 for x in ranked[:100] if x["contested"])
    print(f"mean={report['mean_similarity']} p05={report['p05']}")
    print(f"contested among lowest-100: {contested_low}")
    print("wrote research/audit/semantic_drift.json")


if __name__ == "__main__":
    main()
