# 7 · Lean in an Afternoon

This chapter is a sitting, not a course. By the end of it you will have built, with your own hands, a working miniature of the machine this whole book runs on. You will define what a sort is, what an entity is, what a claim is, and what a contract is. You will state a rule for when a set of commentary axioms entails a claim. You will prove, with a real theorem checked by a real kernel, that one reading of a verse is adequate. You will prove that another reading is not. And then you will open the actual kernel of this book's edition and discover that you can simply read it, because you just wrote it.

Nothing here requires installing anything. Lean runs in the browser at live.lean-lang.org, and every listing in this chapter can be pasted there and checked as you go. If you would rather work locally, with the same toolchain this book's repository uses, Appendix A walks through the installation and the build commands. For now, a browser tab is enough.

One promise before we start. Every ingredient the real system uses appears in this chapter. There is no hidden machinery waiting in a later chapter to do the actual work. The real kernel is small. It fits under 150 lines across two files (lean/VakyaVallari/Ontology.lean and lean/VakyaVallari/Adequacy.lean), and by the end of the afternoon those lines will be familiar.

## What Lean feels like

Lean is two things wearing one name. It is a programming language, in which you define data types and functions the way you would in any modern typed language. And it is a proof assistant, in which you state propositions and construct proofs that a small, trusted kernel checks. Chapter 6 argued that these are secretly the same activity: propositions are types, proofs are programs. Lean is where that slogan becomes a tool you can hold.

The experience is conversational. You type a definition. The editor either accepts it silently or underlines it and tells you exactly what it wanted. You state a theorem. A panel shows you the current goal, the thing still to be proved, and it updates as you work. Lean is a colleague who never gets tired, never gets bored, and never lets a step slide because it sounded plausible. Working with it feels less like writing and more like negotiating. You propose; it disposes.

Try the smallest possible exchange. Type this:

```lean
#eval 2 + 2
```

The `#eval` command runs a computation and shows the result: `4`. Now ask for something stronger than a computation. Ask for a proof:

```lean
theorem four : 2 + 2 = 4 := by decide
```

Read it right to left. `by decide` says: prove this by computing. `decide` is a tactic, a proof-building command, and it works on any statement that a finite computation can settle. The kernel evaluates both sides, sees that the proposition reduces to a true decidable statement, and accepts. The name `four` now refers to a checked proof object, not to a comment or a claim.

And now do something wrong on purpose, because the error messages are half the pedagogy:

```lean
theorem oops : 2 + 2 = 5 := by decide
```

Lean answers:

```
tactic 'decide' proved that the proposition
  2 + 2 = 5
is false
```

Notice what that message is. It is not a shrug. Lean did not fail to find a proof; it found a refutation. The machine ran the computation, got a definite answer, and reported that the answer is no. This distinction between "I could not prove it" and "I proved it is false" is the engine of everything this book does with rejected translations. Hold onto it. We will use it within the hour.

## Naming a world: inductive types

Every formalization begins by naming the kinds of things that exist. Lean's tool for this is the inductive type: a type defined by listing, exhaustively, the ways to build one of its values.

The real kernel begins by naming the kinds of things in Bhartṛhari's world. We will do the same, at miniature scale. The book's ontology distinguishes six sorts; our afternoon version keeps three:

```lean
inductive Sorta where
  | absolute        -- the ultimate ground, what simply is
  | manifestation   -- what appears from the ground
  | property        -- mere attributes of things
deriving DecidableEq, Repr
```

Read the pieces. `inductive Sorta where` opens the definition. Each line starting with `|` introduces a constructor, one legal way to make a `Sorta`. There are exactly three values of this type, no more, ever. The comments after `--` are for humans; Lean ignores them.

The name deserves a note. It is `Sorta`, not `Sort`, because Lean reserves the word `Sort` for its own type hierarchy. The real kernel makes the same dodge for the same reason (lean/VakyaVallari/Ontology.lean). Small collisions like this are the texture of formal work.

