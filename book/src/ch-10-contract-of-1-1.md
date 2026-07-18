# 10 · The Contract of Verse 1.1

Chapter 1 left a debt unpaid. It showed you three English sentences, all grammatical, all defensible from the dictionary, all rendering the same thirty-two Sanskrit syllables. One said that ultimate reality is language: śabdādvaita, the boldest thesis in Indian philosophy of language. One quietly deleted the metaphysics and left a truism about linguistic structure. One kept the metaphysics but swapped the cosmology, making the world a real transformation of the absolute, which is the Sāṃkhya position and precisely not Bhartṛhari's. Chapter 1 promised that a machine could hold the decision among them: adequate, unlicensed, contradicted, each verdict a theorem. Then the book spent eight chapters earning the machinery. You have watched commentary become a specification language (Chapter 2), grammar become a formal system (Chapter 3), proof become a computation (Chapters 5 and 6), and you have built a miniature of this book's kernel with your own hands (Chapter 7).

Now the debt comes due. This chapter is not a description of the pipeline. It is the pipeline, run once, in slow motion, on the verse that started everything. Every quotation in this chapter is verbatim from the repository: the commentary sentences from the corpus record (data/corpus/vakyapadiya.jsonl), the contract from data/contracts/1.1.json, the Lean from lean/VakyaVallari/Verses/V1_1.lean. Nothing is illustrative. Everything is the actual artifact. By the end you will have watched one verse's translation and commentary become five theorems, and you will know exactly which theorem would die if an editor changed one word.

## The verse, one more time

::: {.deva}
अनादिनिधनं ब्रह्म शब्दतत्त्वं यदक्षरम् ।

विवर्ततेऽर्थभावेन प्रक्रिया जगतो यतः ॥ १ ॥
:::

::: {.iast}
anādinidhanaṃ brahma śabdatattvaṃ yadakṣaram |

vivartate'rthabhāvena prakriyā jagato yataḥ || 1 ||
:::

And the translation this edition accepts, the one printed in the corpus:

> Brahman is without beginning or end, imperishable, and its essence is the Word. It appears in the mode of objects, and from it proceeds the unfolding of the world.

The question of this chapter is narrow and total: what, exactly, licenses that translation, and what, exactly, forbids its rivals?

## The evidence on the table

The commentary is the evidence. Chapter 9 argued that a commentary behaves like a specification; here is the specification for verse 1.1, in the commentary's own sentences. Read it slowly, because every axiom we are about to write must point back into this prose, verbatim, or be rejected by a gate before any proof is attempted.

::: vrtti
The corpus commentary on 1.1 opens: "The opening karika states the sabdadvaita thesis in a single breath: the ultimate is not merely describable by language but is language," and then names the term, "sabda-tattva, word-essence." It continues: "Two terms carry the weight. First, aksara: its plain sense is 'imperishable', which is why it sits naturally beside anadinidhana, 'without beginning or end'. But aksara is also the ordinary grammarians' word for a phoneme, and Bhartrhari is a grammarian. The pun is not decorative; it is the argument in miniature. What is imperishable and what is phonic are, for him, the same thing. Second, vivartate. Bhartrhari does not say Brahman becomes the world (parinamate), which would make the world a real transformation of its substance, as Samkhya has it. Vivarta is appearance without loss of unity: the one presents itself as many while remaining one." And on the last word of the verse's second line: "Note also prakriya, here 'unfolding'," which in grammatical usage names a derivation, so that "The world issues from Brahman the way a word-form issues from its base. The choice of vocabulary is doing philosophical work." (data/corpus/vakyapadiya.jsonl, record 1.1.)
:::

That paragraph is the whole warrant. Everything the contract asserts must be found inside it. Watch how little of it we need, and how precisely.

## Entities first

Before claims, things. The commentary's paragraph talks about three: Brahman, śabdatattva, and the world. The contract declares them, and here Chapter 7's six sorts do their first real work. Recall the inductive type you built there, `Sorta`, with its six constructors: absolute, power, manifestation, linguisticItem, property, cognition. Every entity in a contract carries one. The sort assignment is itself an interpretive act, so each declaration carries a citation.

