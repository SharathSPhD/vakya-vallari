"""Generate Lean verse modules from semantic contracts.

Each contract becomes `lean/VakyaVallari/Verses/V<id>.lean` containing the
entities, the contract (axioms + denials), the accepted reading with its
adequacy theorem, and a Counterexamples namespace where every rejected
reading is refuted by compiled theorems — never by comments.
"""

from __future__ import annotations

import re
from pathlib import Path

from vallari.contracts import load_contract


def module_name(verse_id: str) -> str:
    return "V" + re.sub(r"[^0-9a-zA-Z]+", "_", verse_id)


def _claim(c: dict) -> str:
    if c["kind"] == "identity":
        return f"Claim.identity {c['a']} {c['b']}"
    if c["kind"] == "predication":
        return f'Claim.predication "{c["name"]}" {c["of"]}'
    return f'Claim.relation "{c["name"]}" (Node.ent {c["from"]}) (Node.ent {c["to"]})'


def _claim_list(claims: list[dict], indent: str = "    ") -> str:
    if not claims:
        return "[]"
    inner = f"\n{indent}, ".join(_claim(c) for c in claims)
    return f"[ {inner} ]"


def _entity(e: dict) -> str:
    return f'def {e["id"]} : Entity := ⟨"{e["name"]}", Sorta.{e["sort"]}⟩'


def generate_verse_module(contract: dict) -> str:
    vid = contract["verse"]
    mod = module_name(vid)
    lines: list[str] = [
        f"/- Verse {vid} — generated from data/contracts/{vid}.json. DO NOT EDIT.",
        "   Axiom cites are verbatim commentary quotations, validated by",
        "   tests/test_contracts.py. -/",
        "import VakyaVallari.Adequacy",
        "",
        f"namespace VakyaVallari.Verses.{mod}",
        "",
        "open VakyaVallari",
        "",
    ]
    for e in contract["entities"]:
        lines.append(_entity(e))
    lines += [
        "",
        "def contract : Contract :=",
        f"  {{ axioms := {_claim_list(contract['axioms'])}",
        f"  , denials := {_claim_list(contract.get('denials', []))} }}",
        "",
        "def accepted : Reading :=",
        f"  {{ claims := {_claim_list(contract['accepted_reading']['claims'])} }}",
        "",
        "theorem accepted_adequate : contract.Adequate accepted := by decide",
        "",
        "namespace Counterexamples",
        "",
    ]
    contract_entities = {e["id"]: e for e in contract["entities"]}
    for rej in contract.get("rejected_readings", []):
        label = rej["label"]
        lines.append(f"/- {rej['rendering']!r}")
        lines.append(f"   Why rejected: {rej['why']} -/")
        for e in rej.get("entities", []):
            lines.append(_entity(e))
        lines.append(f"def {label} : Reading :=")
        lines.append(f"  {{ claims := {_claim_list(rej['claims'])} }}")
        lines.append(
            f"theorem {label}_inadequate : ¬ contract.Adequate {label} := by decide"
        )
        if rej.get("expect") == "contradicted":
            lines.append(f"#guard contract.contradicts {label} = true")
        elif rej.get("expect") == "unlicensed":
            lines.append(f"#guard contract.licenses {label} = false")
        # If a rejected entity shares a name with a contract entity but has a
        # different sort, the sort error itself is decidably provable.
        for e in rej.get("entities", []):
            twin = next(
                (
                    ce
                    for ce in contract_entities.values()
                    if ce["name"] == e["name"] and ce["sort"] != e["sort"]
                ),
                None,
            )
            if twin:
                lines.append(
                    f"theorem {label}_sort_error : {e['id']} ≠ {twin['id']} := by decide"
                )
        lines.append("")
    lines += [
        "end Counterexamples",
        "",
        f"end VakyaVallari.Verses.{mod}",
        "",
    ]
    return "\n".join(lines)


def emit_all(contracts_dir: Path, lib_dir: Path) -> int:
    """Write one module per contract plus the Verses index. Returns count."""
    verses_dir = lib_dir / "Verses"
    verses_dir.mkdir(parents=True, exist_ok=True)
    mods = []
    for path in sorted(contracts_dir.glob("*.json")):
        contract = load_contract(path)
        mod = module_name(contract["verse"])
        (verses_dir / f"{mod}.lean").write_text(generate_verse_module(contract))
        mods.append(mod)
    index = "/- Generated verse index. DO NOT EDIT. -/\n" + "\n".join(
        f"import VakyaVallari.Verses.{m}" for m in mods
    )
    (lib_dir / "Verses.lean").write_text(index + "\n")
    return len(mods)
