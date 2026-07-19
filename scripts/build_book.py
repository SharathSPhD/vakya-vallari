#!/usr/bin/env python3
"""Build the book: generate Part IV (the Vine) and Appendix D from the
corpus, contracts, and Lean modules; then assemble EPUB (and print PDF).

Generated content is deterministic: every number, verse line, and theorem
name comes from committed artifacts. Editorial prose for the ten featured
walkthroughs lives in FEATURED below and in book/src/intros/.

Usage:
  python scripts/build_book.py generate    # write book/generated/
  python scripts/build_book.py epub        # generate + build EPUB
  python scripts/build_book.py pdf         # generate + build print PDF
"""

from __future__ import annotations

import datetime
import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CORPUS = ROOT / "data/corpus/vakyapadiya.jsonl"
CONTRACTS = ROOT / "data/contracts"
VERSES = ROOT / "lean/VakyaVallari/Verses"
SRC = ROOT / "book/src"
GEN = ROOT / "book/generated"
LEDGER = ROOT / "research/book_ledger.jsonl"

# Part IV chapters: (number, slug, corpus section title, featured verse)
VINE = [
    (13, "word-brahman", "The Word-Brahman", "1.1"),
    (14, "grammar-as-the-path", "Grammar as the Path", "1.14"),
    (15, "eternal-connection", "The Eternality of the Word-Meaning Relation", "1.23"),
    (16, "limits-of-inference", "The Limits of Inference", "1.34"),
    (17, "sphota-doctrine", "The Sphota Doctrine", "1.46"),
    (18, "phoneme-word-sentence", "Unity and Plurality: Phoneme, Word, Sentence", "1.75"),
    (19, "phoneticians-report", "Rival Accounts of Sound and Word", "1.102"),
    (20, "cognition-interwoven", "All Cognition is Word-Interwoven", "1.123"),
    (21, "necessity-of-tradition", "The Necessity of Tradition", "1.132"),
    (22, "levels-of-speech", "The Levels of Speech", "1.142"),
]

CHAPTER_TITLES = {
    13: "The Word-Brahman",
    14: "Grammar as the Path",
    15: "The Eternal Connection",
    16: "The Limits of Inference",
    17: "The Sphoṭa Doctrine",
    18: "Phoneme, Word, Sentence",
    19: "The Phoneticians' Report",
    20: "Cognition Interwoven with the Word",
    21: "The Necessity of Tradition",
    22: "The Levels of Speech",
}

# Editorial prose for featured walkthroughs (kept short; the machinery was
# taught in Parts II and III, so each walkthrough shows only what is new).
FEATURED = {
    "1.1": (
        "Chapter 10 walked this verse end to end. Here it stands at the head "
        "of its own section, and one detail deserves a second look: the "
        "contract's single denial. The commentary does not merely prefer "
        "vivarta over pariṇāma; it rules pariṇāma out. That is why the "
        "transformation reading fails as contradicted rather than unlicensed. "
        "A denial is a stronger editorial act than an omission, and the "
        "theorem records the difference."
    ),
    "1.14": (
        "The rejected reading here demotes grammar from a discipline of "
        "liberation to a social convention. The contract blocks it with a "
        "predication axiom whose citation is the commentary's own strongest "
        "sentence. Watch how little formal machinery the refutation needs: "
        "one sort, one predication, one missing license."
    ),
    "1.23": (
        "This verse fixes the eternality of the word-meaning relation. The "
        "interesting formal move is the relation axiom's direction: the "
        "connection is given, not made. A mistranslation that renders the "
        "relation as convention asserts a claim no axiom entails, and fails "
        "unlicensed."
    ),
    "1.34": (
        "The section's argument climaxes in a verse about inference's "
        "dependence on the word. The rejected reading grants reasoning an "
        "autonomy the text denies. The contract encodes the dependence as a "
        "relation with the cognition sort on both ends, and the refutation "
        "is a sort-checked failure of license."
    ),
    "1.46": (
        "The fire-in-wood verse carries the registry's most delicate ruling: "
        "here, and only here in its neighborhood, śabda names the Absolute "
        "itself. The featured point is the homonym registry entry doing real "
        "work: without the registered second sense, this contract would "
        "collide with every canonical śabda contract in the corpus."
    ),
    "1.75": (
        "Sphoṭa is indivisible and non-temporal; the sounds that manifest it "
        "are sequential. The rejected reading temporalizes sphoṭa itself. "
        "The contract separates the two with distinct entities and a "
        "manifestation relation, and the mistranslation fails by asserting "
        "sequence of the wrong entity."
    ),
    "1.102": (
        "From here to 1.106 the text reports the phoneticians' rival "
        "terminology, in which sphoṭa names the first-produced sound. The "
        "featured point is quarantine: the registry gives the doxographic "
        "span its own sense, so the report never contaminates the doctrine. "
        "The theorems on both sides stay green."
    ),
    "1.123": (
        "No cognition without the word interwoven in it: the section's "
        "thesis verse. The contract renders the interweaving as a relation "
        "on the cognition sort, and the rejected reading, which makes "
        "language a dispensable label on thought, asserts exactly what the "
        "denial forbids."
    ),
    "1.132": (
        "The verse on the eternal seed-order grounds the registry's veda "
        "split: the recited corpus elsewhere, the aeon-persisting bīja here. "
        "One term, two sorts, each with its one-sentence justification. The "
        "gate would have flagged either use as drift without the ruling."
    ),
    "1.142": (
        "The levels-of-speech sequence closes the kāṇḍa. The featured "
        "contract stratifies vaikharī, madhyamā, and paśyantī as distinct "
        "entities under one power, and the rejected reading that collapses "
        "them into registers of volume fails unlicensed. The vine ends "
        "where it began: distinctions held, by theorem."
    ),
}

