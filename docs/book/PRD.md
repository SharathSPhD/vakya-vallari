# PRD · The book of Vākya-Vallarī

Status: adopted 2026-07-18. Companion: SPEC.md (how), PLAN.md (when/who),
2026-07-18-research-and-triz.md (why).

## Product

**Working title:** *The Proven Word: Bhartṛhari's Brahmakāṇḍa, the First
Machine-Verified Translation of a Sanskrit Classic*
**Author:** Dr. Sharath Sathish
**Formats:** Kindle ebook first (EPUB via KDP), paperback 6×9 second
(same source), audiobook later (narration guide built in from day one).
**Length target:** 90,000 to 110,000 words, 350 to 450 print pages.
**Positioning:** the pioneering work of theorem-proved Sanskrit translation
and commentary; the first book to run Pāṇini-to-Bhartṛhari and
Euclid-to-Lean into a single braid and end with compiled theorems about
what a Sanskrit verse means.

## Why this book can win

1. **Unoccupied category.** No competing title exists at the intersection.
   Each door (see below) has an established Amazon readership; the bridge
   itself is the novelty.
2. **Real substance behind it.** The claims are backed by a public
   repository: 144 verified verses, 566 theorems, zero sorry, CI-reproducible.
   The book can say "every verdict in this book compiles" and mean it.
3. **A story, not a manual.** The narrative arc (a tradition that carried
   truth by memory meets a machine that carries commitments by types) is
   emotionally real and structurally mirrored: the paramparā's condensation
   into sūtra parallels the contract's condensation of commentary.

## Audiences and promises (the five doors)

- **A. Machine translation / AI engineers.** Promise: a new, working
  paradigm for translation evaluation (C-TV), plus an anti-fabrication
  agent architecture with receipts.
- **B. Lean / theorem-proving readers.** Promise: an exotic, genuinely
  motivated formalization domain; a small decidable kernel; Navya-Nyāya as
  a type discipline; a research agenda for a Sanskrit-tuned prover.
- **C. Sanskrit literature readers.** Promise: the complete Brahmakāṇḍa,
  Devanagari + IAST + fresh translation + commentary, readable on a Kindle.
- **D. Vyākaraṇa students.** Promise: Pāṇini, kāraka, sandhi, śābdabodha,
  paribhāṣā presented as the formal systems they are, and taken forward.
- **E. Commentary scholars.** Promise: the vṛtti treated as the epistemic
  spine; every interpretive ruling explicit, cited, and checkable.

Acceptance rule per chapter: readable through any single door; the other
doors' material is layered, skippable, and signposted.

## Non-goals

- Not a Sanskrit textbook (no declension drills); Appendix B gives script
  and pronunciation only.
- Not a Lean manual (Chapter 7 + Appendix A teach exactly what the book
  uses); readers wanting more are pointed to standard resources.
- Not a devotional or sectarian reading of śabdādvaita; the book reports
  doctrines and disputes, it does not adjudicate metaphysics.
- No consciousness or AGI claims anywhere.

## KDP scaffolding (launch checklist)

- [ ] EPUB passes EPUBCheck with zero errors (build gate, automated)
- [ ] Kindle Previewer pass on e-ink, tablet, phone profiles (manual)
- [ ] Devanagari renders on all three; if tofu on e-ink, switch mūla lines
      to per-verse PNG with alt text (pipeline supports both modes)
- [ ] NCX + HTML TOC (pandoc emits both; gate checks)
- [ ] All images RGB JPEG/PNG < 5 MB with alt text (gate checks)
- [ ] Title / subtitle / series metadata final; author name matches paper
- [ ] Categories: Computers > AI; Religion & Spirituality > Hinduism;
      Science & Math > Logic. 7 keywords chosen (see research doc)
- [ ] Description (4000 chars) written A/B; look-inside optimized: the
      first 10% must reach the VP 1.1 three-translations hook
- [ ] Ebook price $9.99 (70% band ceiling); paperback priced off print cost
- [ ] Cover: ebook 1600×2560 JPEG; print cover sized from final page count
- [ ] Paperback interior: 6×9, no bleed, gutter per final page count,
      fonts embedded
- [ ] Rights/ISBN: KDP free ISBN for print; DRM off
- [ ] Audiobook readiness: pronunciation appendix doubles as narrator
      guide; figure captions written to be listenable

## Success metrics

- Launch: EPUBCheck-clean file accepted by KDP without content review flags.
- Quality: every technical claim in the book traces to a repo artifact
  (the book inherits the paper's receipts discipline).
- Market: ranks in all three chosen categories' top 100 new releases in
  the first quarter (realistic for niche categories); reviews from at
  least three of the five doors' communities.
