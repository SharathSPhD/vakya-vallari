"""Build the static edition: corpus + contracts + proof status → HTML.

A verse's proof badge is honest by construction:
- verified     — contract exists, Lean module emitted, and the build is green
- contracted   — contract exists but no green proof yet
- unformalized — no contract yet
"""

from __future__ import annotations

import html
import json
import re
from pathlib import Path

from vallari.essay import essay_page
from vallari.leangen import module_name

_CSS = """
:root { --fg:#1c1917; --bg:#fffdf8; --muted:#6b6257; --card:#f6f1e7; --accent:#7c2d12;
        --ok:#166534; --mid:#92400e; --none:#57534e; }
@media (prefers-color-scheme: dark) {
  :root { --fg:#e7e0d3; --bg:#1a1713; --muted:#a39b8b; --card:#26221c; --accent:#f59e0b;
          --ok:#4ade80; --mid:#fbbf24; --none:#a8a29e; }
}
body { font-family: Georgia, 'Noto Serif', serif; color:var(--fg); background:var(--bg);
       max-width: 52rem; margin: 0 auto; padding: 2rem 1rem; line-height: 1.6; }
h1,h2,h3 { font-weight: normal; }
a { color: var(--accent); }
.deva { font-size: 1.25rem; line-height: 2; }
.iast { color: var(--muted); font-style: italic; }
.verse { background: var(--card); border-radius: .5rem; padding: 1rem 1.25rem; margin: 1.5rem 0; }
.badge { font-size:.75rem; font-family: ui-monospace, monospace; padding:.1rem .5rem;
         border-radius:1rem; border:1px solid currentColor; }
.badge.verified { color: var(--ok); } .badge.contracted { color: var(--mid); }
.badge.unformalized { color: var(--none); }
.badge.doxographic { color: var(--mid); border-style: dashed; }
.reported { border-left: 3px solid var(--mid); padding-left:.6rem; }
.commentary { margin-top: .75rem; } .contested { border-left: 3px solid var(--mid);
  padding-left: .75rem; margin-top:.75rem; color: var(--muted); }
pre { background: var(--card); padding: 1rem; border-radius:.5rem; overflow-x:auto;
      font-size:.85rem; line-height:1.45; }
.stats { display:flex; gap:2rem; flex-wrap:wrap; } .stats div { text-align:center; }
.stats b { font-size:1.6rem; display:block; }
cite { display:block; color:var(--muted); font-size:.9rem; }
"""


def _page(title: str, body: str) -> str:
    return (
        "<!doctype html><html lang='en'><head><meta charset='utf-8'>"
        "<meta name='viewport' content='width=device-width, initial-scale=1'>"
        f"<title>{html.escape(title)}</title><style>{_CSS}</style></head>"
        f"<body>{body}<footer><p><a href='index.html'>Vākya-Vallarī</a> — "
        "the verified Vākyapadīya. Proof badges are mechanical: "
        "<em>verified</em> means the adequacy theorem compiled.</p></footer></body></html>"
    )


def _status(record: dict, contracts: set[str], modules: set[str], build_ok: bool) -> str:
    vid = record["id"]
    if vid in contracts and module_name(vid) in modules and build_ok:
        return "verified"
    if vid in contracts:
        return "contracted"
    return "unformalized"


def _is_doxographic(contract: dict | None) -> bool:
    if not contract:
        return False
    return any(a.get("stance") == "reported" for a in contract.get("axioms", []))


