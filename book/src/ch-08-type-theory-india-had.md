# 8 · The Type Theory India Already Had

## The new logic

Around the turn of the fourteenth century, in Mithilā, a region of what is now northern Bihar, a logician named Gaṅgeśa Upādhyāya wrote a book called the *Tattvacintāmaṇi*, "The Jewel of Reflection on the Real." It is organized as four investigations, one for each recognized means of knowledge: perception, inference, comparison, and word. On the surface it is a treatise in epistemology. In effect it was a new programming language for philosophy.

The school that grew from it is called Navya-Nyāya, "the new logic": *nyāya* is the old name of India's discipline of reasoning and debate, and *navya* means "new." The old Nyāya had argued about knowledge and inference for over a millennium. What Gaṅgeśa and his successors added was not primarily new doctrine. It was a new standard of statement. Every claim, every definition, every objection had to be written in a regimented technical idiom in which the structure of the cognition under discussion is spelled out completely, with nothing left to context, tone, or charity.

The school's center of gravity later moved east, to the town of Navadvīpa in Bengal, which by the sixteenth century had become something like a graduate school for the entire subcontinent. Students traveled across India to study there. Raghunātha Śiromaṇi sharpened the method and turned it back on the tradition's own ontology. Jagadīśa and Gadādhara, in the seventeenth century, wrote analyses so dense that a single sentence can take a page to unpack. And the idiom escaped its home discipline. By the early modern period, serious work in Sanskrit poetics, law, ritual theory, and grammar was written in Navya-Nyāya style, for the same reason serious work in many fields today is written with equations: once a community has a notation that makes claims precise, imprecise claims start to look underdressed.

That is the reputation the school carries: a technical language so exact that its prose reads like formal notation transcribed into Sanskrit. The reputation is deserved, and it is usually where the story stops. Dense, rigorous, forbidding. What this chapter argues is more specific. The devices that make Navya-Nyāya prose so exact are not merely rigorous in a general way. They map, one by one and with striking directness, onto the constructs of dependent type theory that Chapters 6 and 7 introduced. And the kernel this book runs on, the small Lean ontology you met in miniature in Chapter 7, takes its three central design choices from this school. The receipts for that claim are a real table and real code, and both are coming. First, the devices themselves, each with an everyday example before its Sanskrit name.

## The qualificand and its qualifier

Start with the simplest possible cognition: you look down and see a pot on the ground.

Ordinary language reports this as a sentence, "there is a pot on the ground," and moves on. The Navya-Nyāya analyst refuses to move on, because the sentence hides structure that the cognition itself plainly has. Something is being picked out: the ground. Something is being attributed to it: the pot. And they are tied together by a specific relation: contact, not ownership, not resemblance, not identity. Three components, each with a distinct role.

The thing picked out is the *viśeṣya*, the "qualificand": the item the cognition is about. The thing attributed is the *viśeṣaṇa*, the "qualifier": what is being said of it. The tie between them is the *saṃsarga*, the "connecting relation." A cognition, on this analysis, is never a flat sentence. It is a small tree: a qualificand at the base, a qualifier attached to it, and a labeled edge between them. "The pot is blue" has the same shape with different fillings: pot as qualificand, blue color as qualifier, inherence as the relation. Complex cognitions are bigger trees, qualifiers hanging on qualifiers, every edge labeled.

A modern reader with Chapter 6 behind them will feel the click at once. To say what a cognition is, give the subject, give what is predicated of it, and give the typed relationship under which the predication holds. This is subject-predicate structure taken seriously as data. It is the discipline of never writing an assertion whose parts and connective are not all explicit. Every judgment the kernel checks in this book has exactly this anatomy: an entity, something claimed of it, and the named relation doing the claiming.

So far, this might look like grammar-school parsing dressed up in Sanskrit. The next device is where the school earns its reputation.

## The delimitor

