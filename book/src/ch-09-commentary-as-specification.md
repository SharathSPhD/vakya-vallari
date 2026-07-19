# 9 · Commentary as Specification

Every program you have ever run was translated by a machine you have never audited. You write code in a language made for humans. A compiler rewrites it into a language made for processors, and along the way it does not merely transcribe. It transforms. A modern optimizing compiler will delete your variables, reorder your statements, unroll your loops, inline your functions, and replace whole computations with cheaper ones it judges equivalent. The program that runs bears about as much resemblance to the program you wrote as a demolished-and-rebuilt house bears to its blueprint. And you trust it. Everyone trusts it. The entire software world stands on the assumption that this aggressive, inventive, meaning-preserving rewrite really does preserve meaning.

Mostly it does. Sometimes it does not. Compilers are large programs written by humans, and they have bugs, and a compiler bug is a uniquely nasty thing: your source code is correct, your reasoning is correct, and the machine still does the wrong thing, because the translator lied. When researchers built tools to hammer production compilers with randomly generated programs, they found wrong-code bugs in every conventional compiler they tested. The translator you trust every day is, in the strict sense, untrusted.

By the 1990s this had become intolerable in one particular corner of the field: safety-critical systems, where a miscompiled instruction can mean a crashed aircraft rather than a garbled screen. Two responses emerged, and the difference between them is the hinge of this chapter.

The first response is heroic: verify the compiler itself. Prove, once and mathematically, that every translation the compiler will ever perform preserves the meaning of every program it will ever be given. This has actually been done. Xavier Leroy's CompCert, which Chapter 5 mentioned, is a compiler for the C language whose translation passes carry machine-checked proofs of semantic preservation (Leroy 2009), and when the random-testing researchers aimed their tools at it, they reported finding no wrong-code bugs in its verified core. CompCert is one of the landmark achievements of formal methods. It also took years of expert labor, and the price of the guarantee is frozen scope: the proof covers this compiler, these passes, this source language. Change the compiler and you must repair the proof. Verifying a translator, it turns out, is one of the hardest things formal methods has ever attempted (paper §2.4).

The second response is the interesting one for us, because it is cheap, general, and sly. In 1998 Amir Pnueli and his colleagues, facing exactly this problem for a compiler they had no hope of verifying whole, proposed a different bargain. Do not verify the translator. Verify each translation. Let the compiler remain a black box, as untrusted as it likes. But every time it runs, take what went in and what came out, and check, mechanically, after the fact, that the output means the same thing as the input, by comparing both against a semantic reference. If the check passes, this run was correct, and you do not care whether the compiler was. If the check fails, you have caught a real bug at the moment it mattered. They called the idea translation validation (Pnueli, Siegel, and Singerman 1998; paper §2.4).

Notice what the move does to the shape of the problem. The heroic approach buys a universal guarantee at a brutal price. Pnueli's approach buys a per-run guarantee at a modest price, and per-run is all you ever actually need, because you only ever run the compiler a finite number of times on programs you care about. The trust burden migrates. It leaves the enormous, clever, changing translator and settles on a small, dumb, stable checker. If the checker is simple enough to audit, the whole system is trustworthy even though its biggest component is not. Chapter 5 called this the de Bruijn criterion: let the clever machinery be as large as it likes, provided everything it produces passes a small independent check. Translation validation is the de Bruijn criterion applied to translators.

Hold that pattern still for a moment, because you have seen this book's problem inside it already. A translator of Sanskrit is an untrusted translator. Not because translators are careless or dishonest, but for the same structural reason the compiler is untrusted: the transformation is aggressive, the opportunities for silent meaning-change are everywhere, and no one can certify the translator as a whole. What would it even mean to verify a philologist? But verifying a philologist was never necessary. Pnueli showed that you can leave the translator alone and check the translations, one by one, against a semantic reference, with a small dumb tool that never tires. All we need is the transplant.

## The transplant

Here is the pattern moved organ by organ from the compiler world into ours (paper §3).

| Compiler world | This book |
|---|---|
| Source program | The Sanskrit verse |
| Optimizing compiler (untrusted) | The translator (human, machine, or both) |
| Target program | The English rendering |
| Semantic reference | The commentary, compiled into a per-verse contract |
| Validator | The Lean kernel, running a decidable check |
| Per-run verdict | An adequacy theorem, or a refutation in a registered failure mode |

Most of the rows transfer without friction. One row does not, and the exception is where this book earns its subtitle.

