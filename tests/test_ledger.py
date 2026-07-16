"""Gates for the append-only research ledger."""

import json

from vallari.ledger import append_event, read_events


def test_append_and_read_round_trip(tmp_path):
    path = tmp_path / "ledger.jsonl"
    append_event(path, {"event": "draft", "verse": "1.2"})
    append_event(path, {"event": "accept", "verse": "1.2", "detail": "build green"})
    events = read_events(path)
    assert [e["event"] for e in events] == ["draft", "accept"]
    assert all("ts" in e for e in events)
    # append-only: file is line-delimited JSON, never rewritten
    lines = path.read_text().splitlines()
    assert len(lines) == 2
    assert json.loads(lines[0])["verse"] == "1.2"
