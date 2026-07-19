# 11 · Machines That Draft, Gates That Judge

Chapter 9 ended on a question it refused to answer: who wrote the contracts, and why should anyone trust them? Chapter 10 then showed you one contract carrying the full weight of the edition, every axiom cited, every rival refuted, every theorem compiled. It is time to answer the question, and the answer will strike some readers as a scandal.

The contracts were drafted by large language models. Not one model, carefully supervised, but a swarm of agents running in parallel, up to thirty at a time, each writing formal commitments about a fifth-century Sanskrit philosopher it has never read in any meaningful sense of the word "read."

A reasonable skeptic now says the obvious thing. You spent nine chapters establishing that translation is an untrusted operation. You built an entire apparatus on the premise that no translator, human or mechanical, should be taken at their word. And then you handed the writing of the semantic reference itself, the standard everything else is judged against, to the one class of author with a documented, measured, notorious talent for inventing plausible support for whatever it happens to be saying. You let a language model write your formal commitments?

Yes. And this chapter is the argument for why that was not recklessness but design, with the receipts to show the design being tested by real failure and holding. The short form of the argument fits in one sentence: nothing in this edition rests on a model's goodwill, because the architecture, not the model, carries the epistemic load. The long form is the story of how the contracts were actually made, told with the numbers from the project's own append-only ledger, including the four episodes where things went wrong and the gates caught them (paper §7; research/ledger.jsonl).

## The loop

Here is how a verse becomes a verified contract (paper §7.1).

One agent is assigned one verse. It receives four things. First, the verse record: mūla, commentary, translation, contested notes, everything Chapter 2's corpus carries for that unit. Second, the contract schema: the five-part format you read in full in Chapter 9. Third, an exemplar: a finished, accepted contract from an earlier verse, so the agent sees what done looks like. Fourth, and this is the part that matters, the validator itself, as its exit gate. The agent does not submit a draft for consideration. It runs the same mechanical checks the pipeline runs, sees its own failures, and iterates until its draft passes or its retry budget runs out. The gate is not downstream of the author. The gate is in the room.

Agents ran in rounds, sized to the remaining queue: nine agents in the first swarm, then twenty-five, then thirty, then twenty, then thirty, then a final twenty-nine (research/ledger.jsonl). Within a round the agents are independent. They do not talk to each other, and that independence is deliberate: it buys throughput, and it costs consistency, a cost the architecture pays for openly with a gate we will come to shortly.

After each round, an adjudication pass. Drafts that cleared the validator go through the Lean generator; lake build must succeed with zero sorry, which you now know means every adequacy theorem and every refutation actually proved, no promissory notes. Then the corpus-wide consistency gate compares the round's new contracts against every accepted contract, hunting for the drift that independence invites: the same term carrying different sorts in different verses. Conflicts go to an adjudicator, and each ruling lands as either a correction to a contract or a registered entry in the homonym registry, the file Chapter 12 is about. Drafts that fail a gate go to a repair agent with a bounded number of retries; a draft that cannot be repaired is rejected, and the verse goes back in the queue for a fresh author.

And everything, every single event, is appended to a ledger that nothing is ever deleted from. At the moment the accompanying paper froze its numbers, the ledger held 96 events: 29 drafts, 40 acceptances, 9 gate runs, 6 validations, 3 rejections, 3 repairs, 5 milestones, and 1 publication (paper §7.1). It has grown since, because the project kept happening, and the ledger's whole point is that it keeps up. We will return to it, because the ledger turned out to matter in a way that was not anticipated when it was designed.

Notice what the loop never asks. It never asks whether the model understood Bhartṛhari. It never asks whether the agent was having a good day. It never asks the model to certify its own output, which would be asking the untrusted translator to grade its own translation. Every question the loop asks is mechanical: does the draft match the schema, do the cites match the corpus, do the theorems compile, do the sorts agree. Agents propose. Gates dispose.

![The agent swarm loop with its three gates, which caught three lazy counterexamples, five fabricated citations, and ninety five sort conflicts.](book/assets/figures/fig12-agent-gates.png "Diagram of the drafting loop: a verse queue feeds a drafting agent, whose output passes through validator, lean, and consistency gates into the ledger, with dashed failure arrows dropping to a repair agent that sends redrafts back, and a note tallying three lazy counterexamples, five fabricated citations, and ninety five adjudicated sort conflicts.")