In compiler-world translation validation, the semantic reference is derived from the source program itself. A program in C has a formal semantics: the language standard fixes, with lawyerly precision, what every construct means, so the source is its own specification, and the validator's job is to show the output faithful to it. Try to transplant that row directly and the operation fails on the table. A Sanskrit verse is not its own specification. That was the entire lesson of Chapter 1: the ten words of VP 1.1 admit three grammatical readings that commit to three incompatible worldviews, and nothing in the syntax or the dictionary decides among them. The source under-determines the reading. Validate a translation against the bare Sanskrit and every one of the three renderings passes, because every one of them is a legitimate parse of the string. A reference that licenses everything checks nothing.

But Chapter 1 also found the thing that does decide, and it was not a formal semantics from a standards committee. It was the commentary. The vṛtti tradition exists precisely because the tradition itself knew the verses under-determine their readings; the commentary is where the reading is fixed, defended, and transmitted. And when we looked closely at what the commentary on 1.1 actually does, it behaved less like a mood and more like a specification: śabdatattva is of the same sort as Brahman and identical with it; the world-relation is vivarta and is not pariṇāma; the akṣara pun is intended. Specific. Checkable. Denials included.

So the transplant succeeds with one substitution, and the substitution has a name: commentary-driven translation validation, C-TV (paper §3). The semantic reference is not the source text. It is the commentary, compiled into a formal object. The translator remains untrusted. The commentary, as interpreted into that object, is the standard the translation must meet. The validator is a proof kernel. And the verdict, run by run, verse by verse, is a theorem.

