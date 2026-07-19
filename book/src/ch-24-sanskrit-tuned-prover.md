# 24 · Toward a Sanskrit-Tuned Prover

## The pattern this project kept tripping over

Every chapter until now has reported things that exist. The corpus is checksummed. The contracts compile. The 566 theorems close. Chapter 23 drew the boundary around those facts without flinching. This chapter steps over the boundary on purpose, and the reader deserves the warning in plain words: everything that follows is proposal, not accomplishment. Nothing in this chapter has been built. These are research directions with falsifiable milestones attached, written in the future tense because that is the honest tense for them. Where the rest of the book says "the kernel proves," this chapter says "a system could" and then says exactly what evidence would count as the proposal failing.

The proposals share one motivation, and it comes from an observation the project made repeatedly, at first with surprise and eventually with something like resignation. Every time the formalization needed a formal device, the Sanskrit tradition already had it. The kernel needed typed semantic roles; Pāṇini's kāraka system, from Chapter 3, is typed semantic roles. The kernel needed metarules governing how rules apply; the grammarians' paribhāṣās, the interpretive metarules of the Aṣṭādhyāyī, are exactly that. The kernel needed a priority scheme for exceptions; utsarga and apavāda, the general rule and its override, are a priority scheme with two and a half millennia of worked examples. The kernel needed negation that carries structure rather than a bare "not"; Navya-Nyāya's abhāva, absence with its counterpositive and locus as mandatory data, is structured negation, and Chapter 8 showed the kernel taking dictation from it. The kernel needed a story about how a sentence becomes a typed judgment; śābdabodha, the tradition's analysis of verbal cognition, is that story, worked out in adversarial detail across centuries.

Yet the present system uses almost none of this as machinery. It uses it as inspiration. The six-sort ontology, the claim grammar, the decidable adequacy check: these are a foreign formalism, a small dependent-type calculus into which the Sanskrit material is translated before anything is checked. The translation was the right first move, because it was buildable in months and its boundary could be stated honestly. But the recurring discovery points at a natural endpoint. Stop translating Sanskrit into a foreign formalism. Teach the prover Sanskrit's own formal devices, so that the primitives of the system are the tradition's primitives, and the checking happens in the tradition's own terms. The rest of this chapter is five concrete proposals toward that endpoint, each with the Sanskrit device, the Lean 4 mechanism it maps to, a small sketch, and a milestone that can fail in public. Receipt for the motivating claims: paper §2.2, §6.2, §12.

## Proposal one: kāraka as a typed role calculus

Chapter 3 introduced the six kārakas, the roles a noun can play in the event a verb names: kartṛ, the agent; karman, the patient or object; karaṇa, the instrument; sampradāna, the recipient; apādāna, the source; adhikaraṇa, the locus. Pāṇini defines each role semantically and then maps roles to case endings by rule. The crucial property, the one modern role-labeling systems rediscovered, is that the roles are typed slots declared by the verb's meaning, not positions in word order.

The present kernel does not have kārakas. Its relation claims are string-labeled edges between nodes, and nothing checks that the filler of an agent slot is the kind of thing that can act. The Lean mechanism that fits is the dependent record: a structure whose later fields depend on earlier ones. A verb's frame would declare, as data, which roles it takes and what sort each filler must have; an event built against that frame would carry, as proof obligations, the evidence that every filler matches its declared sort. Ill-roled sentences would fail to elaborate at all, the way a function applied to the wrong type fails today.

```lean
-- Sketch, not running code.
inductive Karaka
  | kartr | karman | karana | sampradana | apadana | adhikarana

structure Frame where
  verb  : String
  slots : List (Karaka × Sorta)   -- each role, with its required sort

structure Event (f : Frame) where
  fill : (s : Karaka × Sorta) → s ∈ f.slots → Entity
  wellSorted : ∀ s h, (fill s h).sort = s.snd
```

