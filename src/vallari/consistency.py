"""Cross-contract ontology consistency.

Builds a table of entity name → [(verse, sort)] over all contracts (main
entities only — rejected_readings' local entities are deliberate
counterexamples) and reports names assigned more than one sort.
"""

from __future__ import annotations

import json
from pathlib import Path


def entity_table(contracts_dir: Path) -> dict[str, list[tuple[str, str]]]:
    table: dict[str, list[tuple[str, str]]] = {}
    for path in sorted(contracts_dir.glob("*.json")):
        contract = json.loads(path.read_text())
        for e in contract.get("entities", []):
            table.setdefault(e["name"], []).append((contract["verse"], e["sort"]))
    return table


def sort_conflicts(
    table: dict[str, list[tuple[str, str]]],
    homonyms: dict | None = None,
) -> list[dict]:
    """Report names with >1 sort, unless the exact (verse, sort) partition is
    registered as distinct senses in the homonym registry."""
    homonyms = homonyms or {}
    conflicts = []
    for name, uses in table.items():
        sorts = {s for (_v, s) in uses}
        if len(sorts) <= 1:
            continue
        entry = homonyms.get(name)
        if entry:
            allowed: dict[str, str] = {}
            for sense in entry.get("senses", []):
                for v in sense.get("verses", []):
                    allowed[v] = sense["sort"]
            if all(allowed.get(v) == s for (v, s) in uses):
                continue
        conflicts.append({"name": name, "uses": [list(u) for u in uses]})
    return conflicts