def _verse_html(r: dict, status: str, doxographic: bool = False) -> str:
    deva = "<br>".join(html.escape(x) for x in r["mula_deva"])
    iast = "<br>".join(html.escape(x) for x in r["mula_iast"])
    badge = f"<span class='badge {status}'>{status}</span>"
    if doxographic:
        badge += (
            " <span class='badge doxographic' title='reports a pūrvapakṣa "
            "(rival view) the commentary does not endorse'>doxographic</span>"
        )
    proof = f" <a href='proofs/{r['id']}.html'>proof</a>" if status == "verified" else ""
    contested = (
        f"<div class='contested'><strong>contested:</strong> {html.escape(r['contested'])}</div>"
        if r["contested"]
        else ""
    )
    section = f" · {html.escape(r['section'])}" if r.get("section") else ""
    return (
        f"<div class='verse' id='v{r['id']}'><p><strong>{r['id']}</strong>{section} {badge}{proof}</p>"
        f"<p class='deva'>{deva}</p><p class='iast'>{iast}</p>"
        f"<p><strong>{html.escape(r['translation'])}</strong></p>"
        f"<div class='commentary'>{html.escape(r['commentary'])}</div>{contested}</div>"
    )


def _samuddesa_number(unit_title: str) -> int:
    m = re.search(r"\((\d+)\)", unit_title or "")
    return int(m.group(1)) if m else 0


def _axiom_li(a: dict) -> str:
    shown = {k: v for k, v in a.items() if k not in ("cite", "stance")}
    return (
        f"<li><code>{html.escape(json.dumps(shown, ensure_ascii=False))}</code>"
        f"<cite>“{html.escape(a['cite'])}”</cite></li>"
    )


def _proof_page(record: dict, contract: dict, lean_src: str) -> str:
    endorsed = [a for a in contract["axioms"] if a.get("stance", "endorsed") == "endorsed"]
    reported = [a for a in contract["axioms"] if a.get("stance") == "reported"]
    ax = "".join(_axiom_li(a) for a in endorsed)
    rep = "".join(_axiom_li(a) for a in reported)
    dn = "".join(
        f"<li><code>{html.escape(json.dumps({k: v for k, v in d.items() if k != 'cite'}, ensure_ascii=False))}</code>"
        f"<cite>“{html.escape(d['cite'])}”</cite></li>"
        for d in contract.get("denials", [])
    )
    rej = "".join(
        f"<li><em>“{html.escape(x['rendering'])}”</em> — {html.escape(x['why'])}</li>"
        for x in contract.get("rejected_readings", [])
    )
    dox_badge = (
        " <span class='badge doxographic'>doxographic</span>" if reported else ""
    )
    dox_note = (
        "<p class='reported'>This verse is <strong>doxographic</strong>: the "
        "commentary reports a rival view (pūrvapakṣa) it does not itself endorse. "
        "Reported axioms are held separately in the Lean contract "
        "(<code>Contract.reported</code>); they license a faithful translation of "
        "the report without being asserted as Bhartṛhari's doctrine.</p>"
        if reported
        else ""
    )
    body = (
        f"<h1>Proof — Verse {record['id']}{dox_badge}</h1>"
        f"<p class='deva'>{'<br>'.join(html.escape(x) for x in record['mula_deva'])}</p>"
        f"<p><strong>{html.escape(record['translation'])}</strong></p>"
        + dox_note
        + f"<h2>Endorsed axioms (each cite is verbatim commentary)</h2><ul>{ax}</ul>"
        + (
            f"<h2>Reported (pūrvapakṣa) axioms — commentary reports, does not endorse</h2>"
            f"<ul class='reported'>{rep}</ul>"
            if rep
            else ""
        )
        + (f"<h2>Denials</h2><ul>{dn}</ul>" if dn else "")
        + (f"<h2>Rejected readings (refuted by compiled theorems)</h2><ul>{rej}</ul>" if rej else "")
        + f"<h2>Lean module</h2><pre>{html.escape(lean_src)}</pre>"
    )
    return _page(f"Proof {record['id']} — Vākya-Vallarī", body)