::: engineer
The gate stack, precisely, in firing order (paper §3.2, §7.1; scripts/ and tests/ in the repo). The validator checks: schema conformance; every entity, axiom, and denial carries a cite that occurs verbatim in the commentary, every accepted-reading claim a cite verbatim in the translation; the accepted reading's claims are entailed and none denied, computed by the same decision procedure the kernel runs; every rejected reading provably fails in its registered mode, with the expect field matching mechanical reality; axioms and denials are disjoint; at least two rejected readings; ASCII identifiers only. Then the Lean gate: generate the verse module, lake build, grep for zero sorry. Then the consistency gate: one sort per named entity corpus-wide unless the exact (verse, sort) partition is registered as polysemy with a per-sense gloss and justification. The Python validator mirrors the kernel's decision procedure so that validator acceptance predicts theoremhood, and the expensive build almost never fails. Almost. The exceptions are the subject of this chapter, and they are why the mirror never replaced the kernel.
:::

## What the gates caught

A safety architecture that has never been hit tells you nothing. This one was hit four ways, and the episodes are the evidence that the design works, because in every case the failure was caught mechanically, before anything wrong entered the edition. The paper's Table 2 tallies them; the table below mirrors it (paper §7.2). The paper's version carries one further line, two diacritic name splits caught by the same consistency gate, which this chapter folds into the sort-drift story where it belongs.

| Failure class | Count | Caught by |
|---|---|---|
| Lazy counterexamples | 3 | Lean kernel, then the hardened validator |
| Fabricated or paraphrased citations | 5 | verbatim-citation gate |
| Non-ASCII Lean identifiers | 2 contracts | Lean parser, then the validator |
| Cross-contract sort drift | 95 conflicts | consistency gate |

Four classes, four stories.

### The counterexamples that would not fight

The first failure appeared in the first real swarm, and it is the most instructive, because it is not a hallucination. It is something subtler: minimum-effort compliance.

The schema demands rejected readings, rival translations registered in advance with the failure mode each must exhibit. Writing a good rejected reading is genuinely hard. You must imagine a plausible mistranslation, decompose it into claims, and make sure those claims actually fail against the axioms, either by contradiction or by lack of license. Three early drafts, on verses 1.5 and 1.6 among others, took a shortcut that a tired human graduate student might also take: they wrote "rejected" readings whose claims were quietly entailed by the axioms. Restatements wearing a rival's costume. Counterexamples with no fight in them.

The Python-side checks of that era passed them. The Lean build did not. The generator dutifully produced, for each lazy rival, an inadequacy theorem asserting that the reading fails, and the kernel refused to prove it, because it was false: the reading did not fail, it was licensed all along. lake build broke, loudly, on a falsehood the cheaper checks had missed. The ledger entry is terse and permanent: "validator hardened mid-flight: rejected readings must provably fail; Lean caught lazy counterexamples in 1.5/1.6 first" (research/ledger.jsonl).

Two things happened next, and their order matters. The three contracts were repaired, with real rivals that really fail. And the validator was hardened so the whole class of failure is now caught at the cheap gate: every rejected reading must provably fail, in the registered mode, before the prover is ever invoked. The kernel caught the bug; the validator learned it. That is the intended metabolism of the system. Gates are not static. They ratchet, and every ratchet is an incident that can never recur.

### The night twenty agents died

The second episode is the one this chapter was written for. If you remember one story from this book about machine-assisted scholarship, make it this one (paper §7.2).

Midway through the fourth round, thirty agents were drafting contracts in parallel when the API provider's session limit cut the run. Twenty of the thirty agents were killed where they stood. Ten had finished cleanly. Nine others had produced draft contracts that no exit gate had reviewed: the agents died before running their own validation. Nine unreviewed drafts from a swarm dying of quota starvation, which is the precise scenario a skeptic of machine authorship should have nightmares about, because degraded generation is when language models are at their worst, and unreviewed is when it would slip through.

