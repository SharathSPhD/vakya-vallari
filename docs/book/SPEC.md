# SPEC · Book source, structure, and build

Status: adopted 2026-07-18.

## Source layout

```
book/
  metadata.yaml          # pandoc metadata: title, author, lang, rights
  src/                   # one Markdown file per chapter, NN-slug.md
  generated/             # verse-walk chapters + theorem index (built, committed)
  assets/fonts/          # Noto Serif/Sans Devanagari (OFL) + license
  assets/figures/        # monochrome-safe PNG/SVG figures, alt text mandatory
  style/epub.css         # ebook styling (simple, Kindle-safe)
  style/print.tex        # xelatex preamble for the 6x9 print interior
scripts/build_book.py    # corpus -> generated chapters; pandoc orchestration
tests/test_book.py       # book gates
```

## Structure (front matter, five parts, appendices)

Front: title, copyright, *How to Read This Book* (the five doors, reading
tracks), *A Note on Sanskrit* (scripts, IAST, pronunciation pointer).

- **Part I · The Word** (the Sanskrit tradition)
  1. The Verse That Would Not Hold Still
  2. A Library Without Paper
  3. Pāṇini's Machine
  4. From Grammar to Metaphysics
- **Part II · The Proof** (the formal tradition)
  5. What Is a Proof, Really?
  6. Propositions as Types
  7. Lean in an Afternoon
  8. The Type Theory India Already Had
- **Part III · The Bridge**
  9. Commentary as Specification
  10. The Contract of Verse 1.1 (the one full live pipeline)
  11. Machines That Draft, Gates That Judge
  12. One Word, Many Sorts
- **Part IV · The Vine** (verse walk; chapters mirror the corpus's own
  ten sections; every one of the 144 units appears as a verse card;
  one featured verse per chapter gets the live treatment)
  13. The Word-Brahman (1.1–1.10) · featured 1.1 (recap + deepening)
  14. Grammar as the Path (1.11–1.22) · featured 1.14
  15. The Eternal Connection (1.23–1.31) · featured 1.23
  16. The Limits of Inference (1.32–1.43) · featured 1.34
  17. The Sphoṭa Doctrine (1.44–1.69) · featured 1.46
  18. Phoneme, Word, Sentence (1.70–1.101) · featured 1.75
  19. The Phoneticians' Report (1.102–1.122) · featured 1.102
  20. Cognition Interwoven with the Word (1.123–1.131) · featured 1.123
  21. The Necessity of Tradition (1.132–1.141) · featured 1.132
  22. The Levels of Speech (1.142–1.155) · featured 1.142
- **Part V · Horizons**
  23. What the Theorems Do Not Prove
  24. Toward a Sanskrit-Tuned Prover
  25. An Invitation
- **Appendices**
  A. Running the Proofs (install, repo, CI)
  B. Reading and Saying Sanskrit (Devanagari table, IAST, pronunciation;
     doubles as audiobook narrator guide)
  C. Glossary (Sanskrit ↔ formal, two-way)
  D. Theorem Index (generated: verse → theorems → failure modes)
  E. Sources and Further Reading

## Verse card (the Part IV unit)

```
### 1.42
[Devanagari mūla, centered, Noto Serif Devanagari]
[IAST, italic]
[Translation, roman]
Gist: one or two sentences distilled from the commentary.
Contract: entities/axioms summary in one line.
Refuted: "..." (mode: contradicted | unlicensed) — one line on why.
[Contested note, when the edition carries one]
```

Featured verses replace the one-liners with the full walkthrough:
commentary sentences, contract JSON excerpt, generated Lean, theorem
verdicts, and prose reading of what the machine did.

## Style rules (all prose)

- Third person for the system; first person plural sparingly for the
  reader-and-author journey ("we now have both halves").
- No em-dashes. Short sentences. No unexplained jargon at first use.
- Sanskrit: Devanagari + IAST on first occurrence of any verse text;
  IAST alone acceptable in running prose; translations always present.
  Devanagari never the sole carrier of content (TRIZ C3).
- Layered boxes, exactly three kinds, used sparingly:
  `::: engineer` (formal/computational depth), `::: pandit`
  (śāstric depth), `::: vrtti` (what the commentary itself says).
- Every figure: monochrome-safe, alt text, caption that works read aloud.
- Every technical claim carries a receipt line (repo path or paper §).
- Lean code: full listings only in Chapters 7 and 10 and Appendix A;
  elsewhere one-line verdicts.
- Each chapter ends with *The thread so far* (2 to 4 sentences) and
  *Doors* (one line per audience door served).

## Build

- **EPUB:** `pandoc` with metadata.yaml, epub.css, embedded fonts,
  `--toc` (NCX + nav), chapter files in order, cover image.
- **Print PDF:** xelatex via pandoc with style/print.tex: 6×9 trim,
  gutter margins by page count, fontspec (TeX Gyre Pagella + Noto Serif
  Devanagari via `\newfontfamily\deva`), microtype off for Devanagari runs.
- **Gates (tests/test_book.py):**
  1. all 144 Book-I ids appear exactly once across Part IV,
  2. every Devanagari mūla line in the corpus appears verbatim in its card,
  3. IAST adjacency: no Devanagari block without an IAST sibling,
  4. EPUB builds; EPUBCheck reports zero errors,
  5. all images have alt text; none over 5 MB,
  6. no em-dash characters in prose sources,
  7. chapter files match the SPEC list exactly (no orphans, no gaps).
- Book progress ledger: `research/book_ledger.jsonl`, same event grammar
  as the formalization ledger (draft/gate/reject/repair/accept).

## Drafting workflow (agents propose, gates dispose)

Each chapter has a brief (PLAN.md): thesis, beats, doors served, sources
(repo paths), length band. Drafting agents write to `book/src/`; lint
gates (style rules above) run mechanically; editorial review merges.
Generated chapters (Part IV cards, Appendix D) come from
`scripts/build_book.py` off the corpus, contracts, and Lean modules;
featured-verse walkthroughs are hand-written into the generator's
templates per chapter.
