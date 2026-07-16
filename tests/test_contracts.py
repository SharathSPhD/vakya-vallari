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


def test_validator_catches_unentailed_accepted_claim():
    """Mirror of the Lean entailment check: every accepted-reading claim must
    be entailed by the axioms (membership + identity refl/symm), and must not
    appear among the denials."""
    idx = corpus_index()
    contract = load_contract(ROOT / "data" / "contracts" / "1.1.json")
    contract["accepted_reading"]["claims"].append(
        {"kind": "predication", "name": "nitya", "of": "brahman", "cite": "Brahman"}
    )
    errors = validate_contract(contract, idx["1.1"])
    assert any("not entailed" in e for e in errors)


def test_validator_catches_accepted_claim_that_is_denied():
    idx = corpus_index()
    contract = load_contract(ROOT / "data" / "contracts" / "1.1.json")
    denial = dict(contract["denials"][0])
    denial["cite"] = "It appears in the mode of objects"  # verbatim in translation
    contract["accepted_reading"]["claims"].append(denial)
    errors = validate_contract(contract, idx["1.1"])
    assert any("denied" in e for e in errors)


def test_validator_rejects_rejected_reading_that_is_actually_adequate():
    """A rejected reading whose claims are all entailed (and none denied) would
    make the ¬Adequate theorem false in Lean — the validator must catch it."""
    idx = corpus_index()
    contract = load_contract(ROOT / "data" / "contracts" / "1.1.json")
    contract["rejected_readings"].append(
        {
            "label": "lazy_counterexample",
            "rendering": "whatever",
            "why": "claims an axiom verbatim",
            "entities": [],
            "claims": [dict(contract["axioms"][0], cite=None)],
            "expect": "unlicensed",
        }
    )
    errors = validate_contract(contract, idx["1.1"])
    assert any("adequate" in e and "lazy_counterexample" in e for e in errors)


def test_validator_checks_expect_matches_reality():
    idx = corpus_index()
    contract = load_contract(ROOT / "data" / "contracts" / "1.1.json")
    # parinama reading is contradicted, not merely unlicensed
    contract["rejected_readings"][1]["expect"] = "unlicensed"
    errors = validate_contract(contract, idx["1.1"])
    assert any("expect" in e for e in errors)


def test_validator_rejects_non_ascii_entity_ids():
    """Lean identifiers must be ASCII; Python's isidentifier() is too lax."""
    idx = corpus_index()
    contract = load_contract(ROOT / "data" / "contracts" / "1.1.json")
    contract["entities"][0]["id"] = "smṛti"
    errors = validate_contract(contract, idx["1.1"])
    assert any("ASCII" in e for e in errors)


def test_validator_catches_unknown_entity_reference():
    idx = corpus_index()
    contract = load_contract(ROOT / "data" / "contracts" / "1.1.json")
    contract["axioms"][0]["a"] = "nonexistent_entity"
    errors = validate_contract(contract, idx["1.1"])
    assert any("unknown entity" in e for e in errors)
