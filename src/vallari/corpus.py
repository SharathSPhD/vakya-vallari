"""Build the canonical Vākyapadīya corpus from the docs/build sources.

Canonical units are the commentary entries (1,796 verses). Each unit must
align with a mūla entry by exact label; failures are quarantined with a
reason rather than silently dropped or patched.
"""

from __future__ import annotations

import json
import re
from dataclasses import dataclass, field
from pathlib import Path

from indic_transliteration import sanscript

_ID_RE = re.compile(
    r"^(?P<kanda>\d+)\.(?:(?P<chapter>\d+)\.)?(?P<verse>\d+)(?P<suffix>.*)$"
)


@dataclass
class CorpusResult:
    records: list[dict] = field(default_factory=list)
    quarantine: list[dict] = field(default_factory=list)


def _sort_key(verse_id: str) -> tuple:
    m = _ID_RE.match(verse_id)
    if not m:
        return (99, 0, 0, verse_id)
    return (
        int(m.group("kanda")),
        int(m.group("chapter") or 0),
        int(m.group("verse")),
        m.group("suffix"),
    )


def _load_mula(build_dir: Path) -> dict[str, dict]:
    """Map mūla label -> {lines, unit_title, href}, tracking section headers."""
    data = json.loads((build_dir / "vakyapadiya_mula_deva.json").read_text())
    out: dict[str, dict] = {}
    unit_title = None
    for entry in data["verses"]:
        label = entry.get("label", "")
        if not label.startswith("Verse"):
            unit_title = label
            continue
        if label in out:
            # Source defect: same label on two pages (e.g. 2.127cd). Merge
            # lines in document order and flag it — never silently overwrite.
            out[label]["lines"] = out[label]["lines"] + entry.get("lines", [])
            out[label]["duplicated"] = True
        else:
            out[label] = {
                "lines": entry.get("lines", []),
                "unit_title": unit_title,
                "href": entry.get("href"),
                "duplicated": False,
            }
    return out


def build_corpus(build_dir: Path) -> CorpusResult:
    mula = _load_mula(build_dir)
    result = CorpusResult()

    for kanda in (1, 2, 3):
        commentary = json.loads(
            (build_dir / "commentary" / f"kanda{kanda}.json").read_text()
        )
        for key, verse in commentary.items():
            if not key.startswith("Verse"):
                continue
            verse_id = key.removeprefix("Verse ").strip()
            contested = verse.get("contested")  # prose note or None
            m = mula.get(key)
            if m is None:
                result.quarantine.append(
                    {
                        "id": verse_id,
                        "kanda": kanda,
                        "contested": contested,
                        "reason": "no mūla entry with this label",
                    }
                )
                continue
            if not m["lines"]:
                result.quarantine.append(
                    {
                        "id": verse_id,
                        "kanda": kanda,
                        "contested": contested,
                        "reason": "mūla entry has no Devanagari lines",
                    }
                )
                continue
            result.records.append(
                {
                    "id": verse_id,
                    "kanda": kanda,
                    "sort_key": _sort_key(verse_id),
                    "section": verse.get("section"),
                    "unit_title": m["unit_title"],
                    "mula_deva": m["lines"],
                    "mula_iast": [
                        sanscript.transliterate(
                            line, sanscript.DEVANAGARI, sanscript.IAST
                        )
                        for line in m["lines"]
                    ],
                    "translation": verse.get("translation", ""),
                    "commentary": verse.get("commentary", ""),
                    "contested": contested,
                    "source_anomaly": (
                        "duplicate label in source; lines merged in document order"
                        if m["duplicated"]
                        else None
                    ),
                    "provenance": {
                        "mula": "wisdomlib",
                        "mula_href": m["href"],
                        "translation": "original",
                        "commentary": "original",
                    },
                }
            )

    result.records.sort(key=lambda r: r["sort_key"])
    return result


def write_corpus(result: CorpusResult, out_dir: Path) -> dict:
    """Write canonical JSONL, quarantine, and a manifest with a checksum."""
    import hashlib

    out_dir.mkdir(parents=True, exist_ok=True)
    jsonl_path = out_dir / "vakyapadiya.jsonl"
    with jsonl_path.open("w", encoding="utf-8") as f:
        for r in result.records:
            row = dict(r)
            row["sort_key"] = list(row["sort_key"])
            f.write(json.dumps(row, ensure_ascii=False) + "\n")

    (out_dir / "quarantine.json").write_text(
        json.dumps(result.quarantine, ensure_ascii=False, indent=1)
    )

    by_kanda: dict[str, int] = {}
    for r in result.records:
        by_kanda[str(r["kanda"])] = by_kanda.get(str(r["kanda"]), 0) + 1
    manifest = {
        "verses": len(result.records),
        "by_kanda": by_kanda,
        "contested": sum(1 for r in result.records if r["contested"]),
        "quarantined": len(result.quarantine),
        "sha256": hashlib.sha256(jsonl_path.read_bytes()).hexdigest(),
        "sources": {
            "mula": "wisdomlib.org (Devanagari kārikās, blockquote-scoped extraction)",
            "translation_commentary": "original, written from the Sanskrit mūla",
        },
    }
    (out_dir / "manifest.json").write_text(
        json.dumps(manifest, ensure_ascii=False, indent=1)
    )
    return manifest