A claim like "the Self knows the word-principle through grammar" would then be one `Event` against the frame of the verb of knowing, with the knower, the known, and the instrument each type-checked into place, instead of three loose relation edges whose coherence nobody enforces.

**Milestone.** Build a gold standard first: one hundred sentences drawn from the corpus's commentary prose, each annotated by hand with its kāraka assignments, the annotations reviewed and frozen before any system runs. Then require the system to re-derive the six kārakas' assignments for the full test set. The score is exact-match per role slot, published whatever it is. Prior art already sits on this machine: the panini-data-toolkit work with the Saṃsādhanī parser (Goyal et al. 2012) did kāraka annotation, so the proposal starts from tooling, not from zero. Receipt: docs/specs/2026-07-16-vakya-vallari-design.md. Falsifier: an exact-match rate that a trivial baseline matches, or a gold standard the annotators cannot themselves agree on, either of which would be reported as the result.

::: engineer
The dependent frame does real work that a flat schema cannot. Because `Event` is parameterized by `Frame`, two verbs with different role inventories yield different types, and an event cannot be accidentally checked against the wrong verb; that is the same design that makes the kernel's per-verse namespaces collision-proof today. The `wellSorted` field is where kāraka theory meets Chapter 8's sorted identity: filling the karaṇa slot of a cognition verb with a `manifestation`-sorted entity would be a compile error, the C-TV failure mode again, now at the grammatical layer instead of the metaphysical one. And the frame list itself becomes checkable data, diffable the way contracts are diffable, so a dispute about whether a verb takes a sampradāna is a one-line pull request with a build verdict. Receipt: paper §6.2 for the sorted-identity mechanism this extends.
:::

## Proposal two: sandhi as a verified normalization layer

Sandhi, from Chapter 3, is the system of sound changes at word boundaries: vāk plus īśa becomes vāgīśa, the final consonant voicing before the following vowel. Forward sandhi is close to deterministic rewriting. The hard direction is backward: given a fused surface string, recover the word sequence. Splitting is genuinely ambiguous in places, which is why every Sanskrit student owns a pencil.

The Lean mechanism is a verified normalization layer: a forward function, a backward search, and theorems connecting them. Forward sandhi becomes a pure function from word sequences to surface strings, each rewrite rule a definitional equation. The splitter does not need to be deterministic; it needs to be certified. Each candidate split it returns carries a proof, as data, that applying the forward function to the candidate reproduces the input string exactly. Ambiguity is then honest: multiple certified splits, never an uncertified one.

```lean
-- Sketch, not running code.
def sandhi : List Word → Surface        -- forward: deterministic rewriting

structure Split (s : Surface) where
  words : List Word
  sound : sandhi words = s              -- soundness certificate, by rfl/decide

def split (s : Surface) : List (Split s)  -- backward: certified search

theorem roundTrip (ws : List Word) :
    ∃ c ∈ split (sandhi ws), c.words = ws   -- completeness on known corpus
```

**Milestone.** Round-trip proof on the corpus's own material. The edition carries the Devanagari mūla line of every one of the 144 Book I verses, checksummed. The milestone: for each line, a certified split into padas whose resynthesis is byte-identical to the checksummed original, the equality closed by `decide` or `#guard`, all 144 as compiled facts in the build. Receipt for the source lines: docs/build/vakyapadiya_mula_deva.json and data/corpus. Falsifier: a single mūla line that cannot be round-tripped is a red build, visible in CI, and a rule set that needs per-verse special cases to pass would be reported as a failure of the rule set, not silently patched.

## Proposal three: śābdabodha as elaboration

Elaboration is the phase of a proof assistant that turns surface syntax, with its holes and ambiguities, into a fully explicit typed core term. Chapter 8 argued that śābdabodha, the Navya-Nyāya analysis of the cognition a sentence produces, is the same job description: from a heard sentence to a complete structure of qualificand, qualifiers, and named connecting relations, with nothing left implicit.

