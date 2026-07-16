"""Full publish pipeline: contracts → Lean gate → static edition.

Usage: uv run python scripts/publish.py
Composes tested components; the Lean build result feeds the honesty of the
site's `verified` badges. Exits non-zero if any gate fails.
"""

import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parents[1] / "src"))

from vallari.leangen import emit_all  # noqa: E402
from vallari.site import build_site  # noqa: E402

ROOT = Path(__file__).parents[1]


def main() -> int:
    n = emit_all(ROOT / "data" / "contracts", ROOT / "lean" / "VakyaVallari")
    print(f"emitted {n} verse modules")

    proc = subprocess.run(["lake", "build"], cwd=ROOT / "lean", capture_output=True, text=True)
    lake_ok = proc.returncode == 0
    print("lake build:", "green" if lake_ok else "FAILED")
    if not lake_ok:
        print(proc.stdout[-2000:], proc.stderr[-500:])

    sorries = subprocess.run(
        ["grep", "-rnE", r"\b(sorry|admit)\b", "lean/VakyaVallari", "lean/VakyaVallari.lean"],
        cwd=ROOT, capture_output=True, text=True,
    )
    zero_sorry = sorries.returncode != 0
    print("zero-sorry:", "PASS" if zero_sorry else "FAIL\n" + sorries.stdout)

    stats = build_site(
        corpus_path=ROOT / "data" / "corpus" / "vakyapadiya.jsonl",
        contracts_dir=ROOT / "data" / "contracts",
        lean_verses_dir=ROOT / "lean" / "VakyaVallari" / "Verses",
        out_dir=ROOT / "site" / "dist",
        lake_build_ok=lake_ok and zero_sorry,
    )
    print("site:", stats)
    return 0 if (lake_ok and zero_sorry) else 1


if __name__ == "__main__":
    raise SystemExit(main())
