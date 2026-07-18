# 25 · An Invitation

Most books end by closing. This one ends by opening, because the thing it describes is not finished and was never meant to be. The edition you have been reading about is alive. It has a public address, a public history, and a public set of rules for changing it. This short chapter tells you how to visit, how to argue with it, and what the argument is for.

## How to read a proof page

The edition lives at vakya-vallari.vercel.app. The repository, with every corpus record, contract, proof, and test, lives at github.com/SharathSPhD/vakya-vallari. Nothing on the site is hand-assembled. A build script reads the corpus, the contracts, and the Lean build status, and writes the pages. What you see is what the pipeline produced, receipt: `src/vallari/site.py`.

Open any verse and you will find the same anatomy. First the Devanagari mūla, the verse as the tradition wrote it. Below it, the IAST transliteration, so that every sound is recoverable without the script. Then the English translation in bold, and under that the full analytical commentary, the prose that carries the interpretive commitments. If the verse is one of the 286 the edition marks as contested, a bordered note says exactly what is disputed and why the verse alone cannot settle it.

Next to the verse number sits a badge, and the badge is the honest part. It has three values, and they are computed, not asserted. *Unformalized* means no contract exists yet. *Contracted* means a contract exists but no green proof yet. *Verified* means three things at once: a contract exists for this verse, a Lean module was generated from it, and the whole proof project compiled with zero `sorry`. The badge is a function of the build, nothing else. If the build broke tonight, the badges would change by morning. A fourth mark, *doxographic*, appears in dashed outline on verses where the commentary reports a rival view without endorsing it; those reported axioms are held in a separate compartment of the contract, licensed as faithful reporting rather than asserted as doctrine.

A verified verse links to its proof page, and the proof page is the heart of the whole apparatus. It lists the endorsed axioms of the contract, one by one, and under each axiom, in quotation marks, the verbatim sentence of the commentary it derives from. This is the anti-fabrication rule of Chapter 9 made visible: no axiom exists without a cite, and every cite is an exact string from the commentary, checkable by your own eyes. Then come the denials, the readings the commentary explicitly rules out, each with its cite. Then the rejected readings, each rendered as a real English sentence a real translator might have written, followed by the reason the compiled counterexample refutes it. And finally the Lean module itself, in full, the actual source that the type-checker accepted. Nothing is summarized. The page shows you the same objects the machine checked.

Reading a proof page takes about two minutes. Auditing one takes ten: read the commentary at the top, then read each cite and ask whether the axiom under it is really what that sentence says. That question is the honesty boundary of Chapter 23, and the page is designed so that anyone can ask it.

## How to file a challenge

Suppose you audit a page and disagree. Perhaps you think an axiom overreads its cite. Perhaps you think the translation smuggles in a word the commentary never licensed. In most scholarship, your disagreement would become a footnote, or a review, or a conference remark, and its fate would depend on who read it. Here it becomes a diff and a build result.

The procedure is concrete. Fork the repository. Find the contract for the verse, one JSON file per verse under `data/contracts/`. Change the thing you dispute. Then run the gates and watch what happens.

::: engineer
The full gate suite, exactly as CI runs it, from the repository root:

```sh
uv run pytest            # corpus + contract gates
cd lean && lake build    # proof gate (CI also enforces zero sorry)
```

The pytest layer checks corpus integrity, contract schema, sort consistency against the homonym registry, and the verbatim-citation rule: every `cite` string must occur exactly in the commentary it claims to quote. The Lean layer regenerates nothing by magic; it compiles the adequacy theorems and counterexamples as they stand. A challenge that survives both gates is a coherent alternative edition. A challenge that breaks one is a lesson in where the load was bearing. Receipt: `tests/`, `lean/`, README.
:::

Try the canonical experiment on verse 1.1 itself. Its contract asserts the relation `vivartate` from Brahman to world and, in its denials, explicitly rules out `parinamate`, real transformation, because the commentary says Bhartṛhari chose his verb against Sāṃkhya. Edit the contract so that the world is a pariṇāma after all. The build now objects in two places at once. The denial contradicts your new axiom, so the contract is incoherent and the adequacy theorem cannot compile. And your new axiom has no cite, because no sentence of the commentary licenses it, so the citation gate fails before Lean even runs. To make your reading pass, you would have to change the commentary too, and then your fork would be what it honestly is: a different edition, with a different interpretive standpoint, every difference visible in the diff.

Or try the gentler experiment. Change one phrase of the accepted translation of 1.1, say "imperishable" to "sacred syllable." The translation's claims are cited against the translation text, phrase by phrase. The claim that predicates akṣara of Brahman now cites a phrase that no longer exists, and the gate reports exactly which claim lost its footing. You have just watched an interpretation break the way a test breaks, with a line number.

This is the whole proposal of the book in miniature. A disagreement about a fifteen-hundred-year-old verse becomes a pull request. The maintainers cannot wave it away with authority, because the gates judge it the same way they judged the original. And if your challenge is right, if the axiom really did overread its cite, then merging your fix makes the edition better in a way that is recorded, attributed, and permanent in the ledger. The contracts were always meant to be attacked. That is what it means for them to be public.