Here is the opening of data/contracts/1.1.json, verbatim:

```json
{
  "verse": "1.1",
  "entities": [
    {
      "id": "brahman",
      "name": "brahman",
      "sort": "absolute",
      "cite": "The opening karika states the sabdadvaita thesis in a single breath"
    },
    {
      "id": "sabdatattva",
      "name": "śabdatattva",
      "sort": "absolute",
      "cite": "the ultimate is not merely describable by language but is language — sabda-tattva, word-essence"
    },
    {
      "id": "jagat",
      "name": "jagat",
      "sort": "manifestation",
      "cite": "The world issues from Brahman the way a word-form issues from its base"
    }
  ],
```

Three rulings, each with its receipt. Brahman is of sort absolute: uncontroversial, and the cite anchors it to the sentence that frames the whole verse. Śabdatattva is also of sort absolute: this is the ruling, the single most consequential judgment in the file. The commentary sentence quoted in its cite is the one that forces it. If the ultimate "is not merely describable by language but is language," then word-essence is not a feature that words have. It is the absolute itself, and it must live in the same sort as Brahman or the commentary's central sentence is false. And jagat, the world, is of sort manifestation, not absolute and not substance: the cite is the derivation image, the world issuing from Brahman as a word-form issues from its base. A derived form is a manifestation of its base, not a second base.

Notice what the cite fields are doing mechanically. Each is a substring that must occur, character for character, in the commentary text of record 1.1. A test (tests/test_contracts.py) checks this by string matching before the contract is allowed anywhere near the prover. Chapter 9 called this the anti-fabrication gate: an axiom that cannot point to the commentary sentence that licenses it is rejected before any proof is attempted (paper §3.2). You are now watching the gate's input.

## Axiom by axiom

Now the claims the commentary asserts. There are four, and one denial. Take them one at a time, each with the commentary sentence that licenses it.

**The identity.** The commentary's first and load-bearing sentence: the ultimate is not merely describable by language but is language. That is an identity claim between two entities, śabdatattva and brahman. In the contract:

```json
  "axioms": [
    {
      "kind": "identity",
      "a": "sabdatattva",
      "b": "brahman",
      "cite": "the ultimate is not merely describable by language but is language — sabda-tattva, word-essence"
    },
```

One sentence of prose, one line of data. The encoding is honest about what it keeps and what it drops. It keeps the identity, the thing the doctrine turns on. It drops the rhetoric, "in a single breath," the italics, the drama. A contract is not a summary of the commentary. It is the commentary's assertible content, the part that can be true or false of a translation.

**The vivarta relation.** The commentary rules on the verb: "Vivarta is appearance without loss of unity: the one presents itself as many while remaining one." That is a relation, and it has a direction: from Brahman to the world.

```json
    {
      "kind": "relation",
      "name": "vivartate",
      "from": "brahman",
      "to": "jagat",
      "cite": "Vivarta is appearance without loss of unity: the one presents itself as many while remaining one"
    },
```

**The two predications.** The verse predicates two things of Brahman, and the commentary licenses both. First, anādinidhana, "without beginning or end." The commentary's warrant is the sentence explaining why akṣara's plain sense sits where it does: "its plain sense is 'imperishable', which is why it sits naturally beside anadinidhana, 'without beginning or end'." Second, akṣara itself, imperishable and phonic at once. The warrant is the pun sentence: "What is imperishable and what is phonic are, for him, the same thing."

```json
    {
      "kind": "predication",
      "name": "anadinidhana",
      "of": "brahman",
      "cite": "its plain sense is 'imperishable', which is why it sits naturally beside anadinidhana, 'without beginning or end'"
    },
    {
      "kind": "predication",
      "name": "aksara",
      "of": "brahman",
      "cite": "What is imperishable and what is phonic are, for him, the same thing"
    }
  ],
```

