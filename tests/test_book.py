"""Book gates (SPEC.md §Build): the book inherits the project's discipline.

Gates that need the generated chapters run the generator first (cheap,
deterministic). The EPUB/EPUBCheck gate is marked slow and skipped when
pandoc is unavailable.
"""

from __future__ import annotations

import json
import re
import shutil
import subprocess
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[1]
BOOK = ROOT / "book"
sys.path.insert(0, str(ROOT / "scripts"))

import build_book  # noqa: E402


@pytest.fixture(scope="module")
def generated():
    return build_book.generate()


def _vine_text(generated) -> str:
    return "\n".join(
        p.read_text() for p in generated if p.name.startswith("ch-")
    )


def test_all_144_verse_ids_present_exactly_once(generated):
    text = _vine_text(generated)
    k1 = build_book.load_book1()
    assert len(k1) == 144
    for r in k1:
        occurrences = re.findall(rf"^### {re.escape(r['id'])}$", text, re.M)
        assert len(occurrences) == 1, f"verse {r['id']}: {len(occurrences)} cards"


def test_devanagari_mula_lines_verbatim(generated):
    text = _vine_text(generated)
    for r in build_book.load_book1():
        for line in r["mula_deva"]:
            assert line in text, f"mūla line of {r['id']} missing or altered"


def test_iast_adjacent_to_every_devanagari_block(generated):
    for p in generated:
        if not p.name.startswith("ch-"):
            continue
        body = p.read_text()
        deva_blocks = body.count("::: {.deva}")
        iast_blocks = body.count("::: {.iast}")
        assert deva_blocks == iast_blocks, p.name


def _md_sources(*dirs):
    """Markdown sources, skipping macOS AppleDouble litter (._*)."""
    out = []
    for d in dirs:
        if d.exists():
            out += [p for p in sorted(d.rglob("*.md")) if not p.name.startswith("._")]
    return out


def test_no_em_dashes_in_prose_sources():
    offenders = []
    for p in _md_sources(BOOK / "src"):
        # Em-dashes are permitted only inside fenced code blocks (verbatim
        # JSON/Lean quoted from the repository).
        in_code = False
        for i, line in enumerate(p.read_text(encoding="utf-8").splitlines(), 1):
            if line.lstrip().startswith("```"):
                in_code = not in_code
                continue
            if not in_code and "—" in line:
                offenders.append(f"{p.name}:{i}")
    assert not offenders, f"em-dashes in prose: {offenders}"


def test_chapter_files_match_spec_order():
    for rel in build_book.ORDER:
        assert (BOOK / rel).exists() or rel.startswith("generated/"), rel


def test_theorem_index_covers_all_verified_verses(generated):
    app_d = next(p for p in generated if p.name == "app-d-theorem-index.md")
    body = app_d.read_text()
    rows = [l for l in body.splitlines() if l.startswith("| 1.")]
    assert len(rows) == 144
    assert body.count("`accepted_adequate`") == 144


def test_featured_walkthroughs_have_prose_and_theorems(generated):
    for vid in build_book.FEATURED:
        chapter = next(
            p
            for num, slug, section, feat in build_book.VINE
            if feat == vid
            for p in generated
            if p.name == f"ch-{num}-{slug}.md"
        )
        body = chapter.read_text()
        assert f"Featured verse: {vid}" in body
        assert "close by `decide`" in body


@pytest.mark.skipif(shutil.which("pandoc") is None, reason="pandoc missing")
def test_epub_builds_and_passes_epubcheck(generated, tmp_path):
    # Placeholder chapters are acceptable; structure must be valid.
    missing = [
        rel
        for rel in build_book.ORDER
        if not (BOOK / rel).exists()
    ]
    if missing:
        pytest.skip(f"chapters not yet drafted: {len(missing)}")
    out = tmp_path / "book.epub"
    build_book.build_epub(out)
    assert out.stat().st_size > 10_000
    try:
        from epubcheck import EpubCheck
    except ImportError:
        pytest.skip("epubcheck not installed")
    result = EpubCheck(str(out))
    errors = [m for m in result.messages if m.level in ("ERROR", "FATAL")]
    assert result.valid, f"EPUBCheck errors: {errors[:10]}"


def test_images_have_alt_text_and_size_limit():
    for p in _md_sources(BOOK / "src", BOOK / "generated"):
        for m in re.finditer(r"!\[(.*?)\]\((.*?)\)", p.read_text(encoding="utf-8")):
            alt, src = m.groups()
            assert alt.strip(), f"missing alt text in {p.name}: {src}"
            img = (BOOK / "src" / src).resolve()
            if img.exists():
                assert img.stat().st_size < 5_000_000, f"{src} over 5 MB"