_ID = re.compile(r"1\.(\d+)")

# ---------------------------------------------------------------------------
# IAST normalization for corpus-derived display text.
#
# The corpus commentary and translation fields were authored in bare ASCII
# romanization (sphota, Bhartrhari). The hand-authored chapters use IAST
# (sphoṭa, Bhartṛhari). This vetted, word-boundary map normalizes the
# corpus-derived text at book-build time so the whole book reads in one
# convention. It is presentation only: contracts, Lean identifiers, and the
# corpus files themselves are untouched (Lean requires ASCII identifiers).
# Longest keys are applied first to avoid substring collisions.
# ---------------------------------------------------------------------------
IAST_MAP = {
    "vaiyakarana": "vaiyākaraṇa",
    "sabdatattva": "śabdatattva",
    "Vakyapadiya": "Vākyapadīya",
    "purvapaksa": "pūrvapakṣa",
    "Bhartrhari": "Bhartṛhari",
    "Katyayana": "Kātyāyana",
    "vyakarana": "vyākaraṇa",
    "Patanjali": "Patañjali",
    "siddhanta": "siddhānta",
    "apasabda": "apaśabda",
    "samskara": "saṃskāra",
    "pratyaksa": "pratyakṣa",
    "upanisad": "upaniṣad",
    "samhita": "saṃhitā",
    "pasyanti": "paśyantī",
    "vaikhari": "vaikharī",
    "madhyama": "madhyamā",
    "parinama": "pariṇāma",
    "anukara": "anukāra",
    "pratibha": "pratibhā",
    "anumana": "anumāna",
    "yogyata": "yogyatā",
    "abhyasa": "abhyāsa",
    "upadana": "upādāna",
    "sadhana": "sādhana",
    "vedanta": "vedānta",
    "prakrta": "prākṛta",
    "vaikrta": "vaikṛta",
    "darsana": "darśana",
    "pramana": "pramāṇa",
    "avidya": "avidyā",
    "sphota": "sphoṭa",
    "aksara": "akṣara",
    "Panini": "Pāṇini",
    "sastra": "śāstra",
    "asadhu": "asādhu",
    "turiya": "turīya",
    "atman": "ātman",
    "moksa": "mokṣa",
    "kāraka": "kāraka",
    "karaka": "kāraka",
    "sruti": "śruti",
    "smrti": "smṛti",
    "agama": "āgama",
    "jnana": "jñāna",
    "sakti": "śakti",
    "varna": "varṇa",
    "sadhu": "sādhu",
    "sabda": "śabda",
    "vakya": "vākya",
    "vrtti": "vṛtti",
    "karya": "kārya",
    "nada": "nāda",
    "bija": "bīja",
    "rupa": "rūpa",
    "krti": "kṛti",
    "dosa": "doṣa",
    "tika": "ṭīkā",
}
_IAST_RES = [
    (re.compile(r"\b" + k + r"(s?)\b"), v)
    for k, v in sorted(IAST_MAP.items(), key=lambda kv: -len(kv[0]))
] + [
    (re.compile(r"\b" + k[0].upper() + k[1:] + r"(s?)\b"), v[0].upper() + v[1:])
    for k, v in sorted(IAST_MAP.items(), key=lambda kv: -len(kv[0]))
    if k[0].islower()
]