The pipeline did what it was built to do. The nine drafts were quarantined into a holding directory, outside the edition, untouched by the build. Then the gates were run over the quarantine. Five of the nine failed the verbatim-citation gate. Under degradation, the agents had done the characteristic thing: cited commentary sentences that read plausibly and do not exist, or paraphrased real ones just enough to feel authentic. Against a human reviewer, paraphrase is camouflage. Against exact string match, paraphrase is failure, indistinguishable from invention. The gate matched each cite against the corpus, found no substring, and refused all five.

The five were rejected and their verses re-authored by fresh agents in the next round. The quarantine directory was emptied and removed, an event the ledger records like everything else: "round 4 partial: session limit killed 20/30 agents; 10 completed; 9 unreviewed drafts quarantined to data/contracts_pending (5 failed verbatim-cite gate)" (research/ledger.jsonl).

Sit with what did not happen. No fabricated citation entered the edition, not for a day, not for a minute. Nobody had to notice anything. No vigilant human caught a suspicious quote; no reviewer's philological ear twitched. The catch required no judgment, no expertise, no luck, and no trust, because the architecture had assumed, from the beginning, that exactly this would eventually happen. Chapter 9 said the verbatim-citation rule converts the deepest risk of machine authorship into substring search. This was the night the conversion was tested at scale, under the ugliest conditions available, and the fabrications survived contact with the gate for zero seconds. The design was not vindicated by the swarm behaving well. It was vindicated by the swarm behaving badly and it not mattering.

::: vrtti
Why does string matching have teeth here? Because the commentary itself is specific enough to be unforgeable at the sentence level. The vṛtti tradition, as this edition's commentary transmits it, rules in declaratives: vivarta is appearance without loss of unity; the ultimate is not merely describable by language but is language; Bhartṛhari does not say Brahman becomes the world. Sentences with that much commitment in them are hard to counterfeit by vibe. A degraded model produces something that sounds commentarial, generic reverence about the eternal Word, and generic reverence matches nothing, because the actual corpus was never generic. The gate works because the vṛtti was never vague enough to imitate.
:::

### Two parsers, one name

The third episode is small, undramatic, and carries a lesson out of all proportion to its size (paper §7.2).

Contract entity identifiers are strings, and Sanskrit terms romanize with IAST diacritics: śabda, sphoṭa, akṣara. Python's isidentifier() method is generous with Unicode; identifiers containing diacritics passed every Python-side check without complaint. Lean's parser is stricter. When the generator emitted modules for verses 1.29 and 1.35, the Lean parser rejected the diacritic-bearing identifiers cold, and the build failed on two contracts that the entire cheap gate stack had blessed.

The fix was mechanical: rename the identifiers to ASCII, add an ASCII-only rule to the validator, move on. The ledger holds the one-line record: "Lean parser rejected IAST entity ids (1.29, 1.35); validator now enforces ASCII ids; mechanical rename applied" (research/ledger.jsonl).

The lesson is about mirrors. The Python validator exists to predict the kernel, so that expensive builds rarely fail. It is a very good mirror, and this episode is why it will never be promoted to the real thing. Two independently written programs will always disagree somewhere on what a well-formed name is, what whitespace means, what Unicode is. Every such disagreement is a crack a wrong artifact could slip through if the mirror had the final word. The end-to-end gate, the actual kernel actually compiling the actual artifact, is the only gate whose opinion cannot drift from reality, because it is reality. Keep the fast mirror for economy. Keep the slow kernel for truth. This edition runs both on every build, and after verses 1.29 and 1.35, nobody on the project has been tempted to argue.

### Ninety-five arguments about what a word is

The fourth class is the largest by an order of magnitude, and it is different in kind: not a model failing, but independence doing exactly what independence does (paper §7.2).

Thirty agents drafting thirty verses do not coordinate their ontology. One agent, deep in verse 1.9, meets akṣara as the imperishable Absolute and sorts it accordingly. Another, working the phonology verses, meets akṣara as phoneme and sorts it as a linguistic item. Each is right about its verse. Together they have created a corpus in which one name carries two sorts, and the consistency gate exists to refuse exactly that until a human-auditable ruling says which it is: an error to correct, or a genuine polysemy to register with a gloss and a justification per sense.