def build_site(
    corpus_path: Path,
    contracts_dir: Path,
    lean_verses_dir: Path,
    out_dir: Path,
    lake_build_ok: bool,
) -> dict:
    records = [json.loads(x) for x in corpus_path.read_text().splitlines()]
    contracts = {p.stem for p in contracts_dir.glob("*.json")}
    modules = {p.stem for p in lean_verses_dir.glob("*.lean")}
    out_dir.mkdir(parents=True, exist_ok=True)
    (out_dir / "proofs").mkdir(exist_ok=True)

    statuses = {r["id"]: _status(r, contracts, modules, lake_build_ok) for r in records}

    doxographic: dict[str, bool] = {}
    for r in records:
        if r["id"] in contracts:
            c = json.loads((contracts_dir / f"{r['id']}.json").read_text())
            doxographic[r["id"]] = _is_doxographic(c)
        else:
            doxographic[r["id"]] = False

    # Group pages: kanda 1, kanda 2, kanda 3 by samuddeśa.
    pages: dict[str, list[dict]] = {}
    titles: dict[str, str] = {}
    for r in records:
        if r["kanda"] == 3:
            n = _samuddesa_number(r.get("unit_title") or "")
            key = f"kanda-3-{n:02d}"
            titles[key] = r.get("unit_title") or "Pada-kāṇḍa"
        else:
            key = f"kanda-{r['kanda']}"
            titles[key] = {1: "Brahma-kāṇḍa", 2: "Vākya-kāṇḍa"}[r["kanda"]]
        pages.setdefault(key, []).append(r)

    for key, rs in pages.items():
        body = f"<h1>{html.escape(titles[key])}</h1>" + "".join(
            _verse_html(r, statuses[r["id"]], doxographic[r["id"]]) for r in rs
        )
        (out_dir / f"{key}.html").write_text(_page(titles[key], body))

    verified = [r for r in records if statuses[r["id"]] == "verified"]
    for r in verified:
        contract = json.loads((contracts_dir / f"{r['id']}.json").read_text())
        lean_src = (lean_verses_dir / f"{module_name(r['id'])}.lean").read_text()
        (out_dir / "proofs" / f"{r['id']}.html").write_text(
            _proof_page(r, contract, lean_src)
        )

    stats = {
        "verses": len(records),
        "verified": len(verified),
        "contracted": sum(1 for s in statuses.values() if s == "contracted"),
        "contested": sum(1 for r in records if r["contested"]),
        "doxographic": sum(1 for v in doxographic.values() if v),
    }
    nav = "".join(
        f"<li><a href='{k}.html'>{html.escape(titles[k])}</a> ({len(pages[k])} verses)</li>"
        for k in sorted(pages)
    )
    vlist = "".join(
        f"<li><a href='proofs/{r['id']}.html'>Verse {r['id']}</a></li>" for r in verified
    )
    body = (
        "<h1>Vākya-Vallarī — the verified Vākyapadīya</h1>"
        "<p>A living edition of Bhartṛhari's <em>Vākyapadīya</em>: Devanagari mūla, IAST, "
        "an original English translation and commentary — and, verse by verse, "
        "machine-checked adequacy proofs in Lean 4. A <em>verified</em> badge means the "
        "translation's reading provably satisfies a contract whose every axiom quotes "
        "the commentary verbatim, and rival misreadings are refuted by compiled theorems.</p>"
        f"<div class='stats'><div><b>{stats['verses']}</b>verses</div>"
        f"<div><b>{stats['verified']}</b>verified</div>"
        f"<div><b>{stats['contracted']}</b>contracted</div>"
        f"<div><b>{stats['contested']}</b>contested</div></div>"
        f"<h2>Books</h2><ul>{nav}</ul>"
        f"<h2>Verified verses</h2><ul>{vlist}</ul>"
        "<p>Honesty boundary: Lean verifies the internal coherence of the formalization — "
        "that the accepted reading satisfies the contract and rivals do not. Whether the "
        "contract is faithful to Bhartṛhari is a human-auditable question; every axiom "
        "carries its verbatim citation for exactly that audit.</p>"
    )
    (out_dir / "edition.html").write_text(_page("Vākya-Vallarī", body))
    (out_dir / "index.html").write_text(essay_page(stats))
    return stats