def normalize_iast(text: str) -> str:
    for rx, repl in _IAST_RES:
        text = rx.sub(lambda m, r=repl: r + m.group(1), text)
    # Display typography: the corpus prose uses em-dashes; the book's house
    # style does not. Spaced em-dashes become commas (appositive register),
    # unspaced ones a plain space-comma; double conversion artifacts cleaned.
    text = text.replace(" — ", ", ").replace("— ", ", ").replace(" —", ",").replace("—", ", ")
    text = text.replace(" ,", ",").replace(",,", ",")
    return text


def _key(vid: str):
    m = _ID.match(vid)
    return (int(m.group(1)), vid)


def _module_name(vid: str) -> str:
    return "V" + vid.replace(".", "_").replace("-", "_")


def load_book1() -> list[dict]:
    recs = [json.loads(x) for x in CORPUS.read_text().splitlines()]
    k1 = [r for r in recs if r["kanda"] == 1]
    k1.sort(key=lambda r: _key(r["id"]))
    return k1


def group_by_section(k1: list[dict]) -> dict[str, list[dict]]:
    groups: dict[str, list[dict]] = {}
    current = None
    for r in k1:
        if r.get("section"):
            current = r["section"]
        groups.setdefault(current, []).append(r)
    return groups


def _first_sentence(text: str, limit: int = 260) -> str:
    text = " ".join(text.split())
    m = re.search(r"(?<=[.!?])\s", text)
    s = text[: m.start()] if m and m.start() < limit else text[:limit]
    return s.rstrip() + ("" if s.endswith((".", "!", "?")) else "…")


def _card(r: dict, contract: dict | None) -> str:
    deva = "  \n".join(r["mula_deva"])
    iast = "  \n".join(r["mula_iast"])
    out = [f"### {r['id']}", ""]
    out += ["::: {.deva}", deva, ":::", ""]
    out += ["::: {.iast}", iast, ":::", ""]
    out += [f"> {normalize_iast(r['translation'].strip())}", ""]
    # Full commentary, normalized to IAST for display. Nothing is truncated:
    # the commentary is the edition's most distinctive asset and the reader
    # gets all of it (review 2026-07-19 §3, option b).
    commentary = normalize_iast(" ".join(r["commentary"].split()))
    out += [commentary, ""]
    if contract:
        ne, na, nd = (
            len(contract.get("entities", [])),
            len(contract.get("axioms", [])),
            len(contract.get("denials", [])),
        )
        out += [
            f"*Contract.* {ne} entities · {na} axioms · {nd} denials; "
            f"adequacy proved in `{_module_name(r['id'])}`.",
            "",
        ]
        rr = contract.get("rejected_readings", [])
        if rr:
            x = rr[0]
            why = normalize_iast(_first_sentence(x.get("why", ""), 200))
            out += [
                f"*Refuted.* “{normalize_iast(x['rendering'].strip())}” "
                f"({x['expect']}): {why}",
                "",
            ]
    if r.get("contested"):
        out += [
            "::: {.contested}",
            f"*Contested.* {normalize_iast(r['contested'].strip())}",
            ":::",
            "",
        ]
    return "\n".join(out)


