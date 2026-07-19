# 6 · Propositions as Types

The last chapter ended with a promise. Proof assistants resolved the crisis of trust in computer proof by shrinking the thing you must trust to a small kernel, a checker so simple that a skeptic can read it. But we left a question hanging. What does that kernel actually do? What kind of object does it check, and what does checking mean?

The answer is one idea, and it is the deepest idea in modern proof. Propositions are types. Proofs are programs. Checking a proof is type-checking a program. When the checker says yes, it is not saying "this argument sounds persuasive." It is saying "this program is well formed," and by the correspondence, that is the same as saying the theorem is proved.

This chapter builds that idea from the ground, assuming nothing. If you have never programmed, you will get the whole ladder, starting from why a computer refuses to add a date to a distance. If you have programmed for years but never met the correspondence, the ladder has a landing for you too, about halfway up, where the types you already use turn out to have been logic all along.

## A date is not a distance

Start with an embarrassment. In 1999, NASA lost the Mars Climate Orbiter, a spacecraft worth hundreds of millions of dollars. The cause was not an explosion or a solar flare. One piece of software reported thrust in pound-force seconds. Another piece consumed that number as if it were newton seconds. Both programs worked perfectly. The number passed between them was just a number, and a number does not remember its units. The spacecraft entered the Martian atmosphere at the wrong altitude and was destroyed.

Every programmer knows a small version of this story. A program is full of values: numbers, pieces of text, dates, temperatures, account balances. To the machine, deep down, all of them are patterns of bits. Nothing in the bits themselves stops you from adding a customer's birthday to the distance between two cities. The result is a pattern of bits like any other. It is also nonsense.

A **type** is the guard against this. A type is a label attached to a value that says what kind of thing it is and, therefore, what you are allowed to do with it. `Date` is a type. `Distance` is a type. A language with a **type checker**, a program that inspects your program before it runs, will look at `birthday + distance` and refuse. Not warn. Refuse. The program never runs, so the nonsense never happens.

Notice what kind of protection this is. A test would run the program on some example and inspect the output. The type checker does something stronger and stranger: it rules out a whole class of wrong programs without running anything. It reasons about the program's text. "This expression, whatever value it takes at runtime, will be a `Date`. That function, whatever happens, requires a `Distance`. These do not fit." The check is universal over all runs, past and future, because it never depended on any particular run.

Hold on to that phrase: universal, without running. It is the shape of a mathematical proof, met in the wild, wearing work clothes.

## Types as contracts

Beginners meet types as guards. Experienced programmers come to see them as something better: contracts.

A function, in programming, is a small machine that takes inputs and produces an output. Its type is its signed agreement with the world. A function of type `Distance → Time → Speed` (read the arrow as "goes to") promises: give me a distance and a time, and I will give you a speed. Not a date. Not an error message on Tuesdays. A speed. The type checker holds both sides to the agreement. The function body may not return anything else, and no caller may pass anything else in.

Once you see types as contracts, you can start designing with them, and a slogan from the functional-programming trade names the goal: *make illegal states unrepresentable*. Do not write a program that can enter a bad state and then police it with runtime checks. Design the types so the bad state cannot even be expressed.

A small example. Many programs crash on "the first element of an empty list," the software equivalent of the eldest child of a childless couple. The policing approach adds a check: if the list is empty, raise an error, and hope every caller remembers. The type approach defines a new type, `NonEmptyList`, whose very construction requires at least one element. Now the function that takes the first element demands a `NonEmptyList` in its contract. The crash is not handled. It is impossible. There is no way to write the crashing program; the checker rejects it as ungrammatical.

This is the point at which types stop being about machine efficiency and start being about meaning. A rich type is a precise statement of intent, and the checker is an auditor that reads every line of the program against that statement. Whole categories of bugs become, literally, unwritable.

Now the question this chapter turns on. How far can this go? If a type can say "a list with at least one element," can a type say "a sorted list"? Can it say "a prime number greater than a million"? Can it say "a reading of this Sanskrit verse that is faithful to its commentary"?

It can. And the discovery of how is one of the quiet marvels of twentieth-century logic.

