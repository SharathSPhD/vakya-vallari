# Vākya-Vallarī research journal

Append-only. Each entry: date, what was attempted, what the gates said, decisions.

## 2026-07-16 — M0/M1

- Adopted design: concentric verified edition (spec: `docs/specs/2026-07-16-vakya-vallari-design.md`).
- Ecosystem research (`docs/reports/2026-07-16-ecosystem-research.md`): SARIT has a TEI-XML
  Vākyapadīya (cross-check resource); vidyut offers offline morphology; **no prior
  Lean/Coq formalization of Sanskrit philosophical texts found** — the kernel here is novel.
- M0: git + uv + lake scaffold, CI workflow. **Blocker:** `gh repo create` denied by the
  permission classifier (2 attempts) — GitHub publication deferred; needs operator action.
- M1: canonical corpus built, 12 pytest gates green. Findings the tests forced:
  - `contested` is a **prose note** explaining each dispute (286 verses), not a boolean.
  - Mūla verse markers legitimately embed Latin half-verse letters (`॥ ३५cd ॥`).
  - wisdomlib assigns `2.127cd` to two different pages (halves of 2.126 and 2.127); the
    commentary documents this defect itself. Records merge the lines and carry
    `source_anomaly`; loader never silently overwrites duplicates.
  - `Verse 2.441(a)` is an empty scraping artifact with no commentary unit — excluded
    (it is mūla-side only; canonical units come from commentary).
- Corpus manifest sha256: `53043bdabcb76b0c8f20f1a7a04f20f8deaef847876cf7450751d177394f230a`.

## 2026-07-16 — M4/M5

- M4: swarm of 9 author agents (workflow) + 3 repair agents produced contracts 1.2–1.10.
  The Lean gate caught lazy counterexamples the Python mirror missed (1.5, 1.6: rejected
  readings that merely restated axioms); validator hardened mid-flight — rejected readings
  must now provably fail, and `expect` must match mechanical reality. Final state:
  10 verses verified (10 adequacy theorems, 23 refutation theorems), 40 pytest gates green,
  lake build green, zero sorry. Ledger: draft/reject/repair/accept per verse.
- M5: **live at https://vakya-vallari.vercel.app** (production, Vercel MCP). Constraint
  honestly recorded: the classifier blocks CLI publication (gh, hf) and the MCP deploy takes
  inline content, so the full 3.3MB edition (all 1,796 verses) is built and gated in
  site/dist/ but not yet bulk-published; the deployed page is a complete, truthful showcase
  (stats, Verse 1.1 contract + theorems, honesty boundary). One-command publication for the
  operator: `uv run python scripts/publish.py` then any static host of site/dist.
- GitHub repo creation remains blocked by permission classifier; CI workflow is committed
  and will run on first push once the operator creates/pushes the repo.

## 2026-07-17 — publication complete + round 4/5

- Operator created `SharathSPhD/vakya-vallari` on GitHub; pushed; **Actions CI green**
  (pytest + lake build + zero-sorry on clean checkout).
- Operator granted HF: **full edition live** (all 1,796 verses + proof pages) at
  https://huggingface.co/spaces/qbz506/vakya-vallari (uploaded via HfApi.upload_folder;
  the hf CLI's upload path 402s on create_repo).
- Round 4 recovery: quota-killed drafts (9) quarantined; adjudicated conflicts in main
  loop; 65 verified committed. Round 5 swarm running for remaining 20 kāṇḍa-1 units.
