# Book research and TRIZ log · 2026-07-18

Status: adopted. Feeds PRD.md and SPEC.md.

## 1. KDP conditions (researched)

**Ebook.** KDP accepts EPUB (recommended), DOCX, KPF. Hard requirements:
NCX + HTML table of contents (both), semantic HTML headings, images JPEG/PNG
RGB under 5 MB each, alt text on all images (accessibility compliance),
EPUBCheck-clean file (malformed HTML can trigger review holds), verified in
Kindle Previewer before publishing. Kindle CSS support is WebKit-based but
partial; keep styling simple.

**Devanagari risk (the key finding).** Kindle's Indic support is uneven:
KDP lists Hindi/Marathi/etc. as supported book languages, but font
availability varies across device generations, and embedded-font pipelines
for Indic scripts are error-prone. Older e-ink devices may lack Devanagari
glyphs entirely. Mitigations adopted (see TRIZ C3): embed Noto Serif
Devanagari (OFL) in the EPUB; IAST transliteration always adjacent to every
Devanagari passage so no meaning is ever carried by Devanagari alone; book
language set to English (the prose language) so the store treats it as an
English title with Sanskrit content; mūla verses kept short (2 lines) so a
per-verse image fallback remains feasible if Previewer shows tofu.

**Print.** 6×9 in trim (standard for trade non-fiction). No bleed needed
(no edge-to-edge art). Margins: outside min 0.25 in; gutter by page count
(0.375 in under 150 pp up to 0.875 in at 700+ pp; expect ~0.75 in for a
300 to 500 pp book). Interior PDF with embedded fonts; xelatex + fontspec
handles Devanagari. Free KDP ISBN or own ISBN; interior/cover metadata must
match title setup exactly.

**Royalty bands.** 70% ebook royalty requires list price $2.99 to $9.99;
delivery fees scale with file size, so image discipline matters. Print
royalty is 60% of list minus print cost at standard distribution.

**Audiobook (later).** Heavy Sanskrit means narration needs a pronunciation
layer: the IAST + pronunciation appendix doubles as the narrator's guide.
Verse cards are read as: IAST recitation, then translation. Figures and
Lean listings get prose paraphrases (written into the book as figure
captions that work when read aloud, a constraint adopted in SPEC).

## 2. Market and audience research

Closest successful patterns:

- **Gödel, Escher, Bach** (Hofstadter): the proof that a demanding
  cross-domain book can win a general audience if structure itself carries
  the pleasure. Its device: alternating dialogues and chapters. Our
  analogue: alternating narrative chapters and verse cards; the pun,
  the counterexample, and the compiling theorem as recurring characters.
- **The Little Typer / Software Foundations**: proof assistants taught
  through one running example, incrementally.
- Trade Indology (Doniger-style) and practitioner-facing Sanskrit primers:
  demonstrate a real Amazon audience for serious but accessible Indic
  content; none of it touches formal verification.

Category positioning: no existing title occupies "theorem-proved Sanskrit
translation". Categories to file under (ebook allows 3 primary at setup +
keywords): Computers > Artificial Intelligence; Religion & Spirituality >
Hinduism > Sanskrit; Science & Math > Logic. Keywords: Sanskrit, Bhartrhari,
Vakyapadiya, Lean theorem prover, machine translation, Panini grammar,
philosophy of language.

## 3. Audiences (five doors)

| Door | Reader | What must satisfy them |
|---|---|---|
| A | ML / machine-translation engineer | C-TV as an evaluation paradigm; the agent-gate architecture; honest negatives |
| B | Theorem-proving / Lean person | a real, non-toy formalization domain; kernel design; decidability discipline; Navya-Nyāya as type discipline |
| C | Sanskrit literature reader | a complete, readable Brahmakāṇḍa with Devanagari, IAST, fresh translation and commentary |
| D | Vyākaraṇa / śāstra student | Pāṇini-to-Bhartṛhari arc taken seriously; kāraka, sandhi, śābdabodha, paribhāṣā treated as the formal systems they are |
| E | Commentary/vṛtti scholar | the vṛtti treated as the epistemic spine; polysemy registry as editorial rulings; multi-commentary horizon |

Rule adopted: every chapter must name (in its brief) which doors it feeds
and how a reader from any single door gets through it without the others'
prerequisites.

## 4. TRIZ contradiction analysis

Method: contradictions phrased on the 39-parameter matrix, principles from
the classical matrix (triz-engine plugin), then interpreted for the book.

### C1. Multi-audience depth vs readability
Improving: adaptability (35). Worsening: complexity (36).
Matrix: **15 Dynamics, 29 Fluidity, 37 Relative change, 28 Substitution.**
Resolution: a *dynamic* text rather than a compromise text. One narrative
spine readable by everyone; depth carried by clearly-marked layered boxes
("For the engineer", "For the pandit", "In the vrtti") that a reader can
skip without losing the plot; modality substitution: where prose gets
hard, switch medium (diagram, table, worked example, dialogue).

### C2. Verse-by-verse completeness vs length and repetitiveness
Improving: quantity of matter (26). Worsening: ease of operation (33).
Matrix: **35 Parameter change, 29 Fluidity, 25 Self-service, 10 Prior action.**
Resolution: change the *state* of the verse material. All 144 verses appear,
but as uniform compact verse cards (Devanagari, IAST, translation, contract
gist, refuted misreading); 10 thematic chapters follow the corpus's own
section structure; one "featured verse" per chapter gets the full live
treatment. Prior action: Parts I to III teach the machinery once, so cards
can be terse. Self-service: the online edition carries the full apparatus
per verse; the book links to it.

### C3. Devanagari fidelity vs device rendering
Improving: reliability (27). Worsening: adaptability (35).
Matrix: **13 The other way round, 35, 8 Anti-weight, 24 Intermediary.**
Resolution: intermediary carrier. IAST is the load-bearing channel
(renders everywhere); Devanagari is the display channel, embedded Noto
Serif Devanagari, never the sole carrier of any content. Inversion: rather
than making the ebook guarantee the script, make the script's failure
harmless.

### C4. Formal rigor vs beginner accessibility
Improving: measurement accuracy (28). Worsening: ease of operation (33).
Matrix: **1 Segmentation, 13 Inversion, 17 Another dimension, 34 Discard and recover.**
Resolution: segmentation: the complete end-to-end proof pipeline is shown
exactly once (VP 1.1, Chapter 10); all later verses show only deltas.
Inversion: every technical chapter opens with a concrete *mistranslation*
and works backward to the machinery that catches it. Another dimension:
parallel-column tables (Sanskrit category ↔ Lean construct) instead of
serialized prose. Discard and recover: full Lean listings retreat to the
appendix and repository after their first appearance; theorems reappear
as one-line verdicts.

### C5 (bonus). Print/ebook single source vs format-specific needs
Resolved without matrix: single Markdown source, pandoc to EPUB and
xelatex to print PDF; format-specific styling isolated in epub.css and
the LaTeX preamble. Figures monochrome-safe for print.

## 5. Leverage from companion projects

- **Prabodha**: gate-audited loop, append-only ledger, adversarial review;
  the book build gets its own gates (pytest: all 144 verses present,
  Devanagari intact, EPUBCheck clean) and its progress ledger.
- **Pramana** (Navya-Nyāya + solvers): source for Chapter 8's mapping of
  Navya-Nyāya devices onto formal structures.
- **ACD**: the "propose/gate" agent discipline reused for chapter drafting:
  agents draft chapters against briefs; mechanical checks (lint gates) and
  editorial review dispose.
