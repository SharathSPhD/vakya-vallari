"""Append-only research ledger (prabodha pattern): one JSON object per line."""

from __future__ import annotations

import datetime
import json
from pathlib import Path


def append_event(path: Path, event: dict) -> None:
    record = {"ts": datetime.datetime.now(datetime.UTC).isoformat(), **event}
    with path.open("a", encoding="utf-8") as f:
        f.write(json.dumps(record, ensure_ascii=False) + "\n")


def read_events(path: Path) -> list[dict]:
    if not path.exists():
        return []
    return [json.loads(line) for line in path.read_text().splitlines() if line.strip()]