![The commentary driven translation validation loop, from Iyer's edition to compiled theorems, with three mechanical gates and a repair path.](book/assets/figures/fig10-ctv-pipeline.png "Diagram of a pipeline running from Iyer's 1965 edition through machine translation and commentary to a semantic contract with verbatim citations, then to a Lean module and theorems, with validator, lake build, and consistency gates drawn as diamonds below and a dashed repair arrow looping failures back.")

Name the ambition at its real size, because "machine translation, checked" undersells it. C-TV is objective verification brought into subjective linguistics. A field where adequacy has always been adjudicated by taste, authority, and reviewer stamina acquires one layer, the layer of stated commitments, where adequacy is adjudicated by computation. The subjective judgments do not disappear. They move into the reference, where they are written down and signed. What was never available before is the other half: given the reference, the verdict is nobody's opinion.

One consequence of the substitution should be said out loud, because it is a feature wearing the costume of a limitation. In compiler-land the semantic reference is given by the language standard; nobody chooses it. Here the reference is itself an interpretive artifact. Someone must read the commentary and decide which of its sentences become formal commitments. That decision is human, fallible, and contestable, and no theorem will ever launder it into certainty. What the architecture does instead is force the decision into the open, in a file, with every commitment tied to the sentence that licenses it, where anyone can audit the tie. We will return to this at the end of the chapter, and again in Chapter 23, because it is the honest boundary of everything this book claims.

::: engineer
Two engineering deltas from classical translation validation are worth registering. First, the reference is hand-compiled per verse rather than derived from a standard, so the reference itself needs an integrity story; that story is the verbatim-citation gate described below, plus a schema validator that checks, per contract, sort membership, citation presence, disjointness of axioms and denials, and provable failure of every rejected reading in its registered mode. Second, the Python-side validator runs the same decision procedure the Lean kernel uses, so validator acceptance predicts kernel theoremhood; the expensive prover never sees a contract that will embarrass it. Receipts: paper §3, §4; scripts/ and lean/VakyaVallari/ in the repo.
:::

## What a contract contains

The compiled reference is called a semantic contract: one JSON file per verse, small enough to read over coffee, holding everything the machine will ever know about what the commentary commits to (paper §3.1). One fact about the contracts belongs on the table before their anatomy: the commentary they cite is this edition's own commentary, machine-drafted from the Sanskrit with Iyer's 1965 study as its primary scholarly reference, by the process Chapter 11 recounts. So the chain the theorems certify runs between two artifacts of this edition: its translation on one side, its commentary on the other. The links running outward from that pair, from this commentary back to Iyer and through the tradition to Bhartṛhari, are exactly the human-auditable part, and the citation gate below is built to keep them auditable. A contract has five parts.

**Entities** are the things the verse talks about, each declared with a sort: its ontological category, drawn from a fixed menu of six that you met when Chapter 7 built the toy kernel. Absolute, for ultimate reality. Power, for capacities like time and means-of-manifestation. Manifestation, for what appears. LinguisticItem, for words, sentences, and sounds. Property, for features things have. Cognition, for mental events. Sorts are the coarse type system of the whole edition, and they carry real weight: Chapter 1 showed that the fatal move of the "linguistic structure" mistranslation is exactly a sort error, treating as a property what the commentary treats as the absolute.

**Axioms** are the claims the commentary asserts, in three kinds. Identity: two named entities are the same thing. Relation: a named relation holds from one entity to another. Predication: a named predicate holds of an entity. Three kinds sounds spare, and it is; the spareness is a design decision, defended in Chapter 23, to encode only what a shallow, decidable checker can honestly adjudicate.

**Denials** are claims the commentary explicitly rules out. They are first-class citizens, not an afterthought, because commentaries spend much of their energy saying what a verse does not mean. A specification that cannot say "not this" cannot capture a vṛtti.

**The accepted reading** is the translation printed in this edition, analyzed into claims of the same three kinds. This is the load the theorem will bear: the assertion that this rendering, decomposed into its commitments, is exactly covered by what the commentary licenses.

**The rejected readings** are plausible mistranslations, each rendered as its own little claim set, and each registered in advance with the failure mode it must exhibit. There are exactly two modes, and they are worth internalizing, because every one of the 361 refutations in this book is one or the other (paper §3.1, §4). A reading is **contradicted** when it asserts something the contract denies: it walked into a wall the commentary built on purpose. A reading is **unlicensed** when it asserts something no axiom entails: no wall was hit, but no floor was there either; the reading claims more than the commentary ever granted. Contradicted is the sin of saying the forbidden thing. Unlicensed is the sin of saying an unearned thing. Both are decidable, which means the kernel settles them by running a terminating computation, not by cleverness.

And the definition that ties it together: a reading is **adequate** for a contract when every claim it makes is entailed by the contract's axioms and no claim it makes is denied (paper §3.1). That single sentence is what every adequacy theorem in this book literally proves.

Across the whole Brahmakāṇḍa the contracts hold 776 entity declarations, 624 axioms, 181 denials, 450 accepted-reading claims, and 361 rejected readings, with every contract carrying at least two rejections (paper §4). But statistics are not understanding. You have seen the verse (Chapter 1) and you have built the types (Chapters 6 and 7). It is time you read a real contract.

## The contract of 1.1, in full

What follows is the actual file, data/contracts/1.1.json, complete and unabridged. It is the formal spine of everything Chapter 1 did in prose.

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
  "axioms": [
    {
      "kind": "identity",
      "a": "sabdatattva",
      "b": "brahman",
      "cite": "the ultimate is not merely describable by language but is language — sabda-tattva, word-essence"
    },
    {
      "kind": "relation",
      "name": "vivartate",
      "from": "brahman",
      "to": "jagat",
      "cite": "Vivarta is appearance without loss of unity: the one presents itself as many while remaining one"
    },
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
  "denials": [
    {
      "kind": "relation",
      "name": "parinamate",
      "from": "brahman",
      "to": "jagat",
      "cite": "Bhartrhari does not say Brahman becomes the world (parinamate), which would make the world a real transformation of its substance"
    }
  ],
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
  "notes": "Contested: whether vivarta already carries the later Advaitic sense of illusory appearance is disputed; the contract deliberately encodes only the weaker commitment (manifestation) shared by both readings."
}
```

Walk through it slowly. This is the whole architecture in one file.

The **entities** block declares the verse's cast of three. Brahman and śabdatattva both carry the sort absolute, and that shared sort is itself an interpretive ruling: it is what makes their identity even a candidate for truth, since the kernel, following the Navya-Nyāya design of Chapter 8, holds cross-sort identities decidably false. Jagat, the world, is sorted as manifestation, not as a second absolute and not as a substance, which quietly encodes the vivarta metaphysics before a single axiom is stated. Notice that each entity already carries a cite: even the decision to admit a term into the ontology answers to a sentence of the commentary.

The **axioms** block is the commentary's positive doctrine, compressed to four commitments. One identity: śabdatattva is brahman, the śabdādvaita thesis itself, resting on the commentary's flattest possible sentence about it. One relation: vivartate holds from brahman to jagat, citing the sentence that defines vivarta as appearance without loss of unity. Two predications: anādinidhana, without beginning or end, and akṣara, imperishable, both said of brahman, the second citing the sentence in which the commentary declares the pun intended: what is imperishable and what is phonic are the same thing. Four axioms for thirty-two syllables. Everything else the commentary says about this verse is context, argument, and connective tissue; these four are the commitments sharp enough to check.

The **denials** block has one entry, and Chapter 1 taught you why it is here. The commentary does not merely fail to assert pariṇāma; it goes out of its way to reject it, naming the rival verb and the rival cosmology. The contract records that rejection as a first-class formal object, with the rejecting sentence attached. A wall, built on purpose, cited.

The **accepted_reading** block decomposes the translation this edition prints into four claims, and here the cites switch sources. Look at them: "its essence is the Word," "without beginning or end," "imperishable," "It appears in the mode of objects." These are not commentary sentences. They are fragments of the translation itself, the very rendering you read in Chapter 1, quoted verbatim. Each claim attributed to the translation must point at the words of the translation that make it. The contract is not allowed to say the translation claims something unless it can show you where.

The **rejected_readings** block registers the two rivals from Chapter 1, each with its rendering in full, a prose why, its own claim set, and, crucially, an expect field naming the failure mode in advance. The linguistic-structure reading declares its own private entity, sabdatattva_naive, sorted as property, and then asserts its identity with brahman; the expectation is unlicensed, because no axiom entails an identity across sorts, and the kernel proves an auxiliary theorem recording the sort error (paper §3.3). The transformation reading needs no new entities at all; it simply asserts the pariṇāma relation, which is the denied claim, and its expectation is contradicted. Registering the mode is a pre-commitment, in the spirit of a pre-registered experiment: the contract does not just predict that the rivals fail, it predicts exactly how, and a rival that failed in the wrong way would itself be a build error.

And the **notes** field carries the honesty. Whether vivarta already bears its later Advaitic sense of illusory appearance is a genuine scholarly dispute, and the first verse does not settle it. So the contract encodes only the weaker commitment both sides share. Where the tradition is undecided, the file is undecided, and it says so in writing.

::: pandit
The notes field is where the contract meets the limits of its own confidence, and it is worth seeing that this is a traditional posture, not a modern imposition. The commentarial tradition itself distinguishes the settled from the contested: a bhāṣya will report rival views (pūrvapakṣa) before establishing its own conclusion (siddhānta), and later ṭīkās argue about what the bhāṣya settled. Fifty-six of the 144 verse units in this corpus carry contested notes, and nine doxographic verses use a separate reported stance so that views the text merely surveys are never absorbed as doctrine (paper §5.3). A specification language for commentary that could not say "disputed" would falsify the tradition it formalizes.
:::

One file, then. Three entities, four axioms, one denial, four accepted claims, two registered refutations, one confession of contested ground. Generated into Lean and compiled, it becomes three theorems: the accepted reading is adequate, the linguistic-structure reading is unlicensed, the transformation reading is contradicted. Chapter 10 will watch that generation happen line by line. What remains for this chapter is the question you should already be asking: who wrote this file, and why should anyone trust them?

## The gate that checks the checker's homework

Because here is the uncomfortable truth about the architecture so far. The contract has replaced the translation as the object of trust. If the contract is right, the theorems mean something. If the contract is wrong, the theorems are an elaborate way of being wrong with confidence. And contracts, in this project, were drafted by the least trustworthy author imaginable: a swarm of large language models, machines with a documented talent for inventing plausible support for whatever they happen to assert. Chapter 11 tells that story in full, including the day the safeguards caught fabrication in the act. This chapter only needs the safeguard itself.

The rule is the one you have already seen operating in the file: **every axiom, every denial, and every entity must carry a cite, and the cite must occur verbatim in the commentary; every accepted-reading claim must carry a cite that occurs verbatim in the translation** (paper §3.2). Not a paraphrase. Not a summary. Not "cf. the discussion of vivarta." A literal substring of the source document, checked by exact string match, mechanically, before any proof is attempted. A contract whose citation fails the match is rejected at the door. The prover never sees it.

Think about what this does to the failure landscape. The characteristic hallucination of a language model is the invented citation: support that sounds right, reads smoothly, and does not exist. Against a human reviewer, such an invention can survive for years, because checking it means going to the shelf. Against a string matcher, it survives zero seconds. The gate converts the deepest risk of machine-authored scholarship, fabricated support, into the most trivial problem in computing, substring search. The model may still be wrong, but it cannot be wrong invisibly: every commitment in every contract wears, on its sleeve, the exact sentence it claims as license, and the claim of verbatim presence is machine-checked at every build. This is why the fabrication episode of Chapter 11 ends undramatically. An agent, degraded mid-run, invented five commentary citations. The gate matched them against the corpus, found nothing, and refused the batch. The fabrications were never in the edition; the design assumed them in advance (paper §7).

Now the honest half of the accounting, because the gate is narrow and its narrowness must be stated. String matching proves that the cited sentence exists. It does not prove that the sentence means what the axiom says it means. A drafter, mechanical or human, could cherry-pick: quote a real sentence out of context, ignore the qualification two lines later, or attach a genuine quotation to a formal claim it does not actually support. The gate cannot see any of that, because seeing it requires understanding, and the entire architecture is built on components that check without understanding. What the gate guarantees is different and humbler: the link between every formal commitment and its textual warrant is explicit, permanent, and public. To audit an axiom, a human reader does not reconstruct a chain of reasoning; she reads one sentence of commentary next to one line of JSON and judges whether the one licenses the other. A lookup, not an archaeology. The gate does not make the contracts right. It makes them checkable at a glance, forever, by anyone, and it makes every disagreement about them a disagreement about something specific.

::: vrtti
The gate also quietly enforces a discipline on the commentary side: only what the commentary actually says can enter the formal layer. On 1.1 the commitments survive the squeeze because the vṛtti tradition, as this edition's commentary transmits it, speaks in checkable declaratives: the ultimate is not merely describable by language but is language; vivarta is appearance without loss of unity, the one presents itself as many while remaining one; Bhartṛhari does not say Brahman becomes the world. Sentences like these are why the transplant works at all. A commentary that only gestured could not be a specification. This one rules.
:::

## The boundary, stated once

Every chapter of this book that touches verification owes you one plain paragraph about what has and has not been proved. Here is this chapter's, without hedging and without piety.

What Lean certifies is the internal coherence of the formalization: that the accepted reading's claims are entailed by the contract and none is denied, and that each registered rival fails in its registered mode. Whether the contract is faithful to Bhartṛhari, whether these four axioms are what the Vṛtti means, whether the sorts carve the ontology where the tradition would carve it: none of that is a theorem, and none of it can be one, because fidelity to a fifth-century philosopher is not a decidable predicate (paper §3.4). What the architecture provides instead is that the fidelity question is auditable by construction. Every commitment points at its sentence; checking the pointer is a lookup; the files are public and diffable; and a reader who judges an axiom unfaithful can change it and watch the build report exactly which theorems her judgment costs. The prover keeps commitments. The philologist judges them. Neither can do the other's job, and the system is built so that neither has to.

## From anatomy to motion

You now hold the complete conceptual kit. An untrusted translator, left untrusted, exactly as Pnueli taught. A semantic reference that had to be the commentary, because the source under-determines its own reading. A contract format that compiles the reference into entities, axioms, denials, an accepted reading, and pre-registered rivals. Two failure modes, contradicted and unlicensed, both decidable. A citation gate that turns fabrication into a string-matching problem and keeps the human audit a lookup. And a boundary: coherence by theorem, fidelity by audit.

What you have not yet seen is the machine in motion: commentary sentences becoming axioms one by one, the JSON becoming a Lean module, the module becoming theorems, and a single edited word making the build fail and name what broke. That is Chapter 10, and it is the heart of the book. The anatomy lesson is over. Next, the living specimen.

## The thread so far

Compiler engineering met the untrusted-translator problem decades ago and Pnueli's translation validation solved it without verifying the translator: check each run against a semantic reference with a small dumb validator. Transplanted to Sanskrit, the reference cannot be the bare verse, which under-determines its reading; it must be the commentary, compiled into a per-verse contract of sorted entities, cited axioms, denials, an accepted reading, and pre-registered rejected readings that must fail as contradicted or unlicensed. The verbatim-citation gate turns fabricated support into a failed string match, and the boundary is clean: Lean proves the formalization coherent, while fidelity to Bhartṛhari stays a human judgment made auditable by construction. Next chapter, the whole pipeline runs on verse 1.1 in slow motion.

*Doors: engineers, this is your chapter's spine: translation validation transplanted, with the gate doing the anti-fabrication work your pipelines wish they had. Proof people, note where decidability is earned: two failure modes, shallow entailment, everything by computation. Commentary scholars, the contract is your discipline rendered as data, denials and contested notes included, and the boundary paragraph is addressed to you. Literature readers, you just read your first contract, and the verse from Chapter 1 is now a file you could edit. Vyākaraṇa students, watch the sorts: the edition's ontology is doing kāraka-like work, and Chapter 24 takes that seriously.*