## What remains open

The honest inventory is short to state and long to do.

The corpus already carries all three books of the Vākyapadīya, 1,796 kārikās in total. The proofs so far cover Book I, the Brahmakāṇḍa, 144 verses. Book II, the Vākyakāṇḍa, waits with 426 verses on sentence meaning, where Bhartṛhari argues that the sentence, not the word, is the true unit of language. Book III, the Padakāṇḍa, waits with 1,226 verses across fourteen chapters on universals, relation, time, and the machinery of meaning. Chapter 24 argued that these books will not merely take longer; they will demand more from the formalism, because sentence holism resists a kernel built from entity-shaped claims.

The kernel itself has honest limits, stated in Chapter 23. Its entailment is shallow: it checks membership and consistency, not inference chains. Its six sorts are coarse. Its contracts inherit a single commentarial standpoint, Iyer's text of the vṛtti tradition, where a mature edition would hold multi-commentary contracts, one per commentator, and let the disagreements between Vṛṣabhadeva and Helārāja become compiled objects too. And beyond all of that stands the research program of Chapter 24: a prover that speaks Sanskrit's own formal devices, kāraka as typed roles, sandhi as verified parsing, śābdabodha as elaboration, paribhāṣā as tactics, so that formalizing a Sanskrit text stops being translation into a foreign idiom and becomes transcription into a native one.

None of this is scheduled. All of it is specified, gated, and open to anyone. The repository's issue tracker is the natural place to begin, and a contract for a Book II verse that passes the gates would be the best possible first contribution.

## The paramparā, continued

Step back once more, all the way to Chapter 2. The paramparā carried this text for centuries on disciplined breath, with recitation schemes that were error-correcting codes before either word existed. When writing came, the ṭīkākāras, the commentators, layered explanation on explanation, each one citing the text, arguing with predecessors, and signing their rulings. That activity had a shape: a public claim about meaning, tied to a quoted source, offered to a community equipped to check it.

The edition continues that activity by other means. Every ruling is public. Every ruling cites its source verbatim. Every ruling is checkable, by eye at the citation boundary and by machine everywhere inside it. A reader who forks the repository and files a challenge is not doing something novel dressed in traditional clothes. They are doing the oldest thing in this tradition, disputing a reading with receipts, in a new kind of ink. The ink happens to be JSON and Lean. The activity is ṭīkā.

There is one real difference, and it is worth naming without sentimentality. A classical commentator's coherence was vouched for by learning and lineage, and errors could sleep in the tradition for centuries before anyone caught them. Here, the coherence half of the work is checked in minutes, every time, by a kernel that has no reputation to protect. What the machine cannot check, fidelity to Bhartṛhari, remains exactly where it always was: with readers. The machine's contribution is to make sure that when readers argue, they argue about the real question, with the bookkeeping already done.

## The vine

The name of this project, vākya-vallarī, means the vine of the sentence. A vine is a good image for a text like this one. It does not stand alone; it climbs on what came before. It grows at the tips, not the trunk. Cut it back and it returns. And no one who plants it sees all of it.

So end where everything began, with the verse that would not hold still.

::: {.deva}
अनादिनिधनं ब्रह्म शब्दतत्त्वं यदक्षरम् ।

विवर्ततेऽर्थभावेन प्रक्रिया जगतो यतः ॥ १ ॥
:::

::: {.iast}
anādinidhanaṃ brahma śabdatattvaṃ yadakṣaram |

vivartate'rthabhāvena prakriyā jagato yataḥ || 1 ||
:::

Brahman is without beginning or end, imperishable, and its essence is the Word. It appears in the mode of objects, and from it proceeds the unfolding of the world.

That translation is no longer just a sentence on a page. It is the accepted reading of a cited contract, proved adequate by a compiled theorem, with its rivals refuted beside it, and every step open to your inspection and your objection. It holds still now, exactly as still as the evidence holds it, and not one word stiller.

The verse says that the world unfolds from the Word the way a form unfolds from its root: prakriyā, a derivation, step by checkable step. This book has been one more step in that derivation. The next step is not the author's. Fork the vine. Check a ruling. Break a build, and tell us what you found. The paramparā was never a finished thing handed down. It was a living transmission, corrected in every generation by the people who received it. It is received. It is running. It is yours.

## The thread so far

One verse admitted three grammatical readings and three worldviews, and only the commentary could decide among them. Two traditions, the paramparā that carried sound without loss and the proof kernel that carries certainty without trust, turned out to be integrity technologies aimed at the same enemy, and the bridge between them is the contract: commentary as specification, translation as implementation, adequacy as a compiled theorem. A swarm of machine drafters worked under mechanical gates that caught fabrication and drift, and the result is an edition of the Brahmakāṇḍa whose every interpretive ruling is public, cited, and checkable, with its limits stated as plainly as its claims. What remains, Books II and III, richer logic, many commentaries, a prover that speaks Sanskrit, is not an appendix to the work but its continuation, and it is open to anyone with a fork and a reason. The vine grows at the tips.

*Doors: all. Every reader leaves through the same gate, and the gate is open.*
