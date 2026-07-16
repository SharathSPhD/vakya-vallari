"""Load and validate semantic contracts against the corpus.

A contract states the formalizable core of one verse's commentary. It is
admissible only if traceable: axiom/denial cites must occur verbatim in the
verse's commentary (or contested note); accepted-reading claim cites must
occur verbatim in the verse's translation. Validation returns a list of
error strings — empty means admissible.
"""

from __future__ import annotations

import json
from pathlib import Path

SORTS = {"absolute", "power", "manifestation", "linguisticItem", "property", "cognition"}
CLAIM_KINDS = {"identity", "predication", "relation"}


def load_contract(path: Path) -> dict:
    return json.loads(path.read_text())


def _claim_errors(claim: dict, where: str, entity_ids: set[str]) -> list[str]:
    errors = []
    kind = claim.get("kind")
    if kind not in CLAIM_KINDS:
        errors.append(f"{where}: bad claim kind {kind!r}")
        return errors
    refs = {
        "identity": ("a", "b"),
        "predication": ("of",),
        "relation": ("from", "to"),
    }[kind]
    for field in refs:
        ref = claim.get(field)
        if ref not in entity_ids:
            errors.append(f"{where}: unknown entity {ref!r}")
    if kind in ("predication", "relation") and not claim.get("name"):
        errors.append(f"{where}: missing name")
    return errors


def validate_contract(contract: dict, verse_record: dict) -> list[str]:
    errors: list[str] = []
    if contract.get("verse") != verse_record["id"]:
        errors.append("verse id mismatch with corpus record")

    entities = contract.get("entities", [])
    entity_ids = {e.get("id") for e in entities}
    for e in entities:
        if e.get("sort") not in SORTS:
            errors.append(f"entity {e.get('id')!r}: bad sort {e.get('sort')!r}")
        if not e.get("id", "").isidentifier():
            errors.append(f"entity id {e.get('id')!r} is not a valid identifier")

    commentary_text = verse_record["commentary"] + "\n" + (
        verse_record.get("contested") or ""
    )
    for i, ax in enumerate(contract.get("axioms", []) + contract.get("denials", [])):
        where = f"axiom/denial[{i}]"
        errors += _claim_errors(ax, where, entity_ids)
        cite = ax.get("cite", "")
        if not cite.strip():
            errors.append(f"{where}: missing cite")
        elif cite not in commentary_text:
            errors.append(f"{where}: cite not found verbatim in commentary: {cite[:60]!r}")

    def key(c: dict) -> tuple:
        if c.get("kind") == "identity":
            return ("identity", c.get("a"), c.get("b"))
        if c.get("kind") == "predication":
            return ("predication", c.get("name"), c.get("of"))
        return ("relation", c.get("name"), c.get("from"), c.get("to"))

    axiom_keys = {key(a) for a in contract.get("axioms", [])}
    denial_keys = {key(d) for d in contract.get("denials", [])}

    def entailed(c: dict) -> bool:
        # Mirrors VakyaVallari.entails: membership + identity refl/symm.
        if key(c) in axiom_keys:
            return True
        if c.get("kind") == "identity":
            return c.get("a") == c.get("b") or (
                ("identity", c.get("b"), c.get("a")) in axiom_keys
            )
        return False

    accepted = contract.get("accepted_reading", {})
    for i, cl in enumerate(accepted.get("claims", [])):
        where = f"accepted_reading.claims[{i}]"
        errors += _claim_errors(cl, where, entity_ids)
        cite = cl.get("cite", "")
        if not cite.strip():
            errors.append(f"{where}: missing cite")
        elif cite not in verse_record["translation"]:
            errors.append(f"{where}: cite not found verbatim in translation: {cite[:60]!r}")
        if not entailed(cl):
            errors.append(f"{where}: not entailed by axioms")
        if key(cl) in denial_keys:
            errors.append(f"{where}: claim is denied by the contract")

    for rej in contract.get("rejected_readings", []):
        label = rej.get("label", "?")
        if not label.isidentifier():
            errors.append(f"rejected reading label {label!r} is not a valid identifier")
        if not rej.get("why", "").strip():
            errors.append(f"rejected reading {label}: missing why")
        if not rej.get("rendering", "").strip():
            errors.append(f"rejected reading {label}: missing rendering")
        local_ids = entity_ids | {e.get("id") for e in rej.get("entities", [])}
        for e in rej.get("entities", []):
            if e.get("sort") not in SORTS:
                errors.append(f"rejected {label}: bad sort {e.get('sort')!r}")
        for i, cl in enumerate(rej.get("claims", [])):
            errors += _claim_errors(cl, f"rejected {label}.claims[{i}]", local_ids)

        # The reading must PROVABLY fail, mirroring Lean's Contract.Adequate:
        # licensed (all claims entailed) and not contradicted => Lean's
        # ¬Adequate theorem would be false and the build would break.
        claims = rej.get("claims", [])
        licensed = all(entailed(c) for c in claims) if claims else True
        contradicted = any(key(c) in denial_keys for c in claims)
        if licensed and not contradicted:
            errors.append(
                f"rejected reading {label} is adequate under the axioms — "
                "it must contain at least one unlicensed or denied claim"
            )
        expect = rej.get("expect")
        if expect == "unlicensed" and licensed:
            errors.append(f"rejected {label}: expect=unlicensed but all claims are entailed")
        if expect == "contradicted" and not contradicted:
            errors.append(f"rejected {label}: expect=contradicted but no claim is denied")
        if expect == "unlicensed" and contradicted:
            errors.append(f"rejected {label}: expect mismatch — reading is contradicted")

    return errors