def _featured(vid: str, r: dict, contract: dict) -> str:
    lean_path = VERSES / f"{_module_name(vid)}.lean"
    theorems = re.findall(r"^theorem\s+(\w+)", lean_path.read_text(), re.M)
    out = [f"## Featured verse: {vid} in slow motion", ""]
    out += [FEATURED[vid], ""]
    out += ["**Axioms, each with its verbatim license.**", ""]
    for a in contract.get("axioms", []):
        kind = a["kind"]
        if kind == "identity":
            head = f"identity `{a['a']} = {a['b']}`"
        elif kind == "relation":
            head = f"relation `{a['name']}({a['from']} → {a['to']})`"
        else:
            head = f"predication `{a['name']}({a['of']})`"
        out += [f"- {head}: “{normalize_iast(a['cite'])}”"]
    dn = contract.get("denials", [])
    if dn:
        out += ["", "**Denials.**", ""]
        for a in dn:
            if a["kind"] == "relation":
                head = f"`{a['name']}({a['from']} → {a['to']})`"
            elif a["kind"] == "identity":
                head = f"`{a['a']} = {a['b']}`"
            else:
                head = f"`{a['name']}({a['of']})`"
            out += [f"- {head}: “{normalize_iast(a['cite'])}”"]
    out += ["", "**Rejected readings and their compiled fates.**", ""]
    for x in contract.get("rejected_readings", []):
        out += [
            f"- “{normalize_iast(x['rendering'].strip())}” → **{x['expect']}**. "
            f"{normalize_iast(x['why'].strip())}"
        ]
    out += [
        "",
        f"**Theorems in `{_module_name(vid)}.lean`.** "
        + ", ".join(f"`{t}`" for t in theorems)
        + ". All close by `decide`; the build carries zero `sorry`.",
        "",
    ]
    return "\n".join(out)


def generate() -> list[Path]:
    GEN.mkdir(parents=True, exist_ok=True)
    k1 = load_book1()
    groups = group_by_section(k1)
    written = []
    for num, slug, section, feat in VINE:
        rs = groups[section]
        first, last = rs[0]["id"], rs[-1]["id"]
        title = CHAPTER_TITLES[num]
        parts = [f"# {num} · {title}", ""]
        parts += [f"*Verses {first} to {last} · {len(rs)} units*", ""]
        intro = SRC / "intros" / f"vine-{num}.md"
        if intro.exists():
            parts += [intro.read_text().strip(), ""]
        else:
            parts += [
                "<!-- intro pending: see docs/book/PLAN.md chapters 13–22 -->",
                "",
            ]
        fr = next(r for r in rs if r["id"] == feat)
        contract = json.loads((CONTRACTS / f"{feat}.json").read_text())
        parts += [_featured(feat, fr, contract), ""]
        parts += ["## The verses", ""]
        for r in rs:
            cpath = CONTRACTS / f"{r['id']}.json"
            c = json.loads(cpath.read_text()) if cpath.exists() else None
            parts += [_card(r, c), ""]
        p = GEN / f"ch-{num}-{slug}.md"
        p.write_text("\n".join(parts))
        written.append(p)
    # Appendix D: theorem index. Compact run-in entries rather than a wide
    # table: long theorem identifiers overflow a 6x9 print measure, and
    # run-in lines reflow cleanly on both Kindle and paper.
    lines = [
        "# Appendix D · Theorem Index",
        "",
        "Generated from the Lean modules. One entry per verse: the adequacy "
        "theorem, then each refutation theorem with its registered failure "
        "mode, then auxiliary sort-error lemmas where the module carries "
        "them. Every theorem closes by `decide`; the build carries zero "
        "`sorry`.",
        "",
    ]
    for r in k1:
        vid = r["id"]
        lp = VERSES / f"{_module_name(vid)}.lean"
        if not lp.exists():
            continue
        thms = re.findall(r"^theorem\s+(\w+)", lp.read_text(), re.M)
        c = json.loads((CONTRACTS / f"{vid}.json").read_text())
        modes = {x["label"]: x["expect"] for x in c.get("rejected_readings", [])}
        sortl = [t for t in thms if t.endswith("_sort_error")]
        refs = [t for t in thms if t.endswith("_inadequate")]
        entry = [f"**{vid}**: `accepted_adequate`"]
        for t in refs:
            entry.append(f"`{t}` ({modes.get(t[: -len('_inadequate')], '?')})")
        if sortl:
            entry.append("sort-error lemmas: " + ", ".join(f"`{t}`" for t in sortl))
        lines.append("; ".join(entry) + ".")
        lines.append("")
    p = GEN / "app-d-theorem-index.md"
    p.write_text("\n".join(lines) + "\n")
    written.append(p)
    _ledger("generate", {"files": len(written)})
    return written