## The correspondence

Here is the leap, stated first in one breath. A proposition, a claim that could be true or false, can be read as a type. A proof of that proposition can be read as a program, a value belonging to that type. A proposition is true exactly when its type has at least one program in it, when the type is *inhabited*. And a proof checker is a type checker: to verify a proof, verify that the program has the type it claims.

That sounds like a pun. Watch it become precise, one logical word at a time.

**Implication is a function type.** Take the proposition "A implies B": whenever A holds, B holds. What would count as evidence for it? Not evidence for A, and not evidence for B. Something conditional: a *method* which, handed any evidence for A, produces evidence for B. Now say that in programming vocabulary. A method that takes any value of type A and returns a value of type B is a function of type `A → B`. Evidence for an implication *is* a function. The same arrow we read as "goes to" in `Distance → Time → Speed` reads as "implies" in logic, and this is not an analogy. It is the same arrow, the same rule for using it, the same check.

Feel what this does to proof. To prove "A implies B" is to write a working converter from proofs of A to proofs of B. And the oldest move in mathematics, applying a general theorem to a particular case, is function application: you have a program of type `A → B`, you have a value of type A, you call one on the other, and you hold a value of type B.

**Conjunction is a pair.** Evidence for "A and B" is evidence for A together with evidence for B, both, side by side. In programming, a value that carries an A and a B together is a pair, type `A × B`. To use a conjunction, take the pair apart. To prove one, put a pair together.

**Disjunction is a tagged union.** Evidence for "A or B" is evidence for one of them, plus the honesty to say which. Programmers know this shape as a tagged union (or "sum type"): a value of type `A + B` is either a value of A wearing a left tag or a value of B wearing a right tag. The tag matters. When you use an "or," you must handle both cases, and the type checker will not let you forget one. Every case analysis in mathematics is this.

**Falsity is the empty type.** The proposition False, the absurdity that should never hold, corresponds to a type with no values at all. Nothing inhabits it. No program of that type can ever be produced, which is exactly what "unprovable because untrue" should mean. And negation comes free: "not A" is "A implies False," which is now the function type `A → Empty`. To refute A is to write a converter that turns any alleged evidence for A into a value of the empty type. Since the empty type has no values, the existence of such a converter shows A had no evidence to begin with.

Lay it out as a table and the two columns are one subject wearing two vocabularies:

| Logic | Programming |
|---|---|
| proposition `A` | type `A` |
| proof of `A` | program (value) of type `A` |
| `A` implies `B` | function type `A → B` |
| `A` and `B` | pair type `A × B` |
| `A` or `B` | tagged union `A + B` |
| falsity | the empty type |
| not `A` | function type `A → Empty` |
| `A` is true | type `A` is inhabited |

This is the **Curry-Howard correspondence**, named for the logicians Haskell Curry, who noticed the first traces of it in the 1930s and 1940s, and William Howard, whose 1969 note "The formulae-as-types notion of construction" made it exact. It is a theorem-grade observation, not a metaphor: the rules for building well-typed programs and the rules for building valid proofs are, symbol for symbol, the same rules.

![The Curry and Howard correspondence: each logical notion on the left mirrors a programming notion on the right across one bridge.](book/assets/figures/fig08-curry-howard.png "Diagram of two mirrored columns joined by a central bridge, pairing proposition with type, proof with program, implication with function, conjunction with pair, and checking a proof with type-checking.")

One tiny example, in Lean, the language this book uses. The proposition "A and B implies B and A" becomes the type `A × B → B × A`, and its proof is a two-line program:

```lean
def swap : A × B → B × A :=
  fun p => (p.2, p.1)
```

Take the pair, return it flipped. That program is not a persuasive essay about commutativity. It *is* the proof, and checking the proof means type-checking those two lines, a purely mechanical act.

Now the payoff for Chapter 5's cliffhanger. A proof assistant's kernel is small because, under this correspondence, "check the proof" collapses into "check the types," and type-checking is a simple, well-understood, mechanical discipline. The kernel does not need to be clever. It does not evaluate elegance or plausibility. It confirms, symbol by symbol, that a term has the type it claims. All the creativity lives outside the kernel, in constructing the term. All the trust lives inside it, in a checker small enough to read in a sitting.

