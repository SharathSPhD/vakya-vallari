"""Cross-contract discriminativity: the anti-tautology measurement.

For every ordered pair of distinct verses (i, j), check whether verse i's
accepted reading is licensed by verse j's contract (axioms + reported,
closed under identity reflexivity/symmetry — the same entailment the Lean
kernel uses). If contracts were vacuous or generic, cross-licensing would
be rampant; measured cross-licensing quantifies how much verse-specific
content each contract carries.
"""

from __future__ import annotations

import json
from pathlib import Path


def _key(c: dict) -> tuple:
    if c.get("kind") == "identity":
        return ("identity", c.get("a"), c.get("b"))
    if c.get("kind") == "predication":
        return ("predication", c.get("name"), c.get("of"))
    return ("relation", c.get("name"), c.get("from"), c.get("to"))


def _entailed(claim: dict, axiom_keys: set) -> bool:
    if _key(claim) in axiom_keys:
        return True
    if claim.get("kind") == "identity":
        return claim.get("a") == claim.get("b") or (
            ("identity", claim.get("b"), claim.get("a")) in axiom_keys
        )
    return False


def cross_licensing_matrix(contracts_dir: Path) -> list[tuple[str, str]]:
    """Return ordered pairs (reader_verse, contract_verse) where the reader's
    accepted claims are all licensed by the *other* verse's contract."""
    contracts = {}
    for p in sorted(contracts_dir.glob("*.json")):
        c = json.loads(p.read_text())
        contracts[c["verse"]] = c
    axiom_keys = {
        v: {_key(a) for a in c.get("axioms", [])}
        for v, c in contracts.items()
    }
    accepted = {
        v: c.get("accepted_reading", {}).get("claims", [])
        for v, c in contracts.items()
    }
    pairs = []
    for vi, claims in accepted.items():
        for vj, keys in axiom_keys.items():
            if vi == vj:
                continue
            if claims and all(_entailed(cl, keys) for cl in claims):
                pairs.append((vi, vj))
    return pairs