The last line, `deriving DecidableEq, Repr`, asks Lean to generate two capabilities automatically. `Repr` means values of this type can be printed. `DecidableEq` means equality between any two values can be decided by computation. That second one is quietly the most important line in this chapter. It is what will let `decide` settle questions about our world. Whenever you see `deriving DecidableEq` below, hear it as: "questions about these values can be answered by running a program, and the answers count as proofs."

Check that it works:

```lean
#eval Sorta.absolute == Sorta.property   -- false
```

Two different constructors, so not equal. Obvious to you, and now provable by machine.

## Pairing things up: structures

An inductive type says "one of these alternatives." A structure says "all of these fields together." An entity, in our system, is nothing more than a name paired with a sort:

```lean
structure Entity where
  name : String
  sort : Sorta
deriving DecidableEq, Repr
```

This is verbatim the real kernel's definition, minus three sorts (lean/VakyaVallari/Ontology.lean). To build one, give both fields. Lean offers a compact anonymous-constructor syntax with angle brackets:

```lean
def ocean : Entity := ⟨"ocean", Sorta.absolute⟩
```

`def` introduces a definition: the name `ocean` now denotes this particular entity, an absolute-sorted thing called "ocean". Why an ocean? Because in a moment we are going to invent a tiny practice verse of our own, and it will be about water.

Pause on what the pairing buys. Two entities with the same name but different sorts are different entities:

```lean
#eval (⟨"ocean", Sorta.absolute⟩ : Entity) == (⟨"ocean", Sorta.property⟩ : Entity)
-- false
```

This looks like a technicality. It is the whole game. When a translator renders a Sanskrit term as a mere property of something, and the commentary insists the term names the ultimate ground itself, the two renderings produce different entities, and any identity claim between the wrong pair is decidably false. The most consequential failure mode this book mechanizes is exactly this one-line computation, scaled up (paper §3; lean/VakyaVallari/Verses/V1_1.lean).

## What a translation asserts: claims

A translation of a verse, stripped of its literary clothing, asserts things. In this system a translation asserts claims, and there are three shapes a claim can take. This calls for another inductive type, this time with constructors that carry data:

```lean
inductive Claim where
  | identity : Entity → Entity → Claim
  | predication : String → Entity → Claim
  | relation : String → Entity → Entity → Claim
deriving DecidableEq, Repr
```

Read the arrows as "takes ... and gives." The constructor `identity` takes two entities and gives a claim: the claim that they are the same thing. `predication` takes a property name and an entity: the claim that the property holds of the entity. `relation` takes a relation name and two entities: the claim that the first stands in that relation to the second.

Three shapes is deliberately austere. "The wave-stuff is the ocean" is an identity. "The ocean is imperishable" is a predication. "The ocean appears as the waves" is a relation. A remarkable amount of what commentaries adjudicate fits these shapes, and where a verse demands more, the real system grows carefully rather than lavishly. In the real kernel the two relata of a relation are not bare entities but nodes, which can themselves be relations, allowing relations between relations, nested without bound. That extra generality comes from Navya-Nyāya, and it is the subject of the next chapter. Our miniature does not need it this afternoon.

Build a claim to see the syntax:

```lean
def waves : Entity := ⟨"waves", Sorta.manifestation⟩

#eval Claim.relation "appears-as" ocean waves
```

`Repr` prints it back. You have now constructed, as a first-class value in a programming language, the assertion that the ocean appears as the waves. Assertions that are data can be listed, compared, searched, and judged. That is the next step.

## Judging claims: lists and entailment

A commentary, for our purposes, licenses some claims. Call the licensed ones axioms and put them in a list. `List Claim` is the type of lists of claims, written with square brackets and commas. The question a validator must answer is: given the axioms, is this claim entailed?

The real system's answer is deliberately humble. Entailment is list membership, plus one grace note: identity is reflexive and symmetric. Everything is the same as itself, and if the axioms say a is b, they have also said b is a. Here is the function, and apart from the relata being entities rather than nodes it is exactly the kernel's (lean/VakyaVallari/Adequacy.lean):

```lean
def entails (axioms : List Claim) : Claim → Bool
  | .identity a b =>
      a == b
        || axioms.contains (.identity a b)
        || axioms.contains (.identity b a)
  | c => axioms.contains c
```