The proposal is to take the correspondence literally. Build an elaborator whose output type is a `Bodha` tree, the cognition-structure, and whose input is a pada sequence delivered by proposal two with roles assigned by proposal one. The tradition's own disputes become the elaborator's configuration. The Nyāya school takes the agent as the chief qualificand of the sentence-cognition; the grammarians take the verbal activity; the Mīmāṃsakas take the bringing-about. These are three elaboration strategies over the same input, and a machine that implements all three makes a centuries-old dispute executable: same sentence, three typed outputs, their differences diffable.

```text
Sketch of the pipeline, surface to verdict:
  surface line
    → sandhi layer (proposal 2)   → certified padas
    → kāraka frames (proposal 1)  → typed event structure
    → śābdabodha elaborator       → Bodha tree
        (viśeṣya, viśeṣaṇa, saṃsarga at every edge)
    → contract check: Bodha entails the contracted claims, by decide
```

**Milestone.** Śābdabodha structures for the accepted readings of all of Book I. For each of the 144 verses, elaborate the accepted reading into a `Bodha` tree and type-check it against the verse's existing contract: every claim the contract licenses must be recoverable from the tree, and no denied claim may be. The existing 144 adequacy theorems are the gate the new structures must pass through unchanged. Falsifier: verses whose accepted reading cannot be elaborated without hand-editing the tree are counted and published; if that count is large, the elaborator, not the corpus, is declared the failure.

## Proposal four: paribhāṣā as a tactic language

The Aṣṭādhyāyī's rules do not apply themselves. The tradition maintains a body of paribhāṣās, interpretive metarules, some stated by Pāṇini, many collected later, most famously in Nāgeśa's Paribhāṣenduśekhara. A paribhāṣā does not generate forms; it governs how the generating rules are selected, ordered, and restricted. "In a conflict, the later rule prevails." "A rule that would have no scope elsewhere overrides one that would." These are not grammar; they are proof search strategy, stated as doctrine.

Lean 4 has a precise home for this: the tactic language and the attribute system. A metarule that says which rule wins a conflict is a tactic combinator; a standing preference is an attribute with a priority. And the oldest pair of all, utsarga and apavāda, the general rule and the exception that blocks it, is instance priority, a mechanism Lean programmers use daily without knowing they are reenacting it: the specific instance is tried before the general one, and the general one still stands everywhere the specific one is silent.

```lean
-- Sketch, not running code.
@[instance 100] def utsarga : Applies generalRule ...   -- default, tried late
@[instance 500] def apavada : Applies exceptionRule ... -- specific, tried first

macro "vipratisedhe" : tactic =>            -- "in conflict, the later prevails"
  `(tactic| first | apply laterRule | apply earlierRule)