**The denial.** Here the commentary does something rarer and more valuable than asserting. It rules a reading out, by name: "Bhartrhari does not say Brahman becomes the world (parinamate), which would make the world a real transformation of its substance." A specification that only says what is true underdetermines the implementation. A specification that also says what is false gives you a test. The contract records the denial as first-class data:

```json
  "denials": [
    {
      "kind": "relation",
      "name": "parinamate",
      "from": "brahman",
      "to": "jagat",
      "cite": "Bhartrhari does not say Brahman becomes the world (parinamate), which would make the world a real transformation of its substance"
    }
  ],
```

Stand back and look at the shape. Five commentary sentences have become five data items: one identity, one relation, two predications, one denied relation. Each carries its verbatim receipt. Nothing in the contract exists that the commentary did not say, and the gate can verify that claim by string matching, which is to say: mechanically, exhaustively, every build.

::: pandit
One deliberate weakness, recorded rather than hidden. The corpus flags 1.1 as contested: "whether vivarta already carries the later Advaitic sense of *illusory* appearance, or only the weaker sense of manifestation, is disputed; the karika alone does not settle it." The contract's notes field answers: "the contract deliberately encodes only the weaker commitment (manifestation) shared by both readings." So the axiom named vivartate commits to appearance without loss of unity and nothing stronger. A scholar who reads vivarta as full-blown illusionism and a scholar who reads it as mere manifestation can both sign this contract. That is not evasion; it is precision about where the tradition itself is undecided. Where the dispute is real, the formalization is kept exactly as weak as the consensus (paper §3.3).
:::

## What the translation asserts

The contract so far encodes the commentary. Now the other half: what does the accepted translation actually claim? This is a separate act of analysis with its own verbatim rule. Each claim of the accepted reading must cite the translation, not the commentary, and the cite must occur in the translation text exactly. The contract cannot smuggle in a claim the English sentence does not make.

Read the translation again with an analyst's eye: "Brahman is without beginning or end, imperishable, and its essence is the Word. It appears in the mode of objects, and from it proceeds the unfolding of the world." Four commitments are visible on its surface. "Its essence is the Word": the identity. "Without beginning or end": the first predication. "Imperishable": the second. "It appears in the mode of objects": the vivarta relation. The contract records exactly these four, no more:

```json
  "accepted_reading": {
    "claims": [
      {
        "kind": "identity",
        "a": "sabdatattva",
        "b": "brahman",
        "cite": "its essence is the Word"
      },
      {
        "kind": "predication",
        "name": "anadinidhana",
        "of": "brahman",
        "cite": "without beginning or end"
      },
      {
        "kind": "predication",
        "name": "aksara",
        "of": "brahman",
        "cite": "imperishable"
      },
      {
        "kind": "relation",
        "name": "vivartate",
        "from": "brahman",
        "to": "jagat",
        "cite": "It appears in the mode of objects"
      }
    ]
  },
```

Look at the two columns of citations side by side and you can see the whole method in miniature. The axioms cite the commentary; the accepted reading cites the translation. Adequacy, when we prove it, will be the statement that the second column is covered by the first: everything the English asserts, the commentary licenses, and nothing the English asserts, the commentary denies.

## The registered rivals

A contract that only certified the accepted reading would be weak evidence. Any sufficiently vague contract licenses anything. The discipline, borrowed from the falsificationist habit of the companion research programmes (Chapter 11), is to register plausible mistranslations and require each to fail, in a declared mode. Two failure modes exist, and Chapter 7 built both: a reading is **unlicensed** when it asserts a claim no axiom entails, and **contradicted** when it asserts a claim the denials list contains (paper §3.1). Contradicted is the stronger defect. Unlicensed says: the commentary never said that. Contradicted says: the commentary said the opposite.

Rival one is Chapter 1's second sentence, the metaphysics-deleting one:

