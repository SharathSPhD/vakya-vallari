"""Gates for semantic contracts (M3+).

A contract is only admissible if every axiom is traceable: its `cite` must be
a verbatim substring of the verse's own commentary (or contested note), and
every accepted-reading claim must cite a verbatim substring of the verse's
translation. This is the anti-fabrication gate.
"""

import json
from pathlib import Path

import pytest

from vallari.contracts import load_contract, validate_contract

ROOT = Path(__file__).parent.parent
CONTRACTS = sorted((ROOT / "data" / "contracts").glob("*.json"))
CORPUS = ROOT / "data" / "corpus" / "vakyapadiya.jsonl"


def corpus_index():
    idx = {}
    for line in CORPUS.read_text().splitlines():
        r = json.loads(line)
        idx[r["id"]] = r
    return idx


def test_contract_1_1_exists():
    assert (ROOT / "data" / "contracts" / "1.1.json").exists()


@pytest.mark.parametrize("path", CONTRACTS, ids=lambda p: p.stem)
def test_contract_is_valid_and_traceable(path):
    idx = corpus_index()
    contract = load_contract(path)
    errors = validate_contract(contract, idx[contract["verse"]])
    assert errors == []


def test_validator_catches_fabricated_cite():
    idx = corpus_index()
    contract = load_contract(ROOT / "data" / "contracts" / "1.1.json")
    contract["axioms"][0]["cite"] = "this sentence is not in the commentary"
    errors = validate_contract(contract, idx["1.1"])
    assert any("not found verbatim" in e for e in errors)


def test_validator_catches_unknown_entity_reference():
    idx = corpus_index()
    contract = load_contract(ROOT / "data" / "contracts" / "1.1.json")
    contract["axioms"][0]["a"] = "nonexistent_entity"
    errors = validate_contract(contract, idx["1.1"])
    assert any("unknown entity" in e for e in errors)