The tradition liked to worry about a tree and a monkey. A monkey sits on a branch of a tree. Is the tree in contact with the monkey? Yes. Is the tree free of monkey-contact? Also yes, at the root, where there is no monkey. So the same tree both has and lacks the same contact, and a discipline of exact statement cannot tolerate a sentence and its negation both coming out true.

The Navya-Nyāya repair is not to shrug at context. It is to add a parameter. The tree possesses monkey-contact *as delimited by the branch*, and lacks it *as delimited by the root*. Once the delimitor is written into the claim, the contradiction evaporates, because the two claims were never about the same thing: contact-at-the-branch and contact-at-the-root are different properties, and the delimitor is what makes them different.

The device is called the *avacchedaka*, the "delimitor": the item that pins down under which aspect, at which region, or in which respect a property qualifies its bearer. And it does far more than settle monkeys. Consider absence. "There is no pot on the ground." No pot at all? The analyst asks: absent under what description? The absence in question is the absence of anything falling under pot-ness, the property *ghaṭatva* (from *ghaṭa*, "pot"). The tradition's formula is that pot-ness delimits the counterpositive of the absence: what is missing from the ground is missing *as a pot*, not as clay, not as something blue. If a heap of clay sits there, the absence of a pot still stands, because clay-hood is not the delimiting property. Change the delimitor and you change which absence you have asserted, which is to say you change the claim.

The same device disciplines inference. In the stock inference "there is fire on the mountain, because there is smoke," the Navya-Nyāya statement of the underlying rule does not say "smoke goes with fire." It says that the pervasion holds between what is delimited by smoke-ness and what is delimited by fire-ness, so that the rule is about the kinds as such and cannot be accidentally satisfied by one lucky pair. Everywhere you look in this literature, claims travel with their delimitors, the way measurements travel with their units.

::: engineer
An avacchedaka is a type index. "Contact" in the monkey example is not one proposition but a family of propositions indexed by a delimiting value, and `contact(branch)` versus `contact(root)` is exactly the move from a proposition to a dependent family `P : Region → Prop`. The apparent contradiction is an arity error: the unparameterized claim was never well-formed. The kernel carries the device literally. Its `Avacchinna` structure packages a property name, an `avacchedaka` field for the delimiting entity, and the substrate, so a delimited property is one record, not a prose gloss. And the six-sort tag on every `Entity` is the same idea applied globally: each named thing is indexed by the kind of thing it is, and claims that ignore the index do not survive checking. Receipt: paper §2.3, §6.2; lean/VakyaVallari/Ontology.lean.
:::

## Relations that hold through relations

Everyday case first: a grandparent. Nobody is a grandparent directly. To be a grandparent is to stand in the parent relation to someone who stands in the parent relation to someone. The relation is real, but it holds through a chain, and to verify it you must traverse the chain.

Navya-Nyāya generalized this observation into a standing device: the *paramparā-sambandha*, the "relation through a chain" (*paramparā* means "succession," the same word the tradition uses for its teaching lineages; *sambandha* means "relation"). A property may reside in a locus not directly but via a spelled-out sequence of relations, and the analyst is obliged to spell it out. The pot's color qualifies the ground, if you insist on saying so, only through the chain: inherence of the color in the pot, then contact of the pot with the ground. Write the chain or do not make the claim.

The deep move here is what the chain does to relations themselves. If relations can be links in chains, and chains can be links in longer chains, then relations are not second-class annotations on things. They are first-class items that can themselves stand in relations. The tradition needed this constantly, and so does the text this book verifies. In the Vākyapadīya's opening verses, the commentary asserts that the power of time is the instrumental cause of the manifestation relation between the Absolute and the world. Read that carefully: the second relation, causation, has as one of its relata not a thing but another relation, the manifestation. A formalism in which relations only connect things cannot even state the sentence. A formalism with paramparā-sambandha states it without strain, and Chapter 7's `Node` type, where a relation is itself a node and can be a relatum of further relations to any depth, is that formalism. The full quotation comes later in this chapter.

## Four ways to be absent