New syntax, one piece at a time. The return type `Claim → Bool` says this definition, given the axiom list, is itself a function from claims to booleans. The `|` lines then define it by pattern matching on the claim's shape. The first pattern, `.identity a b`, catches identity claims and names their two entities; the leading dot is shorthand for `Claim.identity`. For those, we answer yes if the entities are equal (`a == b`, reflexivity), or the axioms contain the claim, or the axioms contain it flipped (symmetry). The `||` is boolean "or". The final pattern `c` catches every other claim, and for those entailment is bare membership.

Why so little? Because every ounce of cleverness in the entailment relation is an ounce of trust moved from the human-auditable contract into machinery. A scholar skeptical of this whole enterprise can read these seven lines in one breath and know exactly what "entailed" means. Shallow entailment is not a limitation that slipped in; it is a design position, and Chapter 23 gives it a full airing.

## The adequacy judgment

Now bundle a translation's claims into a value:

```lean
structure Reading where
  claims : List Claim
deriving Repr
```

A reading is adequate, relative to a list of axioms, when every claim it makes is entailed:

```lean
def Adequate (axioms : List Claim) (r : Reading) : Prop :=
  r.claims.all (entails axioms) = true

instance : Decidable (Adequate axioms r) := by
  unfold Adequate; infer_instance
```

Two things are happening. `r.claims.all (entails axioms)` runs the entailment check over every claim in the list and ands the results: a boolean computation. The definition then asserts, as a proposition, that this computation returns `true`. The `instance` declaration tells Lean that this proposition is decidable: since it is just an equation between booleans, a computation can settle it, so `decide` may be used on it. The names `axioms` and `r` in the instance are automatically generalized; the statement covers every axiom list and every reading. This Prop-wrapping-a-Bool pattern is the standard way to get statements that are both provable and runnable, and the real kernel uses it verbatim.

But a commentary does more than license. It also refuses. Bhartṛhari's commentator does not merely fail to mention that Brahman transforms into the world; he rules it out. A denial is stronger than an absence, and the system must represent it. That is what a contract is:

```lean
structure Contract where
  axioms : List Claim
  denials : List Claim
deriving Repr
```

A contract judges a reading in two independent ways. Does the contract license everything the reading asserts? Does the reading assert anything the contract denies?

```lean
def Contract.licenses (k : Contract) (r : Reading) : Bool :=
  r.claims.all (entails k.axioms)

def Contract.contradicts (k : Contract) (r : Reading) : Bool :=
  r.claims.any (k.denials.contains ·)

def Contract.Adequate (k : Contract) (r : Reading) : Prop :=
  k.licenses r = true ∧ k.contradicts r = false

instance : Decidable (Contract.Adequate k r) := by
  unfold Contract.Adequate; infer_instance
```

The `∧` is logical "and". Adequacy demands both: all claims entailed, and none denied. A reading that fails the first is unlicensed; it says more than the commentary permits. A reading that trips the second is contradicted; it says what the commentary forbids. The second defect is the graver one, and keeping the two verdicts separate is what lets the edition report not just that a translation failed but how (lean/VakyaVallari/Adequacy.lean).

That is the entire kernel. Sorts, entities, claims, readings, entailment, contracts, adequacy. You have written all of it.

