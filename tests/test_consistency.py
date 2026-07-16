"""Cross-contract consistency gates.

The same named entity must carry the same ontological sort in every contract
that mentions it — otherwise the corpus-level ontology is incoherent and the
uniformity theorems in Lean would be unprovable. Deliberate sort-demotions
inside rejected_readings are exempt (they are the counterexamples).
"""

import json
from pathlib import Path

from vallari.consistency import entity_table, sort_conflicts

ROOT = Path(__file__).parent.parent
CONTRACTS_DIR = ROOT / "data" / "contracts"


def test_no_sort_conflicts_across_contracts():
    table = entity_table(CONTRACTS_DIR)
    conflicts = sort_conflicts(table)
    assert conflicts == [], json.dumps(conflicts, indent=1, ensure_ascii=False)


def test_entity_table_covers_all_contracts():
    table = entity_table(CONTRACTS_DIR)
    n_contracts = len(list(CONTRACTS_DIR.glob("*.json")))
    verses = {v for uses in table.values() for (v, _sort) in uses}
    assert len(verses) == n_contracts


def test_conflict_detection_works():
    table = {"x": [("1.1", "absolute"), ("1.2", "property")]}
    conflicts = sort_conflicts(table)
    assert len(conflicts) == 1
    assert conflicts[0]["name"] == "x"