Across six adjudication rounds the gate surfaced 95 sort conflicts, some terms recurring as new verses entered the corpus. The arc is recorded round by round in the ledger: a first pass caught 2, then 11, then 10, then 5 in the post-quarantine cleanup, then 14, then 25 as the biggest round landed, then a final 28 as the last twenty-nine verses arrived and the whole Brahmakāṇḍa was on the table at once (research/ledger.jsonl). Every one of the 95 was resolved by an explicit ruling, and the residue of those rulings is the homonym registry: 41 terms, 91 senses, each with its textual justification. The same gate also caught the pettiest possible version of the problem, twice: the same term spelled with and without its diacritic, sphoṭa and sphota, splitting one entity into two. Normalization fixed it; the gate is why anyone noticed.

Some rulings were corrections, plain drift. Many were doctrine. The akṣara split is the opening verse's pun, load-bearing since Chapter 1. The sphoṭa split quarantines the phoneticians' rival terminology in 1.102 to 1.106 so a reported view cannot contaminate Bhartṛhari's own. A late round registered polysemy for veda, śruti, vyavasthā, rūpa, sādhu, viparīta, and kārya. The gate cannot tell drift from doctrine, and its inability is the productive part: it forces every case in front of an adjudicator and makes every verdict a documented, diffable editorial ruling. That story deserves its own chapter, and it has one. Chapter 12 is entirely about it.

::: pandit
Adjudication is where the machinery hands the pen back to the śāstric tradition. A sort conflict is precisely the situation the commentators call an apparent virodha, a contradiction to be resolved by distinguishing senses, and the registry entry is the digital form of the classical move: not this sense here, but that one, for this stated reason, in these verses exactly. What is new is not the move but its bookkeeping. A ṭīkā's sense-distinction persuades its readers and then lives diffusely in the tradition's memory. A registry entry is committed, versioned, cited, and enforced: every future contract that touches the term is checked against the ruling on every build. The paramparā kept its rulings by recitation and debate. This edition keeps them in a file that the gates will not let anyone quietly forget.
:::

## The ledger, replayed

The append-only ledger began as good hygiene, the same discipline any lab notebook enforces: write down what happened, never erase. Draft, validate, reject, repair, accept, gate, milestone, each with a timestamp and a one-line detail, each appended, none ever rewritten. Every acceptance in the edition can be traced backward through the exact sequence of events that produced it: which round drafted the verse, which gates it passed, whether it was repaired and why. The history is not a story anyone tells about the project. It is a record the project cannot help leaving, and anyone can replay it (research/ledger.jsonl).

Then the ledger earned its keep in a way worth telling on itself, because this book has promised you honesty about its own workings.

After the corpus was complete, the project ran an adversarial review: hostile agents with fresh contexts, briefed to break the edition and the paper by any means available, fabrication sweeps and kernel attacks and claim-by-claim audits (paper §10). One reviewer, checking the paper's every number against the repository, flagged the gate-catch table itself: the sort-conflict count then printed, 89, had no committed artifact behind it. It was a tally someone had carried in prose, and prose is exactly where numbers rot. The fix was to do what the ledger makes possible: replay the adjudication gates, reconstruct the per-round record, and commit it. The true total surfaced across the rounds was 95. The paper was corrected, 89 to 95, with provenance pointing at the reconstruction, and the number this chapter has been using is the audited one (research/journal.md).

A skeptic could read that episode as an embarrassment. Read it again. A number in the human-written layer drifted; the machine-written layer held the truth; the review process forced the two back into agreement, in public, with the correction itself recorded. That is the whole epistemology of this project in miniature. The claim is not that nothing goes wrong. Things went wrong in every layer, model and human alike. The claim is that the system is arranged so that wrongness is caught by mechanism, corrected in the open, and archived where it cannot be quietly unsaid. An edition that can show you its own errata trail is more trustworthy than one that has none to show, not less.

## Lineage: the same discipline, different gates

This way of working was not invented for Sanskrit. The loop is the third deployment of a discipline developed across two companion programmes, and seeing all three together shows which parts are general (paper §2.5).

Active Circuit Discovery (Sathish, Ahsan, and Latifi 2026) turns mechanistic interpretability of neural networks into a budgeted experimental-design problem: an active-inference agent proposes which causal experiment to run next, and statistical criteria, fixed in advance, decide what counts as a discovered circuit. Prabodha (Sathish 2026b) runs a pre-registered, gate-audited research loop in which every claim must pass both a code gate and a domain gate before acceptance, with an append-only evidence ledger and adversarial review built into the protocol. Different fields, same skeleton: agents propose, mechanical gates dispose, an append-only ledger records every draft, rejection, repair, and acceptance, and the gates are registered before the work, not improvised after it.