```

The payoff is not decoration. A derivation walked by hand, like the one in Chapter 3, is a sequence of rule applications whose ordering decisions are currently invisible labor. With paribhāṣās as named tactics, the ordering decisions become named steps, and a proof script can say `vipratisedhe` where today it says nothing at all.

**Milestone.** Encode a small named set of standard paribhāṣās, on the order of five, as tactics and attributes, and demonstrate at least one derivation whose proof script becomes measurably shorter, in steps or lines, with the before and after committed side by side. Falsifier: if no derivation in the demonstration set gets shorter, or the encoded metarules disagree with the tradition's worked examples on which rule wins, the encoding is wrong and the comparison table says so. This is deliberately the smallest milestone of the five, because metarule encoding is where formalizations most easily drift into invention, and a small registered target keeps the claim checkable.

::: pandit
A vaiyākaraṇa will see two honest difficulties before this proposal earns anything. First, the paribhāṣā corpus is not a consistent axiom set; Nāgeśa's treatise is one long adjudication of metarules that conflict with each other, with scope restrictions argued case by case, and the tradition itself distinguishes metarules that are stated (vācanikī) from those merely inferred from Pāṇini's practice (jñāpaka-siddhā). An encoding must choose one adjudication and name it, exactly as the contracts chose Iyer's commentary and named it; the single-standpoint limitation of Chapter 23 will reappear here, and should be declared at the start rather than discovered later. Second, the siddhānta on rule conflict is subtler than "later wins": antaraṅga considerations, the relative internality of conditions, cut across ordering, and scholars including Kiparsky (2009) have spent careers on how Pāṇini's conflict resolution actually works. The milestone above is small precisely because of this; five metarules honestly encoded, with their adjudicator named, are worth more than fifty encoded loosely.
:::

## Proposal five: Navya-Nyāya as the standard library

Chapter 8 ended with an admission: the kernel proves the involution of absence, but no Book I verse module uses `Abhava`; typed absence is provided machinery, waiting. The fifth proposal is to stop treating the Navya-Nyāya constructs as provided machinery and start treating them as the standard library, the layer every future contract imports and builds on, the way mathlib is the layer a Lean mathematician builds on.

Concretely, three promotions. Avacchedaka-indexed types: the delimitor device becomes the standard way any property is stated, so that every predication in a contract carries its delimiting index and the monkey-and-tree ambiguity is unrepresentable rather than merely avoided. Abhāva with evidence: every denial in a contract becomes a typed absence, carrying its counterpositive and locus, so that a refutation theorem says not just "this reading is inadequate" but which absence, of what, located where, did the refuting. Paramparā relations: the `Node` nesting that lets relations be relata becomes the base ontology's official idiom for the chained relations in which Books II and III traffic, relation upon relation, to any depth. None of this requires new kernel code; all of it requires the discipline of using what Chapter 8 built, everywhere, as the default idiom. Receipt: paper §6.2; lean/VakyaVallari/Ontology.lean, lean/VakyaVallari/Tests.lean.

**Milestone.** The sufficiency test, and it is the sharpest of the five. When Book II's sentence-holism claims are contracted, the work must be done with this library and no new kernel primitives. The kernel is frozen before the attempt; the ledger records the freeze. If Book II's doctrine cannot be stated without reaching back into the kernel, that is the result: the library failed its sufficiency test, and the failure localizes exactly which construct the tradition needed that the library lacked. Either outcome is knowledge. A pass certifies that the Navya-Nyāya constructs span the space; a fail names the gap, and a named gap is a research finding.

## What Books II and III will demand

The five proposals are not free-floating; they are sized against what is coming. Book I, the Brahmakāṇḍa, is 144 verses of metaphysical groundwork, and the shallow claim-membership entailment of the present kernel was, just barely, enough for it. The rest of the Vākyapadīya is larger and harder in specific, nameable ways. The edition's own build data holds 426 verses of Book II and 1,226 of Book III, with translation and commentary already drafted. Receipt: docs/build/commentary/kanda2.json, kanda3.json.

Book II, the Vākyakāṇḍa, is about the sentence, and its central doctrine is the one this book's conclusion already leaned on: the sentence's meaning is an undivided whole, grasped in a flash of understanding, pratibhā, and the word-meanings we extract are analytical fictions, useful the way grammatical analysis is useful, but not the parts out of which the meaning was assembled. A contract language whose claims are lists of atomic assertions is structurally biased against this doctrine. Contracting Book II honestly requires stating claims about wholes that do not reduce to their parts, and stating the relation between the whole and the extracted parts without letting the parts do the semantic work. That is exactly what avacchedaka-indexing and paramparā relations are for, which is why proposal five's milestone is pinned to Book II and not to a toy.

Book III, the Padakāṇḍa, is a sequence of samuddeśas, thematic investigations: on universals, on substance, on relation itself, on time as a power of the word-principle, on the means of action, which is the kāraka theory again, now as metaphysics. Universals are the construct Chapter 8's honesty box flagged as unmapped: the kernel borrows delimitation's structure while staying silent on whether jāti is real. Book III does not permit that silence; its first major samuddeśa is about universals, and contracts for it must represent claims about jāti as such. Time is harder still: claims indexed by temporal power, sequence as something the word-principle projects rather than inhabits. Whether the standard library of proposal five can carry universals and time without new primitives is precisely what the frozen-kernel test will find out, one book early.

## Running it like a programme

A chapter of proposals is cheap. The companion programmes this project grew up beside exist to make proposals expensive in the right way, and the agenda above will be run under their discipline or not at all. Active Circuit Discovery (Sathish, Ahsan, and Latifi 2026) and Prabodha (Sathish 2026b), named in Chapter 11 as this project's siblings, share one operating pattern: register the milestone before the work, make the gate mechanical, record every event in an append-only ledger, and let acceptance be something the gate does, not something the author declares. The formalization loop of this book ran that way, and its ledger caught fabricated citations and drifting mirrors that goodwill would have missed. Receipt: paper §7, §12; research/ledger.jsonl.

Applied here, the discipline reads as follows. Each of the five milestones above is registered in the ledger with its falsifier stated, before implementation begins. The gold standards, the hundred kāraka sentences, the frozen kernel hash, are committed and checksummed first, so that the target cannot quietly move toward the arrow. The gates are the strictest available: `lake build`, `decide`, byte-identity, exact-match against frozen annotation, in that spirit, because Chapter 11's lesson was that cheaper mirrors drift. And the failures are ledger events with the same standing as the successes, because a research agenda that cannot lose is not an agenda, it is marketing. The reader who has followed the ledger through this book already knows what an honest miss looks like in this house style: recorded, reproduced, and turned into a gate.

## Closing the loop

There is a well-known irony in the modern study of Pāṇini, and this agenda is an attempt to retire it. When linguists in the twentieth century looked closely at the Aṣṭādhyāyī, they recognized, in Kiparsky's and Cardona's and Scharf's different idioms (Kiparsky 2009; Cardona 1976; Scharf 2009), a generative grammar: an ordered rule system with metarules, typed roles, rewriting, and conflict resolution, complete about twenty-four centuries before the field that could describe it existed. The recognition ran in one direction. Modern formal language theory supplied the vocabulary, and the ancient system was reverse-engineered into it, honored as an anticipation. The Aṣṭādhyāyī became a museum piece of the highest possible quality: admired, catalogued, and not run.

The proposal of this chapter is to finish the loop. Not to translate the tradition's devices into our formalism one more time, with better tools, but to implement them as the formalism: kāraka as the role calculus, sandhi as the verified surface layer, śābdabodha as the elaborator, paribhāṣā as the tactic language, Navya-Nyāya as the standard library, each with a milestone that can fail and a ledger that will say so. Pāṇini built a machine he could only ever run by hand, and the tradition ran it by hand, brilliantly, for two and a half thousand years. The grammar's own metatheory, running inside a machine that can check it, is the natural end of the story this book has been telling, and it is the one part of the story that does not exist yet. That is what "proposal" means.

## The thread so far

Chapter 23 drew the boundary around what the 144 theorems actually establish; this chapter stood on that boundary and pointed outward, and it was careful to say that pointing is all it did. The recurring discovery of the whole project, that the tradition already possessed the formal devices the kernel needed, becomes an agenda: five proposals for making those devices the prover's own primitives, each with a Lean mechanism, a sketch, and a milestone that can fail in public, run under the registered-gate discipline the companion programmes proved out. What remains is the invitation: a living edition, and a reader who can now check it.

*Doors: proof-assistant readers (B) get the Lean mechanisms, dependent frames, certified splits, instance priorities, and the frozen-kernel sufficiency test; vyākaraṇa students (D) get their own devices, kāraka, sandhi, paribhāṣā, śābdabodha, proposed as primitives rather than curiosities, with the pandit box on where the encoding will be hardest; AI engineers (A) get a template for speculative agendas that stay falsifiable: registered milestones, mechanical gates, and a ledger that records the misses.*