## Types that mention values

The correspondence as stated covers the logic of and, or, not, implies. Real mathematics, and real philology, needs more. "Every verse in Book I has a contract" quantifies over verses. "This particular reading is adequate to this particular contract" is about specific things, not shapes of things. To express that, types must be allowed to do something ordinary type systems forbid: mention values.

A **dependent type** is a type that depends on a value. The standard first example is the vector. In most languages, `List Nat` is the type of lists of natural numbers, of any length; the length is a runtime fact, invisible to the checker. In a dependent type system you can write `Vec Nat n`: the type of lists of natural numbers *of length exactly n*, where `n` is a value, a particular number, sitting inside a type. `Vec Nat 3` and `Vec Nat 4` are now different types. A function that takes the first element can demand `Vec Nat (n + 1)`, a vector whose length is visibly one more than something, hence visibly not zero. The empty-list crash from earlier is now excluded by arithmetic that the type checker itself performs.

This is the moment types cross over from expressing *shape* to expressing *meaning*. "A list" is shape. "A list of length n" mentions a fact. "A sorted list" can be expressed too: a list packaged with a proof, in the Curry-Howard sense, that each element is at most the next. "A prime greater than a million" is a number packaged with two proofs. The type has become a precise mathematical statement, and inhabiting it requires exhibiting both the data and the evidence.

And now the sentence that this entire book stands on can be said properly. In the system this book describes, there is a proposition `Adequate c r`: reading `r` is adequate to contract `c` (paper §3, §5). It is a dependent proposition. It mentions `c` and `r`, particular values: the contract distilled from the commentary on one particular verse, and one particular candidate reading of that verse. Not "some translation somewhere is fine," but a claim about *this* rendering of Vākyapadīya 1.1, judged against *this* commitment extracted from its commentary. Dependent types are what let a theorem be about the thing in front of you.

::: pandit
Readers of the śāstric tradition may feel a flicker of recognition here, and it is not an accident. The Navya-Nyāya logicians built a discipline of stating cognitions with total precision: what qualifies what (viśeṣya and viśeṣaṇa, the qualified and its qualifier), delimited by which property (avacchedaka, the delimitor), related through which relation. A delimitor pinning down *in what respect* a property qualifies its bearer does work strikingly like a type index pinning down *at which value* a dependent type sits. Chapter 8 takes this seriously and in detail, following Ingalls (1951) and Matilal (1968), and shows that three of the kernel's design choices are borrowed from that tradition (paper §2.3, §5.2). For now, only the flicker: the idea that rigor lives in the disciplined typing of statements is not a European monopoly, and India's sharpest logicians arrived at their version of it centuries before type theory had a name.
:::

## Proofs that run

One more idea completes the toolkit, and it is the engine of everything this book does with Lean.

Some propositions can be settled by pure computation. "Is 91 prime?" needs no ingenuity: run the divisibility checks, get the answer. "Does this exact string occur in that exact text?" Likewise. Call a proposition **decidable** when there exists a procedure, an ordinary program, guaranteed to terminate with a correct yes or no. Not all propositions are like this. Chapter 5's honest paragraph on Gödel stands: mathematics as a whole outruns every such procedure, and no algorithm decides all truths. But *designed fragments* of mathematics can be fully decidable, and you can often choose to work inside one.

In a proof assistant, decidability becomes a proof method, and here the Curry-Howard correspondence pays its most concrete dividend. Lean has a tactic, a proof-building command, called `decide`. Faced with a decidable proposition, `decide` runs the decision procedure. If the procedure answers yes, that successful computation *is* the proof, packaged as a term the kernel then checks like any other. The smallest example fits on one line:

```lean
theorem tiny : 2 + 2 = 4 := by decide
```

No cleverness, no case analysis by hand. The claim is decidable, the machine computes, and the run itself is the certificate.