Now the school's most famous commitment. In Navya-Nyāya's ontology, absence is not a mere failure to find something. It is a category of reality in its own right, called *abhāva*, "absence," and every absence comes with mandatory structure. There is the *pratiyogin*, the "counterpositive": the thing whose absence it is. And there is the *adhikaraṇa*, the "locus": where it is absent. You met *adhikaraṇa* in Chapter 3 as the locational kāraka role; the logicians reuse the word for the substrate that hosts an absence.

"There is no pot on the ground" therefore asserts an entity: an absence whose counterpositive is the pot (delimited, as we saw, by pot-ness) and whose locus is the ground. This has an immediate and very modern consequence: absences are typed. The absence of a pot on the ground and the absence of cloth on the ground are two different absences, distinguishable by their counterpositives, even though a lazy notation would write both as "not." Negation, in this school, never forgets what it negates or where.

The tradition counts four kinds of absence, and the taxonomy is worth thirty seconds because it shows how seriously the structure was taken. *Prāgabhāva*, "prior absence," is the absence of the pot before the potter makes it: an absence with an end but no beginning. *Pradhvaṃsābhāva*, "absence upon destruction," is the absence of the pot after it shatters: a beginning but no end. *Atyantābhāva*, "absolute absence," is the standing absence of what is never there at all. And *anyonyābhāva*, "mutual absence," is difference itself: the pot's not being cloth, an absence whose connecting relation is identity. Four constructors, distinguished by their temporal profile and their relation, all sharing the counterpositive-and-locus interface.

One question in this theory became a celebrated crux: what is the absence of an absence? If the absence of the pot is itself an entity, then it too can be a counterpositive, and we can ask what stands where *it* is missing. The tradition debated the question with full seriousness, and the line of answer associated with Raghunātha Śiromaṇi is the crisp one: the absence of the absence of the pot is nothing over and above the pot's own presence. Double negation does not build an ontological tower; it collapses. Hold that thought. At the end of this chapter, that collapse will be a computation the kernel performs, not a doctrine it quotes.

## The parser they already had

The devices so far analyze cognitions one at a time. The tradition also had a theory of where cognitions come from when language delivers them, and this is the piece that should startle anyone who has worked on compositional semantics.

The theory is called *śābdabodha*, "verbal cognition": the structured awareness that arises in a hearer from a sentence. The question it answers is precise. When a competent hearer of Sanskrit hears a sentence, exactly what cognition, with exactly what tree structure, arises? Take the grammarians' workhorse sentence from Chapter 3, pared to its core:

::: {.deva}
देवदत्तः ओदनं पचति
:::

::: {.iast}
*devadattaḥ odanaṃ pacati*
:::

"Devadatta cooks rice." The śābdabodha analysis derives the resulting cognition step by step. Each word contributes its meaning: the name contributes Devadatta, *odana* contributes rice, the verbal root contributes the activity of cooking. Each ending contributes a relation: the accusative marks rice as the object of the activity, the verbal ending marks Devadatta as the agent, the one whose effort drives it. And the output is written as one nested qualification: Devadatta, qualified by an activity conducive to cooking, an activity whose object is rice. Every node is a word-meaning. Every edge is a relation contributed by a grammatical element. Nothing arrives from nowhere.

Say what this is in modern terms and the sentence almost writes itself: a compositional semantics, mapping surface syntax to a typed structure by rules, with the lexicon supplying the leaves and the morphology supplying the edges. The manuals of the school derive the bodha for sentence after sentence, including the hard cases: negations, compounds, sentences with ambiguous scope. It is a semantic parser, fully specified, executed by trained humans instead of by machines, and debugged in public disputation for four centuries. When this book's pipeline takes a commentary sentence and elaborates it into typed claims a kernel can check, it is walking a path this tradition surveyed first.

