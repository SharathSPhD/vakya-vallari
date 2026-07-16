"""Gates for the contract → Lean generator."""

import shutil
import subprocess
from pathlib import Path

import pytest

from vallari.contracts import load_contract
from vallari.leangen import emit_all, generate_verse_module, module_name

ROOT = Path(__file__).parent.parent


def test_module_name_mapping():
    assert module_name("1.1") == "V1_1"
    assert module_name("3.14.608") == "V3_14_608"
    assert module_name("2.35ab") == "V2_35ab"


def test_generated_1_1_contains_the_essentials():
    contract = load_contract(ROOT / "data" / "contracts" / "1.1.json")
    src = generate_verse_module(contract)
    assert "namespace VakyaVallari.Verses.V1_1" in src
    assert 'def brahman : Entity := ⟨"brahman", Sorta.absolute⟩' in src
    assert "theorem accepted_adequate : contract.Adequate accepted := by decide" in src
    assert (
        "theorem naive_linguistic_structure_inadequate" in src
    ), "counterexamples must be compiled, not commented"
    assert "theorem naive_linguistic_structure_sort_error" in src
    assert "#guard contract.contradicts parinama_transformation = true" in src
    assert "generated from data/contracts/1.1.json" in src


def test_emit_all_writes_modules_and_index(tmp_path):
    n = emit_all(ROOT / "data" / "contracts", tmp_path)
    assert n >= 1
    assert (tmp_path / "Verses" / "V1_1.lean").exists()
    index = (tmp_path / "Verses.lean").read_text()
    assert "import VakyaVallari.Verses.V1_1" in index


@pytest.mark.skipif(shutil.which("lake") is None, reason="lake not on PATH")
def test_generated_lean_compiles():
    emit_all(ROOT / "data" / "contracts", ROOT / "lean" / "VakyaVallari")
    proc = subprocess.run(
        ["lake", "build"], cwd=ROOT / "lean", capture_output=True, text=True
    )
    assert proc.returncode == 0, proc.stdout + proc.stderr
