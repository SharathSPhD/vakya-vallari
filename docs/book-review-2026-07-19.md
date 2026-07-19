# *The Proven Word* — adversarial review report

**Date:** 2026-07-19 · **Manuscript:** ~112,000 words, 25 chapters + 5 appendices
**Method:** 7 isolated-context reviewers (fresh context each, one hostile lens apiece) +
3 independent title teams + my own mechanical measurements. Agent claims were
re-verified before inclusion; one was found false and is corrected below.
**Status:** report only — no manuscript changes made.

---

## 1. Headline verdict

The book is **substantively strong and closer to publishable than the problem list
suggests**, but it must not ship in its current state. Two issues are blockers, one of
which is a genuine credibility risk rather than a formatting gap.

The most reassuring result: the **Sanskritist lens came back positive** — "scholarly,
precise, and ready for citation… The field will engage with this seriously, not dismiss
it." That is the hardest audience to satisfy and the one most able to sink the book.
The structure and craft lenses also came back sound. The damage is concentrated in
**disclosure, commercial packaging, and the commentary reduction.**

| Lens | Blockers | Majors | Bottom line |
|---|---|---|---|
| Hostile critic | 1 | 3 | Machine-generation of the translation is not disclosed until Ch. 23 |
| KDP / commercial | 1 | 5 | No copyright page/ISBN/author bio; positioning ambiguous |
| Commentary fidelity | 0 | 3 | Only ~8% of the per-verse commentary reaches the reader |
| Audience hooks | 0 | 3 | Great opening; no reading paths; Ch. 5 and 8 lose readers |
| Sanskritist | 0 | 0 | **Positive** — citable; only ASCII-romanization polish |
| Structure | 0 | 0 | Five-part arc sound; seams well-built |
| Craft | 0 | 0 | Publishable prose; consistent voice |

---

## 2. Blocker 1 — the disclosure problem (fix before anything else)

**The book never tells the reader that the translation and commentary it is verifying
were themselves machine-generated, until Chapter 23 of 25.**