![The kernel's type structure: six sorts type the entities, entities build claims, claims fill contracts and readings, and adequacy is decided by computation.](book/assets/figures/fig09-kernel-types.png "Diagram of the kernel's types: a Sorta enumeration of six sorts typing Entity, entities feeding Claim with its identity, relation, and predication kinds, claims filling Contract with axioms and denials and Reading with claims, and both flowing into the decidable Adequate proposition closed by decide.")

::: engineer
Why route everything through `Bool` and then wrap in `Prop`? Because of what `decide` actually does. When you write `by decide`, Lean's elaborator finds the `Decidable` instance for the goal, evaluates it, and if the answer is yes, produces a proof term. The kernel, the small trusted core from Chapter 5, then independently checks that term by rerunning the reduction. Nothing is taken on the tactic's word; the tactic only proposes, the kernel disposes. This is why `deriving DecidableEq` mattered so much: it is the ground-level supply of decidability from which the instances for `Adequate` are assembled by `infer_instance`. The trust story for every verdict in this book is: a computation the kernel replayed.
:::

## A verse of our own

The real contracts are compiled from a Sanskrit commentary. For practice we will invent a miniature scripture, one verse long, so that no philology stands between you and the mechanics. Here is our verse, and the one commentary sentence that fixes its meaning:

> *The verse:* "The imperishable ocean is the wave-stuff; from it the waves come forth."
>
> *The commentary:* "The wave-stuff is nothing other than the ocean itself; the ocean, which does not perish, appears as the waves; the ocean does not break into the waves."

The commentary sentence does three jobs. It licenses an identity (wave-stuff is the ocean). It licenses a predication (the ocean is imperishable) and a relation (the ocean appears as the waves). And it denies a rival relation (the ocean breaks into the waves). Watch each job become a line of data:

```lean
def wavestuff : Entity := ⟨"wave-stuff", Sorta.absolute⟩

def contract : Contract :=
  { axioms := [ Claim.identity wavestuff ocean
    , Claim.relation "appears-as" ocean waves
    , Claim.predication "imperishable" ocean ]
  , denials := [ Claim.relation "breaks-into" ocean waves ] }
```

Note the sort on `wavestuff`. The commentary said the wave-stuff *is* the ocean, and the ocean is our absolute. So the wave-stuff is entered as `Sorta.absolute` too, not as a property of water. This is an interpretive decision, made by a human reading the commentary, recorded as data. The machine will enforce it; it did not make it. Keep that division of labor in view. It is the boundary of the whole method.

Now take an English translation of our verse: "The imperishable ocean is itself the wave-stuff, and it appears as the waves." As a reading:

```lean
def accepted : Reading :=
  { claims := [ Claim.identity ocean wavestuff
    , Claim.predication "imperishable" ocean
    , Claim.relation "appears-as" ocean waves ] }
```

Look closely at the first claim. The translation says the ocean is the wave-stuff; the axiom says the wave-stuff is the ocean. The orders differ. This is exactly why `entails` closed identity under symmetry, and here is where that grace note earns its keep. State the theorem:

```lean
theorem accepted_adequate : contract.Adequate accepted := by decide
```

Paste it in. Lean accepts, silently. Sit with the silence for a moment, because a great deal happened inside it. The checker walked all three claims. It found the flipped identity via the symmetry clause, the predication and the relation by membership. It confirmed that no claim appears among the denials. It reduced the conjunction to a true statement, built a proof object, and the kernel verified that object. The theorem `accepted_adequate` is now a permanent, replayable certificate that this translation says nothing the commentary does not license and nothing it denies. This is the shape, letter for letter, of the theorem the real system proves about the accepted translation of Vākyapadīya 1.1: there the line reads `theorem accepted_adequate : contract.Adequate accepted := by decide` as well (lean/VakyaVallari/Verses/V1_1.lean).

::: vrtti
In our toy, the "commentary" is one English sentence and you took my word for the axioms. In the real edition no one takes anyone's word. Each axiom in a contract carries a verbatim quotation from the vṛtti, the prose commentary in Subramania Iyer's (1965) edition, and a test suite checks that every quoted string actually occurs in the source text (tests/test_contracts.py). The step from commentary sentence to axiom remains human and contestable; the quotation makes it auditable. Chapter 10 walks the real 1.1 contract sentence by sentence.
:::

## Two ways to be wrong

Adequacy would mean little if nothing failed it. Our contract recognizes two distinct defects, so let us manufacture one of each.

First, contradiction. A rival translation: "The imperishable ocean shatters into the many waves." Its central assertion is the very relation the commentary denies:

```lean
def shattered : Reading :=
  { claims := [ Claim.relation "breaks-into" ocean waves ] }
```

Suppose an optimistic editor tries to prove this one adequate:

```lean
theorem shattered_adequate : contract.Adequate shattered := by decide
```

Lean answers:

```
tactic 'decide' proved that the proposition
  contract.Adequate shattered
is false
```

There is the error message from the start of the afternoon, now carrying real weight. The machine did not merely decline; it established the negation. So write down what it actually found:

```lean
theorem shattered_inadequate : ¬ contract.Adequate shattered := by decide

#guard contract.contradicts shattered = true
```

The `¬` is logical negation, and `decide` proves negations of decidable falsehoods as happily as it proves truths. The `#guard` line is a checked assertion, a test that runs at compile time: it pins down the diagnosis, contradicted rather than merely unlicensed. A failed proof attempt was not a dead end. It was information, and we promoted it into a theorem. In this system, rejected translations are not deleted or footnoted; they are kept, as proved counterexamples, under exactly this pattern (lean/VakyaVallari/Verses/V1_1.lean, the Counterexamples namespace).

Second, the subtler defect: the sort error. Another rival: "The imperishable pattern of waviness in the ocean has neither beginning nor end." This translator has demoted the wave-stuff to a property of the ocean, a pattern in it, rather than the absolute itself:

```lean
def wavestuff_naive : Entity := ⟨"wave-stuff", Sorta.property⟩

def naive : Reading :=
  { claims := [ Claim.identity wavestuff_naive ocean ] }

theorem naive_inadequate : ¬ contract.Adequate naive := by decide

theorem naive_sort_error : wavestuff_naive ≠ wavestuff := by decide
```

Trace why this fails. The reading's identity claim relates `wavestuff_naive` to `ocean`. Reflexivity does not fire: the two entities differ. Membership does not fire either, in either orientation, because the axiom's identity involves `wavestuff` with sort `absolute`, and `wavestuff_naive`, same name, different sort, is a different entity. The claim is unlicensed. Nothing here matches a denial; the translation is not contradicted, just saying something the commentary never authorized. The second theorem records the root cause: the naive entity is provably not the contract's entity. One word, two sorts, and the machine can tell them apart. This is the miniature of the real system's flagship refutation, where a published-style rendering of śabdatattva as "linguistic structure" fails on precisely this decidable sort mismatch (lean/VakyaVallari/Verses/V1_1.lean; paper §3.3).

::: pandit
Our three sorts are a training-wheels version of the kernel's six, and the six are not an engineer's invention. They name the furniture of the Vākyapadīya's own world: svatantra, the independent ground (Brahman, śabdatattva); śakti, the powers such as time; the vivarta-level manifestations (jagat, the artha-domain); empirical speech units (dhvani, pada, vākya); dharma, mere properties; and cognition (pratibhā, jñāna). The sort discipline mechanizes a distinction the tradition already policed with care: to say that the word-principle is a property of something is not a loose paraphrase of saying it is the ultimate; it is a different darśana. Where one word legitimately spans sorts, as akṣara does, the edition must say so explicitly in a homonym registry, and Chapter 12 tells that story.
:::

## The reveal

You have been writing the real thing all along. Open lean/VakyaVallari/Ontology.lean and lean/VakyaVallari/Adequacy.lean in the book's repository and read the core declarations, quoted here exactly, with only their comment headers elided:

```lean
inductive Sorta where
  | absolute        -- svatantra ontological ground (brahman, śabdatattva)
  | power           -- śakti (kālaśakti, ...)
  | manifestation   -- vivarta-level phenomena (jagat, artha-bhāva)
  | linguisticItem  -- empirical speech units (dhvani, pada, vākya)
  | property        -- dharma, mere attributes
  | cognition       -- pratibhā, jñāna
deriving DecidableEq, Repr

structure Entity where
  name : String
  sort : Sorta
deriving DecidableEq, Repr
```

```lean
def entails (axioms : List Claim) : Claim → Bool
  | .identity a b =>
      a == b
        || axioms.contains (.identity a b)
        || axioms.contains (.identity b a)
  | c => axioms.contains c

def Contract.Adequate (k : Contract) (r : Reading) : Prop :=
  k.licenses r = true ∧ k.contradicts r = false
```

You can read every line. `Entity` is yours, character for character. `entails` is yours, character for character. `Contract.Adequate` is yours. The differences between your afternoon kernel and the book's kernel are few and enumerable. The real `Sorta` has six constructors where yours has three. The real `Claim` takes its relation arguments as `Node` values rather than bare entities, where a `Node` is either an entity or a relation between nodes, so that relations can relate relations, nested without bound. The real ontology adds `Abhava`, typed absence with a counterpositive and a locus, along with a small theorem that the absence of an absence computes to the presence itself. And the real `Contract` carries a third list, `reported`, for claims a commentary reports from opponents without endorsing, so that doxographic verses can be handled honestly. Every one of these extensions comes from Navya-Nyāya, the Indian tradition of exact cognition-analysis, and Chapter 8 is devoted to them. None changes the shape of what you built. They widen the world; the judgment at its center, licensed and not denied, decided by computation, is the one you proved theorems with today.

## From an afternoon to an edition

Scale is the only thing left. What you did once for an invented ocean verse, the repository does 144 times, once for every unit of the Vākyapadīya's first book. Each verse has a contract compiled from the commentary, an accepted reading proved adequate, and rejected readings proved inadequate, each refutation labeled contradicted or unlicensed. The whole stands at 566 theorems with zero uses of `sorry`, Lean's placeholder for an omitted proof, and continuous integration rebuilds every proof from source on every change, enforcing that zero (docs/book/PRD.md; README.md). A single command replays what the afternoon taught you, at full scale:

```
cd lean && lake build
```

If any contract, any reading, any theorem fails to check, the build fails, publicly. There is no reviewer discretion in that gate and no fatigue. When a later chapter reports that a translation "compiles against the commentary" or that a rival reading "is refuted by decide," you now know the literal, unglamorous, checkable thing being claimed, because you have caused both outcomes with your own hands: the silence of an accepted theorem, and the error message that is really a proof.

## What you now own

Before closing the tab, place the afternoon's work on the map Chapter 6 drew at its end. You have just built, at toy scale, the same architecture that currently defines the frontier of machine mathematics.

Recall the shape. When Google DeepMind's AlphaProof reached silver-medal standard on the 2024 International Mathematical Olympiad, solving four of six problems, its proofs were written in Lean and every step was checked by the kernel (Google DeepMind 2024; AlphaProof team 2025). A model searched and proposed; the checker refused everything unsound. Propose and verify. Now look back at your session. You proposed `shattered_adequate`, and the checker refused. You proposed `accepted_adequate`, and the checker accepted, silently, after replaying the computation. You have been running the same loop. The tactic proposes; the kernel disposes. That sentence from the engineer box is not a description of your toy in particular. It is the structural answer to the era's defining problem, that fluent systems, human or machine, produce plausible text rather than verified truth.

Two things differ between your afternoon and the frontier, and it is worth being exact about both. The first is the domain. AlphaProof's checker judges mathematics; yours judges meaning, whether a reading keeps faith with a commentary. The second is the size of the search. At the frontier, the proposer is a reinforcement-trained model exploring vast proof spaces; at your desk, the proposer was you, and the proofs were two words long. But the checker's role is identical in both places, and the checker is the part that carries the trust. Yours fits in 150 lines, and you wrote it.

That is why this chapter exists. When Part III puts language models in the proposer's seat, drafting contracts and readings at scale, you will not need to take the safety story on faith. You own the pattern. You have felt the silence of acceptance and read the refusal that is really a proof, and you know that nothing a fluent proposer says gets past the gate you built by hand.

## The thread so far

One verse showed us that translations encode incompatible worldviews, and the tradition's own answer was commentary. The formal tradition gave us proofs as checkable objects and propositions as types. This chapter joined the two in miniature: you built sorts, entities, claims, and contracts, then proved one reading of an invented verse adequate and two readings defective, using the same definitions and the same `decide` that the book's real kernel uses. What remains is to see the tradition's own exactness deepen the kernel, and then to watch the real Verse 1.1 go through the machine end to end.

*Doors: B, you have now written the kernel and should read everything after this with proofs in hand; A, the contract-and-gate pattern you just exercised is the architecture Chapters 9 and 11 generalize, and it is the same propose-and-verify loop AlphaProof runs at the frontier; C and D, skim the listings and keep the verdicts: accepted readings compile, rejected ones are refuted, and Chapter 10 replays this for the real verse.*
