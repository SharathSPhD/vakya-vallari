"""Gates for the canonical corpus (M1).

The corpus is built from docs/build sources. The commentary files define the
canonical verse units (1,796). Every unit must either align with a mūla entry
or land in quarantine with a reason — no silent drops, no invented text.
"""

import re
from pathlib import Path

import pytest

from vallari.corpus import build_corpus

BUILD_DIR = Path(__file__).parent.parent / "docs" / "build"

DEVANAGARI = re.compile(r"[ऀ-ॿ]")
LATIN = re.compile(r"[A-Za-z]")


@pytest.fixture(scope="session")
def corpus():
    return build_corpus(BUILD_DIR)


def test_total_and_per_kanda_counts(corpus):
    assert len(corpus.records) + len(corpus.quarantine) == 1796
    by_kanda = {}
    for r in corpus.records:
        by_kanda[r["kanda"]] = by_kanda.get(r["kanda"], 0) + 1
    quarantined_kandas = [q["kanda"] for q in corpus.quarantine]
    for k in quarantined_kandas:
        by_kanda[k] = by_kanda.get(k, 0) + 1
    assert by_kanda == {1: 144, 2: 426, 3: 1226}


def test_verse_1_1_record_shape(corpus):
    (r,) = [r for r in corpus.records if r["id"] == "1.1"]
    assert r["kanda"] == 1
    assert r["mula_deva"] == [
        "अनादिनिधनं ब्रह्म शब्दतत्त्वं यदक्षरम् ।",
        "विवर्ततेऽर्थभावेन प्रक्रिया जगतो यतः ॥ १ ॥",
    ]
    assert r["mula_iast"][0].startswith("anādinidhanaṃ brahma śabdatattvaṃ")
    assert r["translation"].startswith("Brahman is without beginning or end")
    assert "sabdadvaita" in r["commentary"]
    # contested is a prose note explaining the dispute, or None
    assert "vivarta" in r["contested"]
    assert r["section"] == "The Word-Brahman"
    assert r["provenance"]["mula"] == "wisdomlib"
    assert r["provenance"]["translation"] == "original"


def test_kanda3_has_samuddesa_unit(corpus):
    (r,) = [r for r in corpus.records if r["id"] == "3.1.1"]
    assert "Jāti-samuddeśa" in r["unit_title"]


def test_every_record_has_mula_and_translation(corpus):
    for r in corpus.records:
        assert r["mula_deva"], r["id"]
        assert r["translation"].strip(), r["id"]
        assert r["commentary"].strip(), r["id"]


def test_mula_is_devanagari_iast_is_latin(corpus):
    for r in corpus.records:
        for line in r["mula_deva"]:
            assert DEVANAGARI.search(line), r["id"]
            # Latin may appear only inside the ॥..॥ verse marker (e.g. ॥ ३५cd ॥)
            core = re.sub(r"॥[^॥]*॥", "", line)
            assert not LATIN.search(core), r["id"]
        for line in r["mula_iast"]:
            assert not DEVANAGARI.search(line), r["id"]


def test_ids_unique_and_naturally_sorted(corpus):
    ids = [r["id"] for r in corpus.records]
    assert len(ids) == len(set(ids))
    keys = [r["sort_key"] for r in corpus.records]
    assert keys == sorted(keys)


def test_contested_notes_preserved(corpus):
    contested = sum(1 for r in corpus.records if r["contested"])
    quarantined_contested = sum(1 for q in corpus.quarantine if q.get("contested"))
    assert contested + quarantined_contested == 286
    for r in corpus.records:
        if r["contested"] is not None:
            assert isinstance(r["contested"], str) and r["contested"].strip()


def test_duplicate_source_label_2_127cd_merged_and_flagged(corpus):
    """wisdomlib assigns '2.127cd' to two pages (halves of 2.126 and 2.127);
    the commentary entry documents this and serves both — so the record must
    carry both lines, in document order, with the anomaly noted."""
    (r,) = [r for r in corpus.records if r["id"] == "2.127cd"]
    assert len(r["mula_deva"]) == 2
    assert "॥ १२६ ॥" in r["mula_deva"][0]
    assert "॥ १२७ ॥" in r["mula_deva"][1]
    assert "duplicate" in r["source_anomaly"]
    plain = [x for x in corpus.records if x["id"] == "1.1"][0]
    assert plain["source_anomaly"] is None


def test_quarantine_is_small_and_reasoned(corpus):
    assert len(corpus.quarantine) < 10
    for q in corpus.quarantine:
        assert q["id"]
        assert q["reason"].strip()