The academic paper states this plainly in its abstract ("A machine-produced English
translation and analytical commentary…"). The book does not. Chapter 1 says the
Vākyapadīya "now exists as a machine-verified translation" without disclosing that the
translation *itself* is machine-made. A reader spends 22 chapters reasonably assuming
they are reading a human translation that a machine checked. That is not what happened.

Why this is a blocker and not a nitpick: a hostile reviewer who discovers this on
page 300 will frame the entire book as concealment, and the framing will stick — it is
the single most quotable attack available against the project. Disclosed properly in
Chapter 1, it is *interesting* (a machine drafted it, a machine gated it, and here is
exactly what that does and does not buy you). Disclosed on page 300, it reads as a
confession.

There is a related circularity the book should name rather than let a critic name: the
contracts encode fidelity to a *machine-generated commentary*, not directly to Iyer or
to the Sanskrit. Chapter 23 says this; Chapters 1 and 9 should say it too.

**Fix:** a short, confident paragraph in Chapter 1 stating the provenance chain
(Iyer 1965 → machine-drafted translation and commentary → machine-drafted contracts
under mechanical gates → Lean verification), plus a sentence in Chapter 9 when the
contract is introduced. Cost: under a page. This converts the book's biggest liability
into part of its argument.

Also in this bucket: **Chapter 1's novelty claim is stronger than Chapter 23 allows**
("the first Sanskrit classic, and the first translation of any text, held to its
commentary this way"). The claim is defensible about the *method*; it reads as a claim
about the translation. Narrow the wording at the point of the claim, not 22 chapters later.

---

## 3. The commentary question (your first question, answered)

**No — the book does not retain the full per-verse commentary. It retains about 8% of it.**

Measured independently, two ways, in agreement:

| Measure | Value |
|---|---|
| Corpus commentary, Book I | 144 verses, **22,534 words** |
| Commentary words reaching the reader as commentary | **~1,700 (≈8%)** |
| Verses whose commentary appears in full | **0 of 144** |
| Verse 1.1: corpus 1,226 chars → book | **166 chars (13%)** |

The cause is one line in `scripts/build_book.py`: each verse is rendered with
`*Gist.* {_first_sentence(commentary)}` — a hard truncation to the first sentence or
260 characters. Every verse, uniformly.

What is lost is not padding. For 1.1 alone the reader loses the *akṣara* pun (which the
commentary itself calls the argument in miniature), the vivarta-vs-pariṇāma contrast that
distinguishes the position from Sāṃkhya, and the Advaita reception history. For 1.75 the
technical *prākṛta*/*vaikṛta dhvani* distinction disappears. Roughly 19,000 words of
philological reasoning do not reach the reader.

**Correction to an agent claim:** one reviewer reported that 7 multi-verse entries
(1.16-17, 1.18-22, 1.24-26, 1.68-69, 1.108-109, 1.110-111, 1.112-113) are missing from
the book. **This is false.** I verified all 144 verse cards exist, including all seven.
No verse is missing.

**Has it improved on the commentary?** In one respect genuinely yes: the book adds
chapter-level intros that give movement-scale argument the raw per-verse commentary never
had, plus one fully-worked featured verse per chapter with axioms, citations, denials and
theorem names. That is real editorial value the corpus lacked. But it is *compensation at
the chapter level for a loss at the verse level* — a reader working through Part IV gets
the shape of the argument and 8% of its substance.

**The decision this forces.** This is a positioning choice, not merely a bug:

- **(a) Keep it a guide.** Cheapest. Requires saying so honestly in the front matter —
  "the verse entries are one-line gists; the full commentary lives at [URL]" — and
  publishing the full commentary online. Currently the book does *not* say this, which is
  the actual defect.
- **(b) Restore the commentary** (recommended if the goal is a lasting edition). Adds
  ~19,000 words (≈17% length increase, well within trade limits) and transforms Part IV
  from a catalogue into the heart of the book. It is also the single change that most
  improves the book for Sanskritists *and* philosophers simultaneously.
- **(c) Middle path.** Restore 2–3 sentences per verse (≈25% retention) and expand
  featured verses from 10 to ~30.

My recommendation: **(b)**, or (c) if length is a hard constraint. The commentary is the
most distinctive asset the project has; the book currently withholds it.

---

## 4. Chapter architecture and coherence — largely sound

The structure lens found **no blockers or majors.** The five-part arc (problem → formal
machinery → method → the verses → limits and invitation) holds, and the two risky seams
(ch-12 → ch-13 into generated material, and ch-22 → ch-23 back out) are explicitly
signposted rather than jarring. Chapter lengths run 2,045–5,470 words and vary by
doctrinal weight rather than randomly.

Two structural observations worth acting on, from the hostile and audience lenses:

- **Method crowds out matter.** Chapters 9, 11 and 23 spend ~12,000 words justifying the
  architecture; Chapters 5–8 spend ~18,000 teaching proof theory. For a book about
  Bhartṛhari, comparatively little space goes to what Bhartṛhari actually *says* beyond
  1.1. Consider compressing 5–8 and moving Ch. 11 (agents drafting) to an appendix —
  and spending the recovered space on §3 option (b).
- **Front matter is too thin to do its job**: `00-how-to-read.md` is 273 words and
  `01-note-on-sanskrit.md` is 181. These are the pages that route five different
  audiences; they are currently a signpost, not a map.

---

## 5. Audience hooks

**The opening works.** Chapter 1 passes the Amazon "Look Inside" test — it opens
narratively, establishes stakes on page 1 (one verse, three incompatible readings), and
promises a resolution. That is the hardest page in the book and it is already right.

Gaps, by audience:

| Audience | Status |
|---|---|
| Philosophers | Best served — Ch. 1, 4, 23 are strong |
| Sanskritists | Well served on rigor; **under-served on content** (the 8% problem) |
| AI / engineers | Served by Ch. 5–8, 11 — but this is also the driest stretch |
| Linguists | Served via Pāṇini (Ch. 3) and sphoṭa; least explicitly addressed |
| General readers | Hooked by Ch. 1, then at risk in Ch. 5 (Gödel) and Ch. 8 (Navya-Nyāya) |

Highest-leverage additions: **concrete reading paths** ("Philosophy route: 1, 4, 13–22,
23"), an **intuitive analogy before the Gödel material**, and a **worked example in
Ch. 8** instead of abstract framework alone.

---

## 6. Sanskritist verdict — the good news

Quoted: *"scholarly, precise, and ready for citation… handles contested doctrinal points
(vivarta vs. pariṇāma, sphoṭa/dhvani, śabdādvaita) with due care… The field will engage
with this seriously, not dismiss it."* Attribution to Iyer 1965 is explicit; the
doxographic verses 1.102–1.113 are correctly quarantined as pūrvapakṣa; the 56 contested
notes are judged a genuine strength.

One real defect, which I measured precisely: **transliteration is inconsistent across the
book's two halves.**

| | bare ASCII (prose) | IAST |
|---|---|---|
| Hand-authored chapters | 11 | 156 |
| Generated chapters | 107 | 86 |

Cause: the corpus commentary field was written without diacritics, so generated chapters
inherit `sphota`/`sabda`/`Bhartrhari` while authored chapters use `sphoṭa`/`śabda`/
`Bhartṛhari`. The book therefore visibly changes romanization convention at Chapter 13.
A Sanskritist will notice immediately. The fix is mechanical (normalize the corpus
commentary field to IAST; it does not touch the contracts or proofs, whose identifiers
must stay ASCII for the Lean parser — a constraint the book already discloses).

---

## 7. Craft

No blockers. Voice is consistent, the hand-authored chapter intros carry the generated
chapters, and the apparatus is expert-level. The one structural risk is **monotony**: the
verse-card template repeats **exactly 144 times** — `*Gist.*`, `*Contract.*`, `*Refuted.*`,
and a Devanagari block, identically, across ten chapters. It is defensible as a reference
format, but combined with the 8% commentary it means Part IV reads as a catalogue.
Restoring the commentary (§3b) fixes the monotony and the fidelity problem in one move.

---

## 8. KDP readiness — mechanical gaps

**Blocker:** no copyright page, no ISBN handling, no legal front matter in the built book
(the rights line lives only in `metadata.yaml`, which readers never see). Also missing:
**about-the-author** (nowhere in 25 chapters), review request, and call-to-action.

Other findings:
- **Stale number in metadata:** description says "350 plausible mistranslations"; the
  current verified count is **361**. Must be corrected before upload.
- **Blurb assumes expertise.** It opens on Bhartṛhari and the commentary tradition as if
  self-evidently interesting. Needs a tiered rewrite: plain-English hook first, domain second.
- **Positioning ambiguity is the biggest commercial risk.** The book offers five doors and
  ranks none. KDP browsers do not shop multi-door books. Pick a primary shelf — the
  commercial lens argues for formal-verification/CS as the lead, with Sanskrit second.
- Length (~112k) is appropriate; adding the commentary keeps it in range.

---

## 9. Titles

`The Proven Word` is clean and has a strong verb, but three independent teams
converged on the same criticism: **it undersells the book and reads as devotional or
legal out of context** ("sounds like a religious self-help book or a detective novel").
It also carries no signal of Sanskrit, AI, or philosophy.

**Recommended shortlist**, in my order:

1. **Reality Has a Grammar** — *Bhartṛhari, the Sphoṭa Doctrine, and the First
   Machine-Verified Translation of a Sanskrit Classic*
   Bold, reversible-idea title with genuine philosophical content; works on a thumbnail;
   the subtitle carries every keyword. Best single balance of oomph and honesty.
2. **Language, All the Way Down** — *Bhartṛhari, Machines, and a Fifteen-Century Argument
   About What Words Are*
   Most broadly appealing; inherits a familiar cadence without being derivative.
3. **The Imperishable Word** — *Bhartṛhari's Vākyapadīya and the Machine That Checked It*
   Draws on *akṣara* (imperishable/syllable) — the pun at the centre of verse 1.1, so the
   title is doing real doctrinal work. Slight risk of a devotional read.
4. **Meaning Compiles** — *An Ancient Sanskrit Philosopher Anticipated Machine
   Verification by Fifteen Centuries*
   Sharpest hook for the AI/tech buyer. Narrower, but that audience pays for specialist books.
5. **The Sphoṭa Verses** — *How Machine Proof Met India's Theory of Indivisible Meaning*
   The Sanskritist-facing option; strongest if you accept a narrower market.

Avoid: *What Language Really Is* (generic, over-promises), *Brahman's Algorithm* (attracts
the wrong readership and risks looking appropriative), *The Vākyapadīya Verified* (opaque
to browsers). Note that diacritics can render as `?` in some Amazon thumbnails — if you
choose a Sanskrit-forward title, test the display or use an undiacriticked cover treatment.

---

## 10. Prioritized action list

**Before upload (non-negotiable)**
1. Disclose machine-generation of translation/commentary in Chapter 1; echo in Ch. 9.
2. Narrow Chapter 1's novelty claim to the method.
3. Add copyright page + ISBN + about-the-author; fix the 350→361 stale number.

**Highest value for the book itself**
4. Restore the per-verse commentary (§3b) — the single change that most improves it.
5. Normalize corpus commentary to IAST, ending the ch-12/13 romanization split.
6. Add reading paths; add an analogy before Gödel; add a worked Navya-Nyāya example.

**Commercial**
7. Choose one primary shelf; rewrite the blurb in tiers; retitle (§9).
8. Compress Ch. 5–8; move Ch. 11 to an appendix; reinvest the space in Part IV.

---

*Full agent transcripts: workflow `wf_c08081aa-9eb`. All quantitative claims in this
report were re-measured against the repository; the one agent claim that failed
verification (missing multi-verse cards) is flagged as false in §3.*