```json
  "rejected_readings": [
    {
      "label": "naive_linguistic_structure",
      "rendering": "The imperishable linguistic structure underlying words has no beginning or end.",
      "why": "Renders śabdatattva as a mere linguistic property, demoting the ontological identity the commentary insists on: the ultimate IS language, not something described by it. The sort error (property vs absolute) makes the identity claim decidably false.",
      "entities": [
        {"id": "sabdatattva_naive", "name": "śabdatattva", "sort": "property"}
      ],
      "claims": [
        {"kind": "identity", "a": "sabdatattva_naive", "b": "brahman"}
      ],
      "expect": "unlicensed"
    },
```

The encoding is the argument. This rendering's śabdatattva is a structural property of languages, so the rejected reading declares its own entity, same name, different sort: property instead of absolute. Its one claim identifies that property with Brahman. And the contract registers what must happen: `"expect": "unlicensed"`. No axiom identifies a property with the absolute, and the kernel's Navya-Nyāya-inspired rule (Chapter 8) makes cross-sort identity stateable but decidably false. The mistranslation is not vaguely wrong. It has a type error, and the machine will name it.

Rival two is the third sentence, the Sāṃkhya cosmology:

```json
    {
      "label": "parinama_transformation",
      "rendering": "Brahman transforms itself into the world of objects.",
      "why": "Asserts a real transformation (parinama) of Brahman's substance, which the commentary explicitly rules out in favor of vivarta (appearance without loss of unity).",
      "entities": [],
      "claims": [
        {"kind": "relation", "name": "parinamate", "from": "brahman", "to": "jagat"}
      ],
      "expect": "contradicted"
    }
  ],
```

No new entities needed; the sin is relational. "Transforms itself" asserts pariṇāma, and pariṇāma from Brahman to jagat is, character for character, the claim in the denials list. Expected mode: contradicted. The commentary anticipated this mistranslation by name fifteen centuries before anyone could compile it.

That is the entire contract. Three entities, four axioms, one denial, one accepted reading with four claims, two registered rivals with declared failure modes, and a notes field recording the contested point. About a hundred lines of JSON, every load-bearing line carrying a verbatim receipt.

## Generation: from JSON to Lean

Now the contract compiles. A generator (src/vallari/leangen.py) reads the JSON and emits a Lean module, deterministically, no model in the loop. The result is lean/VakyaVallari/Verses/V1_1.lean, and because you built every ingredient in Chapter 7, you can read it whole. We will take it in four sections, and together they are very nearly the entire file.

**The header and the entities.**

```lean
/- Verse 1.1 — generated from data/contracts/1.1.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_1

open VakyaVallari

def brahman : Entity := ⟨"brahman", Sorta.absolute⟩
def sabdatattva : Entity := ⟨"śabdatattva", Sorta.absolute⟩
def jagat : Entity := ⟨"jagat", Sorta.manifestation⟩
```

The header states the provenance discipline: this file is an artifact, regenerated from the JSON, never hand-edited, and its citations have already passed the string-matching gate. Then the three entities, each an `Entity` in Chapter 7's sense: a name paired with a sort, built with Lean's anonymous constructor brackets. The interpretive ruling from the JSON, śabdatattva is absolute, is now a term of a type, and the elaborator will hold us to it.

**The contract.**

```lean
def contract : Contract :=
  { axioms := [ Claim.identity sabdatattva brahman
    , Claim.relation "vivartate" (Node.ent brahman) (Node.ent jagat)
    , Claim.predication "anadinidhana" brahman
    , Claim.predication "aksara" brahman ]
  , denials := [ Claim.relation "parinamate" (Node.ent brahman) (Node.ent jagat) ]
  , reported := [] }
```

Four axioms, one denial, exactly mirroring the JSON. Two details deserve a pause. Relations take `Node` arguments, not bare entities: `Node.ent brahman` wraps the entity as a graph node. For this verse the wrapping looks like ceremony, but Chapter 8 showed why it is there: a `Node` can also be a relation, so relations can be relata of further relations, the Navya-Nyāya paramparā-sambandha, and later verses use that depth. And `reported := []` declares that this contract carries no pūrvapakṣa, no doctrine the commentary merely reports without endorsing. Verse 1.1 is Bhartṛhari speaking in his own voice. The doxographic verses of the phoneticians' section will fill that field, and the machinery stays visible even when empty (paper §6.3).

