"""Gates added after the adversarial review (2026-07-18).

1. Doxographic stance: axioms may be marked stance="reported" (pūrvapakṣa —
   a view the commentary reports rather than endorses). Reported axioms
   still license readings (a faithful translation of a doxographic verse
   asserts the report), but the contract becomes machine-visibly
   doxographic, and the stance flows into the generated Lean.
2. Hygiene: axioms and denials must be disjoint (a claim both licensed and
   denied poisons adequacy); every contract must carry >=2 rejected readings.
"""

import json
from pathlib import Path

import pytest

from vallari.contracts import validate_contract
from vallari.leangen import generate_verse_module

RECORD = {
    "id": "9.9",
    "translation": "The word is eternal.",
    "commentary": "Some say the word is produced. We hold the word is eternal.",
    "contested": None,
}

BASE = {
    "verse": "9.9",
    "entities": [{"id": "sabda", "name": "śabda", "sort": "linguisticItem"}],
    "axioms": [
        {"kind": "predication", "name": "nitya", "of": "sabda",
         "cite": "We hold the word is eternal."},
    ],
    "denials": [],
    "accepted_reading": {"claims": [
        {"kind": "predication", "name": "nitya", "of": "sabda",
         "cite": "The word is eternal."}]},
    "rejected_readings": [
        {"label": "r1", "rendering": "x", "why": "y", "expect": "unlicensed",
         "entities": [], "claims": [
             {"kind": "predication", "name": "anitya", "of": "sabda"}]},
        {"label": "r2", "rendering": "x", "why": "y", "expect": "unlicensed",
         "entities": [], "claims": [
             {"kind": "predication", "name": "krtaka", "of": "sabda"}]},
    ],
}


def _with(**kw):
    c = json.loads(json.dumps(BASE))
    c.update(kw)
    return c


def test_base_contract_valid():
    assert validate_contract(_with(), RECORD) == []


def test_reported_stance_accepted_and_licenses():
    c = _with()
    c["axioms"].append({
        "kind": "predication", "name": "utpadyate", "of": "sabda",
        "stance": "reported", "cite": "Some say the word is produced."})
    c["accepted_reading"]["claims"].append({
        "kind": "predication", "name": "utpadyate", "of": "sabda",
        "cite": "The word is eternal."})
    # reported axioms still license: a faithful translation may assert the report
    errs = [e for e in validate_contract(c, RECORD) if "not entailed" in e]
    assert errs == []


def test_bad_stance_rejected():
    c = _with()
    c["axioms"][0]["stance"] = "maybe"
    assert any("stance" in e for e in validate_contract(c, RECORD))


def test_axiom_denial_overlap_rejected():
    c = _with()
    c["denials"] = [{
        "kind": "predication", "name": "nitya", "of": "sabda",
        "cite": "Some say the word is produced."}]
    assert any("both an axiom and a denial" in e for e in validate_contract(c, RECORD))


def test_fewer_than_two_rejected_readings_rejected():
    c = _with()
    c["rejected_readings"] = c["rejected_readings"][:1]
    assert any("at least 2 rejected readings" in e for e in validate_contract(c, RECORD))


def test_leangen_splits_reported_axioms():
    c = _with()
    c["axioms"].append({
        "kind": "predication", "name": "utpadyate", "of": "sabda",
        "stance": "reported", "cite": "Some say the word is produced."})
    src = generate_verse_module(c)
    assert "reported :=" in src
    assert 'Claim.predication "utpadyate" sabda' in src.split("reported :=")[1]
    assert "#guard contract.doxographic = true" in src


def test_leangen_default_no_reported():
    src = generate_verse_module(_with())
    assert "reported := []" in src
    assert "doxographic = true" not in src


@pytest.mark.corpuswide
def test_cross_contract_discriminativity():
    """Anti-tautology gate: accepted readings must not be licensed by other
    verses' contracts except for the small, documented set of generic
    overlaps. This makes 'contracts have discriminative content' mechanical."""
    from vallari.discriminativity import cross_licensing_matrix

    contracts_dir = Path(__file__).parent.parent / "data" / "contracts"
    pairs = cross_licensing_matrix(contracts_dir)
    # Measured 2026-07-18: ZERO cross-licensed pairs among all 20,592 ordered
    # pairs — every accepted reading is licensed only by its own contract
    # (paper §Adversarial evaluation). Any future nonzero must be deliberate
    # and documented here.
    assert pairs == [], pairs[:20]
    n = len(list(contracts_dir.glob("*.json")))
    assert n * (n - 1) == 144 * 143
