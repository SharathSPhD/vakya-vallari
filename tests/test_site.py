"""Gates for the static edition builder."""

from pathlib import Path

import pytest

from vallari.site import build_site

ROOT = Path(__file__).parent.parent


@pytest.fixture(scope="session")
def site(tmp_path_factory):
    out = tmp_path_factory.mktemp("site")
    stats = build_site(
        corpus_path=ROOT / "data" / "corpus" / "vakyapadiya.jsonl",
        contracts_dir=ROOT / "data" / "contracts",
        lean_verses_dir=ROOT / "lean" / "VakyaVallari" / "Verses",
        out_dir=out,
        lake_build_ok=True,
    )
    return out, stats


def test_index_carries_totals_and_badges(site):
    out, stats = site
    html = (out / "index.html").read_text()
    assert "1796" in html.replace(",", "").replace("&#8239;", "")
    assert stats["verses"] == 1796
    assert stats["verified"] >= 1


def test_kanda1_page_has_verse_1_1_verified(site):
    out, _ = site
    html = (out / "kanda-1.html").read_text()
    assert "अनादिनिधनं ब्रह्म शब्दतत्त्वं यदक्षरम्" in html
    assert "id='v1.1'" in html
    assert "verified" in html


def test_kanda3_is_split_by_samuddesa(site):
    out, _ = site
    pages = sorted(out.glob("kanda-3-*.html"))
    assert len(pages) == 14
    assert "Jāti-samuddeśa" in pages[0].read_text()


def test_unformalized_verse_is_marked_honestly(site):
    out, _ = site
    html = (out / "kanda-2.html").read_text()
    assert "unformalized" in html


def test_verified_requires_green_build(tmp_path):
    stats = build_site(
        corpus_path=ROOT / "data" / "corpus" / "vakyapadiya.jsonl",
        contracts_dir=ROOT / "data" / "contracts",
        lean_verses_dir=ROOT / "lean" / "VakyaVallari" / "Verses",
        out_dir=tmp_path,
        lake_build_ok=False,
    )
    assert stats["verified"] == 0


def test_proof_page_for_verified_verse(site):
    out, _ = site
    proof = (out / "proofs" / "1.1.html").read_text()
    assert "accepted_adequate" in proof
    assert "naive_linguistic_structure_sort_error" in proof
    assert "vivartate" in proof
