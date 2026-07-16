"""Gates for the corpus artifact writer."""

import json
from pathlib import Path

import pytest

from vallari.corpus import build_corpus, write_corpus

BUILD_DIR = Path(__file__).parent.parent / "docs" / "build"


@pytest.fixture(scope="session")
def written(tmp_path_factory):
    out = tmp_path_factory.mktemp("corpus")
    result = build_corpus(BUILD_DIR)
    manifest = write_corpus(result, out)
    return out, manifest


def test_jsonl_round_trips(written):
    out, _ = written
    lines = (out / "vakyapadiya.jsonl").read_text().splitlines()
    assert len(lines) == 1796
    first = json.loads(lines[0])
    assert first["id"] == "1.1"
    last = json.loads(lines[-1])
    assert last["id"] == "3.14.624"


def test_manifest_counts_and_checksum(written):
    out, manifest = written
    on_disk = json.loads((out / "manifest.json").read_text())
    assert on_disk == manifest
    assert manifest["verses"] == 1796
    assert manifest["by_kanda"] == {"1": 144, "2": 426, "3": 1226}
    assert manifest["contested"] == 286
    assert manifest["quarantined"] == 0
    assert len(manifest["sha256"]) == 64


def test_quarantine_file_written_even_when_empty(written):
    out, _ = written
    assert json.loads((out / "quarantine.json").read_text()) == []
