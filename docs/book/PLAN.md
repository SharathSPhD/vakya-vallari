# PLAN · Drafting map and chapter briefs

Status: adopted 2026-07-18. Workflow: agents draft against these briefs;
mechanical gates + editorial pass dispose; ledger records events.

Length bands: narrative chapters 3,500 to 5,000 words; Part IV intros
800 to 1,500 words plus generated cards; appendices as needed.

## Milestones

- M-B1: scaffold + generator + gates green with placeholder chapters
- M-B2: Parts I to III and V drafted, gates green
- M-B3: Part IV generated with all 10 featured walkthroughs
- M-B4: EPUB + print PDF build clean; EPUBCheck zero errors
- M-B5: front/back matter, description, keywords; KDP checklist complete
- M-B6: cover; Kindle Previewer manual pass; publish

## Chapter briefs

### 1 · The Verse That Would Not Hold Still
Thesis: one Sanskrit verse, three grammatical translations, three
incompatible worldviews; only the commentary disambiguates; the book's
promise is a machine that holds translations to commentary. Beats: open
scene reciting VP 1.1 (Devanagari + IAST + word gloss table); the three
renderings side by side; why dictionaries and grammar cannot decide
(śabdatattva, vivarta vs pariṇāma, the akṣara pun); what a "compiled
verdict" looks like (one-line preview, no code); map of the book and the
five doors. Doors: all. Sources: paper §1, corpus 1.1, contract 1.1.

### 2 · A Library Without Paper
Thesis: the paramparā carried a civilization's knowledge orally for
centuries; oral bandwidth forced extreme condensation (sūtra style), and
condensation created the need for unpacking (vṛtti, ṭīkā); commentary is
not decoration, it is the decompression algorithm, and its fidelity is
the whole game. Beats: guru-śiṣya transmission and Vedic recitation
technology (pada/krama/ghana pāṭha as error-correcting codes); śruti vs
smṛti; "a sūtra rejoices in saving half a syllable"; the commentary stack
(sūtra, vṛtti, bhāṣya, ṭīkā, ṭippaṇī) as versioned interpretation layers;
what is lost and contested when unpacking (why 286 verses in this corpus
carry contested notes); the engineering reading: compression +
error-correction + decompression spec. Doors: C, E lead; A, B via the
codec framing. Sources: corpus contested notes; standard Indology
background (verifiable general knowledge only, no invented citations).

### 3 · Pāṇini's Machine
Thesis: the Aṣṭādhyāyī is a formal generative system centuries before
formal systems had a name; the reader should leave able to read one sūtra
mechanically. Beats: śivasūtras and pratyāhāra as compression of the
phoneme lattice; sūtra types (saṃjñā, paribhāṣā, vidhi, adhikāra);
anuvṛtti as scoping; kāraka as typed semantic roles (agent, object,
instrument... with the standard six, table against modern role labels);
sandhi as deterministic rewriting at boundaries (worked example:
vāk + īśa = vāgīśa); a full mechanical walk of one derivation; conflict
resolution among rules (utsarga/apavāda) as priority systems; why
computational linguists call it the earliest generative grammar. Doors: D
lead; A, B via the formal-system reading; C carried by story. Sources:
paper §2.2 citations (Kiparsky, Cardona, Scharf; cite by name only).

### 4 · From Grammar to Metaphysics
Thesis: from Pāṇini through Kātyāyana and Patañjali to Bhartṛhari,
grammar became philosophy; the Vākyapadīya asks what language must be for
grammar to work, and answers: the ground of everything. Beats: the
Mahābhāṣya inheritance; the three books of the Vākyapadīya; śabdādvaita
stated plainly; sphoṭa vs dhvani (the meaning-whole vs the sound
sequence, lamp/light and fire-in-wood images from Book I); levels of
speech (vaikharī, madhyamā, paśyantī); why Book I (Brahmakāṇḍa) is the
metaphysical core; honest scholarly frame (dating debates, vṛtti
authorship debate) in one pandit box. Doors: C, D, E lead. Sources:
paper §2.1; corpus sections list; Iyer 1965 as the primary text (named).