::: pandit
The schools agreed on the tree and fought about its root. For the Naiyāyikas, the chief qualificand of "Devadatta cooks rice" is Devadatta, the referent of the nominative: the cognition is fundamentally about him, qualified by the cooking. For the grammarians, the chief qualificand is the activity named by the verb: the cognition is about a cooking, which Devadatta and the rice merely specify. For the Mīmāṃsakas, the ritual exegetes, it is the *bhāvanā*, the effort of bringing-about that the verbal ending expresses. Same sentence, same nodes, three inequivalent rootings of the tree, argued with full technical machinery on all sides. Notice what the dispute presupposes: all parties accept that a sentence's meaning is a structured object exact enough to disagree about node by node. The discipline did not end disagreement. It made disagreement precise, which is the most a formalism ever does.
:::

## Metarules, remembered

One more device, and this one is a callback. Chapter 3 introduced the *paribhāṣā*: the metarule, a rule about how to read and apply other rules. In Pāṇini's grammar, paribhāṣās decided what a genitive means inside a sūtra and which of four substitutes to choose. They never rewrote a single word themselves. They configured the machine that did.

The śāstric world at large ran on the same device. Grammarians compiled whole treatises of paribhāṣās, arguing about when each may be invoked and which takes precedence. The exegetes maintained their own stock of interpretive maxims for ritual texts. The logicians' procedures for unpacking a definition, testing it against counterexamples, and repairing it are rules about the conduct of derivation, not additional premises within it. Across the tradition, there is a clean two-level architecture: object-level rules that state facts, and a metalevel that governs their application.

Chapter 7 gave you the modern name for the metalevel. In a proof assistant, the object level is the logic: definitions, theorems, inference steps the kernel will accept. The metalevel is the tactic language: programs that decide which steps to take, in what order, with what search strategy. A tactic can never smuggle in a new axiom, just as a paribhāṣā can never rewrite a word of Sanskrit; both can only steer the machinery that exists. When Chapter 24 sketches what a Sanskrit-tuned prover would look like, paribhāṣā-as-tactic-language is one of its load-bearing walls. Here it takes its place in the pattern this chapter has been assembling, because the pattern is now complete enough to state as a table.

## The mapping

Five devices, five counterparts. This table is the center of the chapter, and each row gets its own paragraph of justification below it. Receipt for the table as a whole: paper §2.3 and §6.2.

| Navya-Nyāya device | Gloss | Type-theoretic counterpart | In this book's kernel |
|---|---|---|---|
| *avacchedaka* | delimitor | type index, delimiting parameter | sort tags on entities; the `Avacchinna` record |
| *paramparā-sambandha* | relation through a chain | nested values of an inductive relation type | `Node`: relations as relata, any depth |
| *abhāva* with *pratiyogin* and *adhikaraṇa* | absence with counterpositive and locus | negation that carries structure | `Abhava`: absence as a two-field record |
| *śābdabodha* | verbal cognition | elaboration from surface syntax to typed core | commentary sentences elaborated into typed claims |
| *viśeṣya* and *viśeṣaṇa* | qualificand and qualifier | subject-predicate typing | claims as entity, predicate, named relation |

Row one. A delimitor turns one ambiguous claim into a family of exact ones, indexed by the delimiting item: contact-at-the-branch, absence-of-what-falls-under-pot-ness. That is precisely the job of a type index or a parameter in a dependent family. In both traditions the payoff is identical: apparent contradictions dissolve into well-formed claims about different indices, and a claim that omits its index is rejected as not yet meaningful rather than debated as if it were.

Row two. Paramparā-sambandha requires that relations be able to serve as relata, since a chain of relations is itself the relation that holds through them. In type theory this is an inductive datatype whose relation constructor takes values of the same type as arguments, so relational structure nests without bound. The kernel's `Node` is the two-constructor realization, and the depth of nesting is itself a computable quantity.

Row three. A typed absence is a negation that remembers what it negates and where. The type-theoretic reading: where classical logic's negation is a truth-value flip that forgets everything, a structured negation is a value carrying its counterpositive and locus as data, so that two different denials are two different, distinguishable objects. The kernel's `Abhava` is this record, and because an absence reifies to a node, it can itself be a counterpositive, which is what makes the absence-of-absence question expressible at all.