**The accepted reading and its theorem.**

```lean
def accepted : Reading :=
  { claims := [ Claim.identity sabdatattva brahman
    , Claim.predication "anadinidhana" brahman
    , Claim.predication "aksara" brahman
    , Claim.relation "vivartate" (Node.ent brahman) (Node.ent jagat) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide
```

One line of theorem, and it is the book's whole promise in miniature. `Contract.Adequate` is the two-part proposition you met in Chapter 7: the contract licenses the reading (every claim is entailed by the axioms) and does not contradict it (no claim appears among the denials). The proof is `by decide`, and the next section takes that single word seriously.

**The counterexamples.** The generator emits the rivals into their own namespace, each with its rendering and rejection rationale preserved as a comment:

```lean
namespace Counterexamples

/- 'The imperishable linguistic structure underlying words has no beginning or end.'
   Why rejected: Renders śabdatattva as a mere linguistic property, demoting the ontological identity the commentary insists on: the ultimate IS language, not something described by it. The sort error (property vs absolute) makes the identity claim decidably false. -/
def sabdatattva_naive : Entity := ⟨"śabdatattva", Sorta.property⟩
def naive_linguistic_structure : Reading :=
  { claims := [ Claim.identity sabdatattva_naive brahman ] }
theorem naive_linguistic_structure_inadequate : ¬ contract.Adequate naive_linguistic_structure := by decide
#guard contract.licenses naive_linguistic_structure = false
theorem naive_linguistic_structure_sort_error : sabdatattva_naive ≠ sabdatattva := by decide

/- 'Brahman transforms itself into the world of objects.'
   Why rejected: Asserts a real transformation (parinama) of Brahman's substance, which the commentary explicitly rules out in favor of vivarta (appearance without loss of unity). -/
def parinama_transformation : Reading :=
  { claims := [ Claim.relation "parinamate" (Node.ent brahman) (Node.ent jagat) ] }
theorem parinama_transformation_inadequate : ¬ contract.Adequate parinama_transformation := by decide
#guard contract.contradicts parinama_transformation = true

end Counterexamples

end VakyaVallari.V1_1  -- …
```