What varies is the checker, and the variation is instructive. In the companion programmes the gates are statistical: an effect size, a significance threshold, a held-out replication. Statistical gates are honest but soft at the edges; a wrong acceptance is an improbable event, not an impossible one. Here the gate is a type-checker. A wrong acceptance, a contract whose accepted reading is not actually entailed, whose rival does not actually fail, is not improbable. It is a compile error. The kernel would have to prove a falsehood, and a sound kernel cannot. Acceptance is a theorem rather than a threshold, which is the strongest form the propose-and-gate discipline can take, available only because Chapter 6 bought decidability and Chapter 9 spent it here.

## The pattern, portable

Step back from Sanskrit, from Lean, from this project, and the shape that remains is a recipe for using language models in scholarship without staking anything on their honesty. It has four ingredients.

First, make the model produce an artifact, not an answer. Prose is unfalsifiable at scale; an artifact with structure, a contract, a proof, a dataset with a schema, can be checked by something other than a reader's patience.

Second, put a mechanical gate between the artifact and the record, and make the gate independent of the model: a type-checker, a string matcher, a schema validator, a test suite, anything whose verdict does not flow from the same statistical machinery that produced the draft. Give the author access to the gate, so drafts improve before review rather than after. Harden the gate every time something gets past a cheap check, and keep one end-to-end gate that compiles reality rather than a mirror of it.

Third, record everything in a ledger nothing is deleted from, because provenance is what turns "trust me" into "check me," and because the day a number drifts, the ledger is what settles it.

Fourth, route what the gates cannot decide, and only that, to explicit adjudication, and commit the rulings where the gates can enforce them forever after.

Do this, and the question that haunts every discussion of machine-assisted scholarship simply stops being operative. "Did the model hallucinate?" Probably; on the night the quota ran out, demonstrably. It is the wrong question, the way "did the compiler have a bug?" was the wrong question in Chapter 9. The right question, the only one the edition's integrity ever rested on, is: did the artifact pass the gate? That question has a mechanical answer, recomputed on every build, for every contract, forever. The swarm was never trusted. It was never asked to be trustworthy. It was asked to produce artifacts that could survive gates designed on the assumption that it would sometimes fail, and when it failed, on schedule, in four different ways, the edition never noticed, because the gates were the edition's immune system and they were never off.

That is the answer to the skeptic. Yes, a language model wrote the formal commitments. And between what the model wrote and what this book asserts stand a verbatim string match, a hardened validator, a proof kernel that cannot be argued with, a corpus-wide consistency check, and a ledger that remembers everything. The model's goodwill was never load-bearing. Nothing was, except architecture.

## The thread so far

The contracts were authored by an agent swarm, one agent per verse, in rounds of nine to thirty, with the validator as each agent's exit gate, adjudication between rounds, and an append-only ledger recording every event. The gates caught real failures of four kinds, three lazy counterexamples, five fabricated citations from a quota-degraded round, two identifier incidents, and ninety-five sort conflicts, and in each case the catch was mechanical, the fix was recorded, and the gate was hardened. The discipline descends from the companion programmes' propose, gate, and ledger pattern, upgraded here because the gate is a type-checker, so wrong acceptance is a compile error rather than an improbability. The general lesson for machine-assisted scholarship: design so the operative question is never whether the model hallucinated but whether the artifact passed the gate. Next, the one gate that cannot decide alone: telling drift from doctrine, one word at a time.

*Doors: engineers, this chapter is your playbook: gates in the author's loop, quarantine on degradation, end-to-end checks over mirrors, append-only provenance, and a real postmortem for each. Proof people, note where the kernel outran every cheap check, twice, and why acceptance-as-theorem beats acceptance-as-threshold. Commentary scholars, the provenance ethics are for you: every machine-drafted commitment is cited, gated, ledgered, and correctable in public, which is more than most human apparatus discloses. Literature readers, you now know who wrote the files and why it is safe that they did. Vyākaraṇa students, the sort-conflict adjudications are sense-distinction rulings in the classical style, and Chapter 12 walks the registry.*