Row four. Śābdabodha maps a surface sentence to a typed cognition-structure by compositional rules. The proof-assistant name for that mapping is elaboration: the front end that takes what a human wrote and produces the fully explicit core term the kernel checks. In this book's pipeline, the elaborator's role is played by the drafting process of Chapter 11, which turns commentary sentences into contract claims; the kernel then judges the result exactly as a type checker judges elaborated output.

Row five. The qualificand-qualifier analysis is the discipline of stating every judgment as a subject, a predicate, and an explicit connecting relation. In the kernel, a claim is literally that: an inductive datum built from sorted entities and named relations, with no unanalyzed sentence anywhere in the system. The humblest row of the table, and the one every other row stands on.

A caution before the code. The table asserts structural correspondence, not historical influence and not identity of doctrine. Navya-Nyāya did not have dependent type theory; it had no formal syntax, no notion of computation, no kernel. What it had was a worked-out discipline for writing cognition-structure exactly, and the claim is that the structures it settled on are the ones a dependent-type formalization reaches for today. The end of this chapter says plainly where the correspondence stops.

## Three choices, inherited

Chapter 7 promised that the real kernel is small, under 150 lines for the ontology and adequacy core. Here is where its three central design choices came from. All three are Navya-Nyāya, and now you can see each device behind each choice. Receipt throughout: lean/VakyaVallari/Ontology.lean and paper §6.2.

First choice: sorted identity. Every entity carries one of six ontological sorts, and identity claims across different sorts are stateable but decidably false. A translation that quietly demotes the Absolute to a mere property produces an identity claim between entities of different sorts, and the kernel refutes it by computation. That is the avacchedaka discipline applied at the coarsest grain: every named thing is indexed by its kind, and claims that blur the index fail, mechanically. Chapter 12 is about the editorial cost of maintaining those indices honestly.

Second choice: nested relations. Here is the real definition, exactly as the kernel states it:

```lean
/-- Relational graph node. A relation is itself a node, so relations
    can be relata of further relations without bound
    (paramparā-sambandha). -/
inductive Node where
  | ent : Entity → Node
  | rel : String → Node → Node → Node
```

Two constructors. A node is an entity, or a named relation between two nodes, and since those nodes may themselves be relations, chains nest to any depth. The commentary's claim that the power of time is the instrumental cause of the manifestation relation becomes one value: a `rel "nimitta"` whose second relatum is itself a `rel`. Depth 2, computed by the kernel's own `Node.depth` function. No ad hoc reification, no flattening, no loss.

Third choice: typed absence. Again the real definition:

```lean
/-- Typed absence: what is absent (counterpositive) and where (locus). -/
structure Abhava where
  pratiyogin : Node
  adhikarana : Node
```

The field names are not decoration. They are the tradition's own terms, carried into the code as a statement of provenance: this record is *abhāva*, with its counterpositive and locus as mandatory data, exactly as the school demanded. And because the kernel can reify an absence as a node, an absence can serve as a counterpositive, which lets the kernel state Raghunātha's crux and then do something the tradition could not: run it.

```lean
/-- Evaluate an absence. Double negation computes away
    (abhāvasya abhāvaḥ bhāva eva). -/
def Presence.ofAbhava (a : Abhava) : Presence :=
  match a.pratiyogin with
  | .rel "abhāva" p _ => .present p
  | n => .absent n a.adhikarana
```

Read the match. If the counterpositive of an absence is itself an absence of `p`, the verdict is the presence of `p`. The involution, the doctrine that the absence of an absence just is the presence, is not an axiom the kernel assumes and not a comment it displays. It is the first branch of a function, and the kernel's test suite pins it as a fact the type checker verifies by evaluation:

```lean
#guard Presence.ofAbhava (Abhava.ofAbhava noParinama) =
       Presence.present noParinama.pratiyogin
```