### 5 · What Is a Proof, Really?
Thesis: proof is a social technology for transferring certainty; its
history is a search for carriers that do not decay: memory, text, logic,
machine. Beats: Euclid and the axiomatic move; the 19th-century rigor
crisis; Hilbert's program; Gödel in one honest paragraph (limits, not
mysticism); Principia-style formal proof vs working mathematics;
four-color theorem and the crisis of trust in computer proof; proof
assistants resolve it: small kernel, checkable object; the parallel laid
bare: paramparā's error-correcting recitation and the kernel's
type-checking are both integrity technologies. Doors: B lead; all via
history. Sources: paper §2.4 citations by name.

### 6 · Propositions as Types
Thesis: the deepest idea in modern proof: propositions are types, proofs
are programs; checking a proof is type-checking. Beats: types from
mundane programming up; Curry-Howard gently (implication as function,
conjunction as pair); dependent types (the type that mentions a value);
what "decidable" buys (proof by computation, the decide idea);
one honest engineer box on richer foundations (HoTT/cubical, named as
horizon, citing the cubical Navya-Nyāya work); why Lean: mainstream,
fast kernel, mathlib culture. Doors: B lead; A via "tests vs proofs".
Sources: paper §2.3, §2.4.

### 7 · Lean in an Afternoon
Thesis: the reader builds, in one sitting, a miniature of this book's
kernel: sorts, entities, claims, contracts, and a decidable adequacy
check. Beats: installing is deferred to Appendix A; syntax minimum
(inductive, structure, def, theorem, by decide); build the six-sort
Sorta; Entity; Claim; Contract; entails; Adequate; state and prove a toy
adequacy theorem and a refutation; the reader has now seen every formal
ingredient the real system uses; pointer: the real kernel is under 150
lines (repo path). All code in this chapter must be actual compiling
Lean 4 (test against the repo toolchain). Doors: B lead; A follows; C/D
invited to skim verdicts. Sources: lean/VakyaVallari/*.lean.

### 8 · The Type Theory India Already Had
Thesis: Navya-Nyāya built a discipline of precise cognition-structure
(delimitors, relational nesting, typed absence, śābdabodha) that maps
with almost embarrassing directness onto dependent-type constructs; the
kernel's three design choices come from it. Beats: Navya-Nyāya in
context (Gangeśa onward; technical language of viśeṣya/viśeṣaṇa,
avacchedaka, pratiyogin); śābdabodha (verbal cognition analysis) as the
tradition's own semantic parser; paribhāṣā as metarules = tactics;
the mapping table (avacchedaka ↔ type index/delimiter; paramparā-
sambandha ↔ nested relation values; abhāva with pratiyogin/adhikaraṇa ↔
typed negation-with-evidence; śābdabodha ↔ elaboration); the involution
(absence of absence) proved in the kernel; honest box: what does not map
cleanly. Doors: B, D, E lead. Sources: paper §2.3, §6.2; Ingalls,
Matilal by name; pramana project as prior art.

### 9 · Commentary as Specification
Thesis: compiler people solved "untrusted translator" decades ago;
translation validation transplanted gives C-TV; the commentary is the
spec, the contract is its compiled form, the verbatim-citation rule is
the anti-fabrication gate. Beats: Pnueli's problem and pattern; the
mapping table (optimizer/translator, reference/commentary, validator/
Lean); what a contract contains (entities, axioms, denials, accepted and
rejected readings) with the 1.1 JSON shown in full; the two failure
modes; why verbatim citation converts hallucination risk into string
matching; the verification boundary stated once, plainly (what Lean can
and cannot certify). Doors: A lead; B, E follow. Sources: paper §3, §4.

### 10 · The Contract of Verse 1.1 (the live pipeline)
Thesis: the one complete end-to-end pass, slow motion. Beats: the
commentary sentences (quoted); deriving each axiom with its verbatim
cite; the accepted reading's four claims with translation cites; the two
rejected readings; generation into Lean (the full module, lightly
elided); the theorems compile; what each theorem literally says; what
would break if an editor changed one word; regression as protection of
interpretation. This chapter is the book's heart; write it as
demonstration, not description. Doors: all (this is the bridge made
flesh). Sources: contract 1.1 JSON, V1_1.lean, paper §3.3, §6.3.

### 11 · Machines That Draft, Gates That Judge
Thesis: the contracts were drafted by an agent swarm, and that is safe
only because architecture, not model goodwill, carries the epistemic
load; the gate-catch episodes are the evidence. Beats: the loop (draft,
validate, compile, adjudicate, ledger); the four catch classes with the
real numbers (3 lazy counterexamples, 5 fabricated citations in
quota-degraded output, 2 identifier incidents, 89 sort conflicts);
the fabrication episode told in detail as the design vindicated; the
ledger as replayable history; companion-programme lineage (ACD, Prabodha:
propose/gate/ledger; here the gate is a type-checker); the general
pattern for LLM-assisted scholarship. Doors: A lead; B follows; E gets
the provenance ethics. Sources: paper §7; research/ledger.jsonl.

### 12 · One Word, Many Sorts
Thesis: the consistency gate cannot tell drift from doctrine; the
homonym registry is where mechanical discipline forces editorial
honesty; polysemy becomes data. Beats: the gate rule; the registry
format (gloss + justification + exact verse partition); the three
load-bearing splits told fully (akṣara pun; śabda in the fire-in-wood
verse; sphoṭa doxographic quarantine in 1.102–1.106); the later round
(veda, śruti, vyavasthā, rūpa, sādhu, viparīta, kārya); 41 terms, 91
senses as a catalogue of editorial rulings, diffable and checkable.
Doors: E, D lead; C follows. Sources: data/ontology/homonyms.json,
paper §8.

### 13–22 · The Vine (generated + intros)
Per chapter: agent-written intro (what this section argues, how its
verses hang together, what to watch for in the cards) + generated verse
cards for every unit + one featured walkthrough (generator template).
Intro briefs live with the generator config. Doors: C lead; all via
featured verses.

### 23 · What the Theorems Do Not Prove
Thesis: the boundary is the point, stated without hedging or piety.
Beats: internal coherence vs fidelity; the audit and its Book-I null
reported straight; the single-source standpoint (Iyer 1965) inherited by
every contract; what multi-commentary contracts would change; shallow
entailment and the six-sort coarseness; invitation to attack the
contracts (they are public, diffable, and every axiom is cited). Doors:
all; E especially. Sources: paper §9, §10, §11.

### 24 · Toward a Sanskrit-Tuned Prover
Thesis: the research agenda: stop translating Sanskrit into a foreign
formalism and start teaching the prover Sanskrit's own formal devices.
Beats: kāraka as a typed role calculus (dependent record sketch); sandhi
as a verified parsing/normalization layer; śābdabodha as elaboration
(from sentence to typed cognition-structure); paribhāṣā as a tactic
language; utsarga/apavāda as instance priority; Navya-Nyāya as the
standard library; what Books II and III would demand (sentence holism,
universals); staged roadmap with falsifiable milestones, in the
companion programmes' registered-gate style. Doors: B, D lead; A
follows. Sources: paper §11; chapter 8; design spec.

### 25 · An Invitation
Thesis: the edition is living; the reader can check, contest, and extend
it. Beats: how to read a proof page online; how to file an interpretive
challenge (change a contract, watch the build); Books II and III as open
vine; the paramparā continued by other means: a tradition of
commentary whose every ruling is public and checkable; closing return to
VP 1.1 (the vine image, vallarī). Short chapter, 2,000 words. Doors: all.

### Appendices
A: repo quickstart + CI (from README, tested commands). B: Devanagari
table + IAST values + narrator guidance. C: two-way glossary (merge
site glossary + paper terms). D: generated theorem index. E: annotated
further reading (only verifiable, existing works from refs.bib and named
classics; no invented titles).