(The file's actual last line closes the namespace as opened; nothing else is elided.)

Read the first counterexample closely, because its structure is a small proof of the method's honesty. The mistranslation gets its own entity, `sabdatattva_naive`, with sort `property`. Its reading makes one claim. Then three checkable statements. The theorem `naive_linguistic_structure_inadequate` refutes the reading outright. The `#guard` line pins the failure mode: `licenses` is false, which is the machine's word for unlicensed, matching the JSON's `"expect": "unlicensed"`. And the auxiliary theorem `naive_linguistic_structure_sort_error` names the root cause: the naive śabdatattva is provably not the contract's śabdatattva, though they share a spelling. Across the corpus there are 56 such sort-error lemmas; this is the first (paper §6.4). The second counterexample mirrors the pattern, with its `#guard` pinning `contradicts` to true: the registered mode contradicted, and no sort lemma, because its defect is not a sort clash but a head-on collision with a denial.

## The compile moment

The command is unglamorous:

```
lake build
```

Lake is Lean's build tool. It elaborates every module in the project, this one among 144 verse modules, and either every definition type-checks and every theorem's proof is accepted by the kernel, or the build fails and names the line. There is no partial credit and no warning-but-continue. The gate is binary and global: zero `sorry`, all modules, every time (paper §6.4).

What happens at each `by decide` is worth watching once in full, because it is where the philosophy cashes out as computation. `Contract.Adequate contract accepted` is a proposition, but a decidable one: the kernel's definitions reduce it to a Boolean computation. `decide` runs that computation and asks the kernel to confirm the run.

::: engineer
Trace it by hand for the accepted reading; it is small enough. `licenses` maps `entails` over the four claims. Claim one, the identity of śabdatattva and brahman: `entails` checks reflexivity (are the two entities equal? no, different names), then membership of the identity in the axiom list (yes, axiom one), done. Claims two and three, the predications: plain list membership, axioms three and four. Claim four, the vivartate relation: list membership again, axiom two. All four entailed, so `licenses` computes to `true`. Then `contradicts` asks whether any of the four claims occurs in the denials list; the only denial is the parinamate relation, which matches none of them, so `contradicts` computes to `false`. The pair `(true, false)` is exactly what `Contract.Adequate` demands. For the naive rival, the same trace dies at its only claim: reflexivity fails because `⟨"śabdatattva", Sorta.property⟩` and `⟨"śabdatattva", Sorta.absolute⟩` differ in their sort field, and neither orientation of the identity occurs in the axiom list, so `entails` returns `false` and `licenses` fails. The sort made the difference, and `DecidableEq` on `Entity` is what let equality see it. This is the sense in which the proof term is the computation: `decide` produces a proof that the evaluation returned `true`, and the kernel replays the evaluation to check it (paper §6.1). No cleverness, no search, no oracle. Entailment here is deliberately shallow, membership closed under identity reflexivity and symmetry (lean/VakyaVallari/Adequacy.lean), and Chapter 23 will weigh what that shallowness does and does not cost.
:::

The build passes. Green. Here is what has actually been established, theorem by theorem, one English sentence each.

`accepted_adequate`: every claim the accepted translation makes is licensed by a cited commentary commitment, and none is denied. The rendering "Brahman is without beginning or end, imperishable, and its essence is the Word; it appears in the mode of objects" keeps faith with the commentary, provably.

`naive_linguistic_structure_inadequate`: the rendering "the imperishable linguistic structure underlying words has no beginning or end" asserts at least one claim the commentary never licensed. It is refuted, not merely disliked.

`naive_linguistic_structure_sort_error`: the failure has a diagnosis. That rendering's word-essence is a property, the commentary's is the absolute, and the two are provably distinct entities despite the shared name.

`parinama_transformation_inadequate`: the rendering "Brahman transforms itself into the world of objects" asserts a claim the commentary explicitly denies. It fails in the stronger mode.

And the two `#guard` lines, though not theorems, are build-time assertions that pin each failure to its registered mode: the first rival fails as unlicensed, the second as contradicted, exactly as the JSON promised. If a future change to the kernel or the contract ever shifted a failure from one mode to the other, the build would object even though both readings remained refuted. The system does not just require rivals to fail. It requires them to fail for the reasons on record.

Be equally clear about what the green build does not assert, because the strength of the claim depends on its stated limits. Lean has verified internal coherence: this translation satisfies this contract, and these rivals provably do not. Whether the contract is faithful to Bhartṛhari's commentary is not a theorem and cannot be one; that judgment belongs to human readers, which is why every axiom carries its verbatim cite, making the check a lookup rather than an act of faith. The prover keeps commitments. The philologist judges them (paper §3.4). Chapter 23 returns to this boundary without flinching.

## One changed word

Now the counterfactual the whole architecture exists for. Suppose, some years from now, an editor touches the corpus. In the translation of 1.1, "It appears in the mode of objects" becomes "It transforms into the world of objects." One word, defensible-sounding, the kind of drift that creeps into second editions when a copyeditor finds "appears" weak. What happens?

First, nothing in Lean. The first thing that happens is upstream, in the citation gate. The accepted reading's fourth claim carries the cite "It appears in the mode of objects", and that string must occur verbatim in the translation text. After the edit it does not. tests/test_contracts.py fails with a citation mismatch before any proof runs. The gate's message is the whole story in one line: the contract asserts, on the translation's behalf, a sentence the translation no longer contains. The editor cannot proceed without confronting the contract.

Suppose the editor proceeds, and honestly. To make the citation gate pass, the fourth claim's cite must be updated to the new wording, and with the new wording the claim itself must change, because "transforms into" does not assert vivartate. Rendered honestly, it asserts pariṇāma: the relation named parinamate, from brahman to jagat. The generator rebuilds V1_1.lean, and the accepted reading now contains `Claim.relation "parinamate" (Node.ent brahman) (Node.ent jagat)`. Then `lake build`, and the theorem `accepted_adequate` fails, and it fails twice over. `licenses` computes to false, because no axiom entails parinamate. And `contradicts` computes to true, because parinamate from Brahman to the world is, literally, the first and only element of the denials list. `decide` reports that the proposition evaluated to false, and the module does not compile. The build is red, and the failing theorem names the verse.

Notice the final twist, because it is the system enjoying its own design. The claim set the editor's new translation asserts is exactly the claim set of the registered counterexample `parinama_transformation`. The edited translation has not produced a novel error. It has walked into a refutation that has been compiled, in public, since the contract was written, annotated with the commentary sentence that forbids it: Bhartṛhari does not say Brahman becomes the world. The editor is not arguing with a maintainer's taste. The editor is arguing with a theorem, and behind the theorem, with the Vṛtti.

This is what regression means here, and it is worth saying plainly because the word usually lives in software. In software, a regression test keeps a fixed bug from returning. Here, the compiled contract keeps a refuted interpretation from returning. Interpretive rulings, once earned, usually survive only as footnotes and reviewers' memories, and they decay: the next translator, the next edition, the next paraphrase can silently reintroduce a reading the tradition already examined and rejected. Verse 1.1's contract makes the pariṇāma reading unrevivable by accident. Anyone may still argue for it, but the argument must now happen in the open: change the contract, cite the commentary, and watch the build, and the diff is the debate. Continuous integration runs `lake build` on every proposed change, so the protection is not a policy but a property (Appendix A).

## One hundred and forty-four times

Everything in this chapter happened to one verse, and the slow motion was the point. But nothing in it was special to 1.1 except the fame of the verse. The same pass, commentary sentences to cited axioms, translation to cited claims, rivals to registered failure modes, JSON to generated Lean, `decide` to green, has been run for every one of the 144 verse units of the Brahmakāṇḍa. The corpus carries 144 contracts and 144 generated modules; the build proves 566 theorems, refuting 361 registered mistranslations across the book, each in its declared mode, with 56 sort-error lemmas naming ontological demotions like the one you watched (paper §6.4, §8.1). The swarm that drafted those contracts, and the gates that caught it fabricating, are the next chapter's story. The words that refused to keep one sort are the chapter after that.

And then the book changes character. Part IV walks the vine itself: all ten sections of Book I, every verse with its Devanagari, its transliteration, its translation, and its one-line verdicts, with one featured verse per chapter given a treatment like this one. You now know exactly what stands behind each of those quiet verdict lines. Not confidence. A contract, a build, and a theorem you could go and break.

## The thread so far

The commentary's five key sentences on VP 1.1 became three sorted entities, four cited axioms, and one cited denial; the accepted translation became four claims citing its own text; two rival renderings were registered with the failure modes they must exhibit. A generator compiled the contract into V1_1.lean, and `lake build` proved the accepted reading adequate and refuted both rivals by `decide`, one as unlicensed with a sort-error lemma, one as contradicted. Changing one word of the translation would trip the citation gate, then fail the adequacy theorem, and land the editor inside an already-compiled counterexample: interpretation, protected by regression. This has been done 144 times, and Part IV is the tour.

*Doors: engineers get the full pipeline run end to end, gate order and failure modes included; proof people get the decidability story cashed out in a real `decide` trace; literature readers get the three worldviews settled by evidence they can read; vyākaraṇa students see the pun and the derivation image carried intact into the formalism; commentary scholars see five sentences of the Vṛtti tradition doing load-bearing work under verbatim citation.*