Programmers should pause on how this differs from a test, because the two look identical from a distance and are not. A test runs your program on an input and eyeballs the output; it tells you about that run, and its authority ends there. `decide` rests on more: the decision procedure does not merely answer yes, it comes with a machine-checked proof, written once, that *any* yes it ever produces entails the proposition in question. The link between "the computation succeeded" and "the statement is true" is itself a theorem inside the system. A test is testimony about one execution. A proof by `decide` is a verdict, underwritten by a checked guarantee about the procedure that produced it.

This is precisely the engine of this book's kernel. The adequacy proposition `Adequate c r` was *engineered* to be decidable: contracts are finite lists of claims, readings are finite lists of claims, entailment between them is a bounded search, and the whole question reduces to a computation that always terminates (paper §5.1; `lean/VakyaVallari/`). So every verse-level theorem in the edition, all 144 adequacy theorems and all 361 refutations of rejected readings, closes with the same two words: `by decide`. The paper compresses this into a sentence worth carrying forward: the proof term is the computation. When Chapter 10 shows you the theorem stating that the accepted reading of verse 1.1 is adequate to its commentary contract, the proof will be a run of a checker, and the Lean kernel's blessing of that run will be the certificate.

Nothing here is hostage to a machine's judgment or a model's confidence. Decidability means the question was honed until it became the kind of question a computation can settle, and Curry-Howard means the settling computation counts, formally and checkably, as a proof.

::: engineer
Honesty requires a wider shot. Propositions-as-types did not stop in the 1970s. Homotopy type theory (HoTT) reread the correspondence again: types as spaces, proofs of equality as *paths* between points, with the univalence principle making equivalent structures interchangeable. Cubical type theory then gave that vision a computational engine, so its exotic proofs run rather than float. This is a live frontier, and it has already touched this book's subject matter: Panday and Ghosh (2026) encode core Navya-Nyāya constructs, relational nesting, delimitors, and typed absence, in cubical type theory (paper §2.3). The kernel described in this book deliberately does not follow them there. It is written in plain Lean 4, no univalence, no cubical machinery, because its needs are narrower and its constraints harder: adequacy must be decidable, every theorem must close by `decide`, and the toolchain must be mainstream enough that a skeptical philologist can rerun the build. Where the cubical work formalizes the *logic* of Navya-Nyāya for its own sake, this system borrows Navya-Nyāya's structural insights to verify *translations of a text*, and plain dependent types suffice for that job. A scoping decision, not a verdict on the frontier.
:::

## Why Lean

If propositions are types in general, why this prover in particular? The book's kernel is written in Lean 4, and the choice was made on three grounds worth stating, because each one matters to whether *you* can check this edition rather than take it on faith.

First, Lean 4 is a theorem prover and a full programming language in one system, described by its designers, Leonardo de Moura and Sebastian Ullrich (de Moura and Ullrich 2021); Lean is even largely implemented in itself. For this project that unity is not a slogan but a load-bearing wall. Contracts are data. The adequacy checker is a program. The theorems are propositions about that program's verdicts on that data. In Lean, all three live in one language under one checker, and no glue code sits in the cracks where errors breed.

Second, the small fast kernel. Lean keeps the trusted core minimal, in the tradition Chapter 5 described, and independent checkers can re-verify its output, so trusting a Lean proof does not mean trusting the whole sprawling toolchain. And because Lean evaluates efficiently, proofs by `decide`, which are computations, stay cheap. This book's build discharges 566 theorems machine-checked from scratch on every run (paper §5.4). A kernel that made computation expensive would have made the whole regression-testing posture, recheck everything on every edit, impractical.

Third, the culture. Lean is where a large community of working mathematicians builds mathlib, a shared library of formalized mathematics grown to enormous size through an unusual social discipline: every contribution is a proof, every proof is checked by the kernel, and humans review for style and architecture while the machine reviews for truth. That culture matters here beyond tooling, because it proves the social model this book borrows: large collaborations of fallible contributors can build a trustworthy corpus if, and only if, a mechanical gate stands between proposal and acceptance.

