"""CLI gate for a single contract: `python -m vallari.check <contract.json>`.

Prints one error per line and exits non-zero if the contract is inadmissible.
Used by formalization agents for fast local feedback before the Lean gate.
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

from vallari.contracts import load_contract, validate_contract


def main(argv: list[str]) -> int:
    if len(argv) != 1:
        print("usage: python -m vallari.check <contract.json>", file=sys.stderr)
        return 2
    contract_path = Path(argv[0])
    contract = load_contract(contract_path)
    corpus = Path(__file__).parents[2] / "data" / "corpus" / "vakyapadiya.jsonl"
    record = None
    for line in corpus.read_text().splitlines():
        r = json.loads(line)
        if r["id"] == contract.get("verse"):
            record = r
            break
    if record is None:
        print(f"no corpus record for verse {contract.get('verse')!r}")
        return 1
    errors = validate_contract(contract, record)
    for e in errors:
        print(e)
    if not errors:
        print("OK")
    return 0 if not errors else 1


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
