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


def test_no_unadjudicated_sort_conflicts_across_contracts():
    """Same name + different sort must be either reconciled or registered as
    distinct senses (homonymy) in data/ontology/homonyms.json, with glosses."""
    table = entity_table(CONTRACTS_DIR)
    homonyms = json.loads((ROOT / "data" / "ontology" / "homonyms.json").read_text())
    conflicts = sort_conflicts(table, homonyms)
    assert conflicts == [], json.dumps(conflicts, indent=1, ensure_ascii=False)


def test_homonym_registry_suppresses_only_registered_partitions():
    table = {
        "akṣara": [("1.9", "absolute"), ("1.18-22", "linguisticItem")],
        "x": [("1.1", "absolute"), ("1.2", "property")],
    }
    homonyms = {
        "akṣara": {
            "senses": [
                {"sort": "absolute", "gloss": "the imperishable", "verses": ["1.9"]},
                {"sort": "linguisticItem", "gloss": "phoneme", "verses": ["1.18-22"]},
            ]
        }
    }
    conflicts = sort_conflicts(table, homonyms)
    assert [c["name"] for c in conflicts] == ["x"]


def test_homonym_registry_must_cover_the_actual_verses():
    table = {"akṣara": [("1.9", "absolute"), ("1.50", "linguisticItem")]}
    homonyms = {
        "akṣara": {
            "senses": [
                {"sort": "absolute", "gloss": "the imperishable", "verses": ["1.9"]},
                {"sort": "linguisticItem", "gloss": "phoneme", "verses": ["1.18-22"]},
            ]
        }
    }
    assert sort_conflicts(table, homonyms) != []


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