There is a fourth reason, hinted at in Chapter 5 and central from Chapter 11 onward. We now live in the era of **autoformalization**: Wu and colleagues showed that large language models can draft formal statements from informal text (Wu et al. 2022; paper §2.4). Such drafts are fluent and unreliable, which is exactly the profile of an untrusted contributor. The generate-and-check paradigm answers it: let the model propose, let the kernel dispose. That is only a real paradigm if the checker is strict, mechanical, and cheap to run at scale. Propositions-as-types supplies the strictness. Decidability supplies the cheapness. Lean supplies the working system.

So the stack is assembled. A proposition about a verse can be a type. A verdict on a translation can be a program inhabiting that type. Checking the philology, at least the part inside the formal boundary, can be running a type checker. What remains is to feel it in the hands. In the next chapter you will build, in one sitting, a working miniature of this book's actual kernel: the six sorts, entities, claims, contracts, and a decidable adequacy check, each piece a few lines of Lean, and every ingredient of the real system will pass through your fingers on the way.

## The stakes, in the present tense

Everything in this chapter was worked out decades before the current wave of artificial intelligence. It matters now more than it ever has, and the reason can be said in one sentence. Language models produce plausible text, not verified truth.

That is not an insult; it is a job description. A large language model is trained to continue text convincingly. Fluency is what it optimizes, and fluency is exactly the property that persuasion shares with fabrication. When such a model states a theorem, cites a source, or renders a verse, nothing in its architecture distinguishes the true output from the confident invention. The trade calls these inventions hallucinations. The word is apt: the model is not lying, because it has no relation to truth to betray.

The structural answer to this problem is already on the table, and it is this chapter's machinery. Do not ask the model to be right. Ask it to propose, and put a checker it cannot charm between its proposal and your acceptance. The model proposes; the type-checker disposes. A kernel that verifies a proof term does not care how fluent the term's author was. It cares whether the term has the type it claims, and that question has a mechanical answer.

This is no longer a speculative design. In July 2024, Google DeepMind announced that its AlphaProof system, working with a geometry specialist, reached silver-medal standard on the problems of that year's International Mathematical Olympiad, solving four of the six (Google DeepMind 2024). The system wrote its proofs in Lean. Every step of every solution was machine-checked by the same kind of kernel this chapter has been describing. The language model's role was to search and to propose; the checker's role was to refuse everything unsound, at scale, without fatigue. The team described the approach in full in a Nature paper on olympiad-level formal mathematical reasoning with reinforcement learning (AlphaProof team 2025). The headline was the medal. The architecture was the news.

The bridge between informal language and formal statement has a name too. Autoformalization, translating informal claims into formal ones so that a checker can judge them, was named as a paradigm by Wu and colleagues (Wu et al. 2022) and has since grown into a recognized research field, large enough that a survey was needed to map it ("Autoformalization in the Era of Large Language Models" 2025). Chapter 11 takes up this book's own use of the paradigm in detail.

Notice what the pattern requires and what it does not. It does not require mathematics. It requires only a domain where claims can be contracted: stated precisely enough that a small, auditable checker can pass verdict on them. Mathematics is one such domain. This book's wager is that the reading of a commented text is another. The propose-and-verify loop that filters olympiad proofs is, structurally, the loop that will filter translations of Bhartṛhari. Same shape, different world.

## The thread so far

A type is a contract a machine can enforce, and Curry-Howard reveals that logic and typed programming are one subject: propositions are types, proofs are programs, and checking a proof is type-checking. Dependent types let a proposition mention particular things, this verse, this contract, this reading, and decidability lets a designed proposition be settled by a computation whose successful run is itself the proof. That is the entire formal engine of this book, and Lean 4 is where it runs: small kernel, fast evaluation, a community that already trusts machine-checked truth at scale. Next, we build the miniature with our own hands.

*Doors: B, this chapter is your foundation stated plainly: the correspondence, dependent types, decidability, and the case for plain Lean 4. A, the tests-versus-proofs distinction and the `decide` engine are the exact mechanism the anti-fabrication gates of Part III run on. C and D, the ladder from "a date is not a distance" to "a claim about this verse" is the whole idea; both boxes are skippable and Chapter 8 returns for the Sanskrit side of it.*