One honesty note, stated here because this book's rule is to state such notes where the claim is made. `Abhava` and the involution are exercised by the kernel's own tests, in lean/VakyaVallari/Tests.lean, and not by any verse module in the present Book I corpus. The Book I refutations you will watch in Chapter 10 rest on sorted identity and relation matching. Typed absence is provided machinery, built for the negation-heavy argumentation of Books II and III, where the Vākyapadīya spends whole stretches denying rival positions. The kernel proves the involution today; the corpus does not yet lean on it. Receipt: paper §6.2, which flags exactly this.

## Where the mapping stops

A chapter that has spent four thousand words on a correspondence owes the reader its limits, and they are real.

::: pandit
Three things do not map cleanly, and no claim in this book should be read as pretending otherwise. First, universals. When Navya-Nyāya says pot-ness delimits a counterpositive, many of its thinkers meant that *ghaṭatva* is a real universal, a *jāti*, existing in the world and inhering in every pot, with a supporting theory of which properties are genuine universals and which are mere imposed properties, *upādhi*. A type in Lean is nothing of the sort: it is a piece of formal syntax with no ontological commitment at all. The kernel borrows the structure of delimitation while staying silent on the metaphysics of universals, and the silence is a real difference, not a detail. Second, the epistemic layers. Navya-Nyāya is before everything a theory of knowledge: of how cognitions are produced, what makes them veridical, how perceptual error works, when a cognition of a cognition certifies the first. Type theory has no theory of perception and no account of error beyond ill-typedness. The whole pramāṇa apparatus, the school's actual center, has no counterpart in the kernel and is not modeled by this book. Third, the direction of ambition. Navya-Nyāya wanted to be right about reality; the kernel wants only to be faithful to a commentary. Structural kinship between their instruments is the claim here. Doctrinal agreement is not, and was never available.
:::

The correspondence itself is not this book's discovery. The field was opened by Daniel Ingalls, whose 1951 study first presented Navya-Nyāya's technical apparatus to modern logicians as logic, and by Bimal Krishna Matilal, whose 1968 work on the school's doctrine of negation made the structure of *abhāva* available to analytic philosophy. Everything in this chapter walks through doors those two opened. And the traffic through them is current. In 2026 alone, Panday and Ghosh encoded the school's core constructs, relational nesting, delimitors, and typed absence, in cubical type theory, the richer foundation flagged as a horizon in Chapter 6; and the Pramana project of Sathish trained large language models on the school's staged method of analysis. One line takes the logic into deeper foundations; the other takes it into machine reasoning. This book's kernel sits deliberately in between: Navya-Nyāya's structural choices, in plain Lean 4, doing verification work on a real text. Receipt: paper §2.3.

The point of the chapter, then, is not that medieval Bengal secretly had Lean. It is narrower and stranger. When this project needed to decide how a formal ontology for a Sanskrit philosophical text should represent qualification, delimitation, relational nesting, and denial, the best available answers turned out to be the ones a school of Sanskrit logicians had already engineered, under memory constraints and in prose, five centuries earlier. The kernel did not impose a foreign formalism on the tradition. On its three deepest choices, it took dictation.

## The thread so far

Part II set out to build the second half of the bridge: proof as a technology, propositions as types, and a working kernel in an afternoon. This chapter closed the loop by showing that the far bank was never foreign ground. Navya-Nyāya's delimitors, relational chains, typed absences, and verbal-cognition analysis correspond, device by device, to the type-theoretic constructs the kernel uses, and the kernel's three design choices are inherited from the school outright, down to field names and a double negation that computes. Both halves of the bridge now stand, and Part III joins them: commentary as specification, and the machine that holds translations to it.

*Doors: proof-assistant readers (B) get the mapping table and the kernel code that cashes it; vyākaraṇa students (D) get śābdabodha and paribhāṣā placed beside their grammatical kin from Chapter 3; commentary scholars (E) get Ingalls and Matilal, the honest limits of the correspondence, and the doxographic caution that goes with it; AI engineers (A) get elaboration and structured negation as engineering patterns; Sanskrit readers (C) are carried by Navadvīpa, the monkey on the tree, and Devadatta's rice.*