ORDER = [
    "src/000-copyright.md",
    "src/00a-preface.md",
    "src/00-how-to-read.md",
    "src/01-note-on-sanskrit.md",
    "src/part-1.md",
    "src/ch-01-the-verse.md",
    "src/ch-02-library-without-paper.md",
    "src/ch-03-paninis-machine.md",
    "src/ch-04-grammar-to-metaphysics.md",
    "src/part-2.md",
    "src/ch-05-what-is-a-proof.md",
    "src/ch-06-propositions-as-types.md",
    "src/ch-07-lean-in-an-afternoon.md",
    "src/ch-08-type-theory-india-had.md",
    "src/part-3.md",
    "src/ch-09-commentary-as-specification.md",
    "src/ch-10-contract-of-1-1.md",
    "src/ch-11-machines-that-draft.md",
    "src/ch-12-one-word-many-sorts.md",
    "src/part-4.md",
    "generated/ch-13-word-brahman.md",
    "generated/ch-14-grammar-as-the-path.md",
    "generated/ch-15-eternal-connection.md",
    "generated/ch-16-limits-of-inference.md",
    "generated/ch-17-sphota-doctrine.md",
    "generated/ch-18-phoneme-word-sentence.md",
    "generated/ch-19-phoneticians-report.md",
    "generated/ch-20-cognition-interwoven.md",
    "generated/ch-21-necessity-of-tradition.md",
    "generated/ch-22-levels-of-speech.md",
    "src/part-5.md",
    "src/ch-23-what-is-not-proved.md",
    "src/ch-24-sanskrit-tuned-prover.md",
    "src/ch-25-an-invitation.md",
    "src/app-a-running-the-proofs.md",
    "src/app-b-reading-sanskrit.md",
    "src/app-c-glossary.md",
    "generated/app-d-theorem-index.md",
    "src/app-e-further-reading.md",
    "src/99-about-the-author.md",
]


def build_epub(out: Path | None = None) -> Path:
    out = out or ROOT / "book/dist/the-proven-word.epub"
    out.parent.mkdir(parents=True, exist_ok=True)
    files = [ROOT / "book" / f for f in ORDER]
    missing = [str(f) for f in files if not f.exists()]
    if missing:
        raise SystemExit("missing chapter files:\n" + "\n".join(missing))
    cmd = [
        "pandoc",
        "--from", "markdown+smart",
        "--to", "epub3",
        "--metadata-file", str(ROOT / "book/metadata.yaml"),
        "--css", str(ROOT / "book/style/epub.css"),
        "--epub-embed-font", str(ROOT / "book/assets/fonts/NotoSerifDevanagari.ttf"),
        "--toc", "--toc-depth", "1",
        "--split-level=1" if _pandoc_supports("--split-level") else "--epub-chapter-level=1",
        "-o", str(out),
    ] + [str(f) for f in files]
    subprocess.run(cmd, check=True)
    _ledger("build", {"artifact": _rel(out), "bytes": out.stat().st_size})
    return out


def _rel(p: Path) -> str:
    try:
        return str(p.relative_to(ROOT))
    except ValueError:
        return str(p)


def build_pdf(out: Path | None = None) -> Path:
    out = out or ROOT / "book/dist/the-proven-word-print.pdf"
    out.parent.mkdir(parents=True, exist_ok=True)
    files = [ROOT / "book" / f for f in ORDER]
    cmd = [
        "pandoc",
        "--from", "markdown+smart",
        "--pdf-engine", "xelatex",
        "--metadata-file", str(ROOT / "book/metadata.yaml"),
        "-H", str(ROOT / "book/style/print.tex"),
        "--toc", "--toc-depth", "1",
        "-V", "documentclass=book",
        "-o", str(out),
    ] + [str(f) for f in files]
    subprocess.run(cmd, check=True, cwd=ROOT)
    _ledger("build", {"artifact": _rel(out), "bytes": out.stat().st_size})
    return out


def _pandoc_supports(flag: str) -> bool:
    help_text = subprocess.run(
        ["pandoc", "--help"], capture_output=True, text=True
    ).stdout
    return flag in help_text


def _ledger(event: str, data: dict) -> None:
    LEDGER.parent.mkdir(parents=True, exist_ok=True)
    rec = {
        "ts": datetime.datetime.now(datetime.timezone.utc).isoformat(),
        "event": event,
        **data,
    }
    with LEDGER.open("a") as f:
        f.write(json.dumps(rec) + "\n")


if __name__ == "__main__":
    mode = sys.argv[1] if len(sys.argv) > 1 else "generate"
    generate()
    if mode == "epub":
        print(build_epub())
    elif mode == "pdf":
        print(build_pdf())
