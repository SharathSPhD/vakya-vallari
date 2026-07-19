# 1 · The Verse That Would Not Hold Still

Some time around the fifth century of the common era, in northern India, a grammarian named Bhartṛhari opened the most ambitious book ever written about language with thirty-two syllables. The book is the Vākyapadīya, the "Treatise on Sentence and Word." Its first book, the Brahmakāṇḍa, is the metaphysical core of the whole work, and its first verse is the thesis of everything that follows. In the tradition that carried it, the verse was not primarily a written thing. It was recited, breath by breath, in a meter that fits two lines of sixteen syllables each, shaped so that a trained memory could hold it without loss for a lifetime and hand it on intact.

Here it is, first in Devanagari, the script in which most readers of Sanskrit meet it today, and then in IAST, the standard roman transliteration, where every mark is exact and every sound is recoverable.

::: {.deva}
अनादिनिधनं ब्रह्म शब्दतत्त्वं यदक्षरम् ।

विवर्ततेऽर्थभावेन प्रक्रिया जगतो यतः ॥ १ ॥
:::

::: {.iast}
anādinidhanaṃ brahma śabdatattvaṃ yadakṣaram |

vivartate'rthabhāvena prakriyā jagato yataḥ || 1 ||
:::

Ten words, if we split the compounds. A first-year Sanskrit student can parse every one of them. The grammar is clean. The vocabulary is common. There is no textual corruption, no missing line, no disputed variant that matters. By every measure that a dictionary or a grammar book can apply, this verse is easy.

And yet it would not hold still. For fifteen centuries, readers have pulled three different worldviews out of these ten words, and each reading is grammatically impeccable. That is the problem this book is about. This chapter shows you the problem in miniature: one verse, three translations, and the single thing that can decide between them. Then it makes a promise that will sound strange until Chapter 10 makes it ordinary: a computer can be made to hold that decision, permanently, checkably, in public.

## Ten words

First, the words themselves. A gloss is not a translation. It is the raw material a translation is built from, and it is worth seeing how innocent the raw material looks.

| Word (IAST) | Gloss |
|---|---|
| anādi-nidhanam | without beginning (anādi) and without end (nidhana) |
| brahma | Brahman, the absolute, the ultimate reality |
| śabda-tattvam | whose essence (tattva) is the Word (śabda) |
| yat | which |
| akṣaram | imperishable; but also, in grammarians' usage, a syllable, a unit of speech sound |
| vivartate | appears as, presents itself as; a verb of manifestation |
| artha-bhāvena | in the mode (bhāva) of objects or meanings (artha) |
| prakriyā | unfolding, procedure; in grammar, a step-by-step derivation of a word form |
| jagataḥ | of the world |
| yataḥ | from which |

Read down the column and a sentence assembles itself: Brahman, without beginning or end, whose essence is the Word, imperishable, appears in the mode of objects; from it comes the unfolding of the world. So far, so smooth. But look again at three entries, because each one is a fork in the road.

The word śabdatattva is a compound, and Sanskrit compounds do not announce their internal grammar. "Word-essence" could mean the essence that words have, some deep structural property of language. Or it could mean the essence which is the Word, a claim about what reality itself is. Those are not two shades of one meaning. They are two different universes.

The word akṣara is doing double duty. Its plain sense is "imperishable," from a root meaning "to not decay," and that sense sits naturally beside "without beginning or end." But akṣara is also the everyday grammarians' term for a syllable, the minimal unit of uttered speech. A grammarian writing "akṣara" in the first line of a treatise on language knows exactly what he is doing.

And the verb vivartate is a choice. Sanskrit has another verb available, pariṇamate, "transforms." Milk pariṇamate into curds: the milk is gone, the curds are real, the substance has changed. Bhartṛhari did not use that verb. Whether his verb, vivartate, means something importantly different is the hinge on which whole schools of Indian philosophy later turned.

Keep those three forks in mind. Now watch what happens when translators come through.

## Three sentences, three worlds

Here are three English renderings of VP 1.1. All three are grammatical. All three are defensible from the dictionary. They cannot all be right.

The first is the rendering this edition accepts, the one printed in this book's corpus (data/corpus/vakyapadiya.jsonl):

> Brahman is without beginning or end, imperishable, and its essence is the Word. It appears in the mode of objects, and from it proceeds the unfolding of the world.

The second is a plausible mistranslation, registered in this verse's contract as a rejected reading (data/contracts/1.1.json):

> The imperishable linguistic structure underlying words has no beginning or end.

The third is another registered rejection:

> Brahman transforms itself into the world of objects.

Sit with the differences for a moment, because they are not small.

The first rendering says that ultimate reality exists, that it is eternal, and that its very essence is language. Not that it can be described in language. That it is, at bottom, the Word. This is a metaphysical thesis with a name in the tradition: śabdādvaita, the non-duality of the Word, the claim that the Word and the absolute are one thing.

The second rendering quietly deletes the metaphysics. It keeps every dictionary gloss, "imperishable," "without beginning or end," "word-essence," and reassembles them into a statement a modern linguist could sign without blinking: languages have a deep, stable structure. It sounds sober and scientific. It turns the boldest claim in Indian philosophy of language into a truism about grammar. And nothing in the syntax of the Sanskrit forbids it.

The third rendering keeps the metaphysics but swaps the physics. "Transforms itself" makes the world a real modification of Brahman's substance, the way milk really becomes curds. That is a coherent cosmology; it is roughly the position of the Sāṃkhya school, and the tradition has a name for it, pariṇāma, transformation. It is also, as we will see, exactly the position the verse's commentary rules out. The verse says vivartate, not pariṇamate, and for the tradition that difference is a doctrine.

So: one Sanskrit verse, three English sentences, three incompatible pictures of reality. A world that is language all the way down. A world in which language merely has tidy foundations. A world that is the transformed substance of an absolute. The differences here are as large as the difference between idealism and materialism, and every one of the three sentences parses.

If translation were just dictionary plus grammar, we would be stuck. Dictionary plus grammar generated all three.

## Why the dictionary cannot vote

It is worth being precise about why the usual tools fail here, because the failure is structural, not a matter of effort.

Start with śabdatattva. To choose between "the essence which is the Word" and "the essential structure of words," a translator has to decide what kind of thing śabdatattva is. Is it an absolute, the sort of thing that can be identical with Brahman? Or is it a property, the sort of thing that languages have? Call this the word's sort: the ontological category it belongs to. The dictionary lists senses; it does not assign sorts. The grammar licenses both compound analyses; it does not rank them. The sort decision is an interpretive commitment, and it has to come from somewhere outside the verse.

Then vivartate. The verb's surface meaning, "turns," "occurs," "appears," is compatible with both the appearance reading and the transformation reading. The distinction that matters, vivarta versus pariṇāma, appearance without change of substance versus real transformation, is a distinction the later tradition made technical. You cannot see it in the verb's conjugation. You can only see it in what the tradition says the verb is doing here.

Then akṣara. Should the translator render it "imperishable," or "syllable," or somehow both? A footnote can gesture at the pun. But a translation must commit, and the commitment changes what the verse is: either a hymn that happens to be about language, or an argument in which the eternal and the phonic are deliberately named by one word.

In every case the missing ingredient is the same. What fixes the reading is not the verse. It is the commentary.

Sanskrit intellectual culture ran on commentary the way modern software runs on documentation, except that the commentary was not optional and not an afterthought. A root text, often compressed to the edge of legibility, came wrapped in layers of explanation: the vṛtti, a close gloss that unpacks each verse; and further layers above it. For the Vākyapadīya's first book, the key witness is the Vṛtti, the ancient prose companion that survives with the verses, edited and translated by K. A. Subramania Iyer (1965). That edition is the primary text behind the translation and commentary in this book's corpus (paper §1). The tradition never pretended the verses spoke for themselves. The commentary is where the verses' meaning was fixed, defended, and transmitted.

One fact about this edition belongs on the table now, because it is the book's design and not a footnote. Subramania Iyer's (1965) edition of Book One with the Vṛtti is the primary reference text. From that Sanskrit, a machine-assisted process drafted the English translation and the analytical commentary in this book's corpus. Machines also drafted the formal contracts, and every machine output had to pass mechanical gates before it entered the corpus. Lean then verified the whole structure. A machine drafted it, a machine gated it, and this book will show exactly what that does and does not buy. The front matter, "A Few Notes," states the same provenance. Chapter 11 shows what the gates caught when machine output degraded, and Chapter 23 states what remains human judgment.

Here is what this edition's commentary, following that tradition, says about our three forks.

::: vrtti
On śabdatattva, the commentary states the thesis without hedging: the ultimate is not merely describable by language but is language. Word-essence names what reality is, not a feature that words possess. The identity runs in both directions, which is why the verse can put brahma and śabdatattvam in apposition and mean it.

On akṣara, the commentary is equally direct: "The pun is not decorative; it is the argument in miniature." Akṣara means imperishable, which is why it sits beside "without beginning or end." But akṣara is also the ordinary grammarians' word for a speech sound, and Bhartṛhari is a grammarian. "What is imperishable and what is phonic are, for him, the same thing." Even prakriyā, "unfolding," is loaded: in grammatical usage it names a derivation, the stepwise generation of a word form from its base. "The world issues from Brahman the way a word-form issues from its base." The vocabulary is doing philosophical work.
:::

And on vivartate, the commentary draws the line that kills the third rendering. Bhartṛhari does not say Brahman becomes the world, which would make the world a real transformation of its substance, as Sāṃkhya has it. "Vivarta is appearance without loss of unity: the one presents itself as many while remaining one." The one remains one. The many is how the one presents itself. Translation three, "Brahman transforms itself into the world," asserts precisely what the commentary denies.

Notice what the commentary has done. It has not added information the dictionary lacked in some vague, atmospheric way. It has made specific, checkable commitments. Śabdatattva is of the same sort as Brahman, and identical with it. The relation between Brahman and the world is vivarta, and it is not pariṇāma. Akṣara predicates imperishability of Brahman, and the phonic sense is intended alongside it. Each commitment either holds of a given translation or it does not. The commentary, in other words, behaves less like a mood and more like a specification.

::: pandit
One honesty note, because this edition tries to encode only what the text at this point supports. In later Advaita Vedānta, vivarta became a technical term for illusory appearance: the world as a rope mistaken for a snake. Whether Bhartṛhari's vivartate already carries that later sense, or only the weaker sense of manifestation, is genuinely disputed, and the first verse alone does not settle it. The corpus flags this as a contested reading, one of 56 such flags across the 144 verse units of Book I (paper §1). The formal contract for 1.1 deliberately encodes only the weaker commitment, manifestation without loss of unity, which both sides of that dispute share (data/contracts/1.1.json, notes field). Where the tradition is undecided, the machine is kept undecided too.
:::

So the commentary can decide what the dictionary cannot. But this only relocates the problem, it does not solve it. Commentaries are long. Translators are human. A translator can read the commentary on Tuesday and drift from it on Thursday, three hundred verses later, without noticing. A reviewer checking a translation against a commentary must hold thousands of commitments in mind at once, and no reviewer does. The commitments live in the philologist's head, and heads leak. For most of history there was no alternative. The interesting question of this book is whether there is one now.

## A verdict you can compile

Here is the promise, stated once in plain language and then left alone until Part III delivers it.

Every commitment the commentary makes about verse 1.1 can be written down as data: a small, readable file that names the entities in play (Brahman, śabdatattva, the world), assigns each one a sort, and lists the claims the commentary asserts and the claims it denies. Call this file the verse's contract. Every line of the contract must quote, verbatim, the commentary sentence that licenses it, so the contract cannot invent commitments the commentary never made. The accepted translation is then analyzed into its own claims, each quoting the translation verbatim. And a proof assistant, a program built to check mathematical proofs, is handed both and asked a precise question: is every claim this translation makes entailed by the commentary's commitments, and does it assert nothing the commentary denies?

For verse 1.1, the answer compiles. The accepted rendering, the first of our three sentences, is proved adequate: a theorem, checked by machine down to its logical atoms, certifies that all four of its claims follow from the contract and none is denied. The two rival renderings are not merely disapproved of; each is refuted by its own theorem. The "linguistic structure" reading fails because its version of śabdatattva has the wrong sort, a property where the commentary demands an absolute, so its central identity claim is unlicensed: no axiom of the contract entails it, and the machine can enumerate the possibilities and check. The "transforms itself" reading fails harder: it asserts the exact relation, pariṇāma, that the contract denies, and the checker flags the contradiction. One verse, three renderings, three verdicts: adequate, unlicensed, contradicted. No footnotes. Theorems (paper §3).

![One Sanskrit verse, three grammatical renderings, three compiled verdicts: adequate, unlicensed, and contradicted.](book/assets/figures/fig01-three-renderings.png "Diagram showing a box for Vakyapadiya 1.1 branching into three boxes with rival renderings, each flowing down to its verdict: adequate as a theorem, unlicensed as a sort error, or contradicted by a denied relation.")

::: engineer
For the readers who build systems: the trick is borrowed from compiler engineering. Compilers are untrusted translators too, and since the late 1990s one standard response has been translation validation (Pnueli, Siegel, and Singerman 1998): instead of trusting the translator, check each individual translation against a specification, mechanically, after the fact. This book's system does exactly that with the commentary as the specification. The contract is a JSON file; a generator turns it into code for the Lean proof assistant; the adequacy and refutation checks are decidable, meaning the prover settles them by exhaustive computation rather than by cleverness. The kernel that defines "adequate" and "refuted" is under 150 lines of Lean (lean/VakyaVallari/). Everything else is discipline about where the commitments come from.
:::

Two things this promise is not, so that no reader carries an inflated version of it forward. The machine does not read Sanskrit, and it does not certify that the contract itself is faithful to Bhartṛhari. That judgment stays with human readers, which is why every axiom carries its verbatim commentary citation: checking the contract against the commentary is a lookup, not an act of faith. The division of labor is deliberate. The prover keeps commitments; the philologist judges them (paper §3.4). What the machine adds is something the philologist's head could never provide: exhaustiveness, permanence, and a public record. Change one word of the translation of verse 1.1, and a build fails, and the failure names the claim that broke.

This has been done, not proposed. All 144 verse units of the Brahmakāṇḍa carry compiled adequacy theorems, and 361 plausible mistranslations across the book are compiled counterexamples, each refuted by a theorem in its registered failure mode (paper §1). The first complete book of the Vākyapadīya now exists as a machine-verified translation. The method is the new thing: holding a translation to its commentary by machine-checked proof has, to the author's knowledge, not been done before, for a Sanskrit classic or for any text. And the point is not that a machine translated; machines translate every day. The point is that the correctness question was made objective, for the first time, with the commentary as the standard.

## The shape of the book

Getting from ten Sanskrit words to a compiled verdict requires two traditions that have never seriously met, and this book walks through both before it joins them. The map has five parts, and you should feel free to walk it out of order.

**Part I, The Word,** stays in India. Chapter 2 explains how a civilization ran a complete intellectual culture on memorized sound, and why oral bandwidth forced texts into extreme compression, which in turn made commentary not a luxury but the decompression layer the whole system depended on. Chapter 3 opens Pāṇini's grammar, a formal generative system some twenty-five centuries old, and teaches you to read one of its rules mechanically; if you have ever written a program, you will feel a shock of recognition. Chapter 4 follows grammar as it turns into metaphysics, ending at Bhartṛhari's door: what must language be, for grammar to work at all?

**Part II, The Proof,** crosses to the other tradition. Chapter 5 asks what a proof really is, and follows the search for carriers of certainty that do not decay: memory, text, logic, machine. Chapter 6 explains the idea at the heart of modern proof assistants, that propositions are types and proofs are programs, gently and without prerequisites. Chapter 7 is a working session: in one sitting, you build a miniature of this book's entire kernel in the Lean proof assistant. Chapter 8 springs the trap this book has been setting: India already had a discipline of formal precision, Navya-Nyāya, whose technical machinery maps onto modern type theory with almost embarrassing directness, and the kernel's design choices come from it.

**Part III, The Bridge,** joins the halves. Chapter 9 develops commentary-as-specification in full. Chapter 10 is the heart of the book: the complete pipeline for verse 1.1, in slow motion, from commentary sentence to compiled theorem, every step shown. Chapter 11 tells the true story of how the 144 contracts were drafted, by a swarm of language-model agents whose every output was gated by mechanical checks, and what the gates caught, including outright fabrication. Chapter 12 is about the words that refused to keep one meaning, and how a consistency checker forced editorial honesty about polysemy.

**Part IV, The Vine,** is the text itself. The word vākyapadīya suggests, to this project's ear, a climbing vine of sentences and words, and this part walks all 144 verse units of the Brahmakāṇḍa, section by section, each verse with its Devanagari, transliteration, translation, gist, and one-line verdicts, with one featured verse per chapter given the full treatment. It is the payoff: a classic you can read straight through, knowing that every translation on the page is backed by a theorem.

**Part V, Horizons,** is the honest ending. Chapter 23 states exactly what the theorems do not prove, without piety. Chapter 24 sketches the research program: a prover that speaks Sanskrit's own formal devices natively. Chapter 25 is an invitation, because the edition is alive: the contracts are public, and a reader who disagrees with a ruling can change a file and watch the build object.

Five kinds of reader come to a book like this, and each has a door. If you are an engineer, your door is the architecture: an untrusted-translator problem solved with gates, specifications, and regression, on fifteen-hundred-year-old input. If you live in proofs and type theory, your door is the kernel and the strange pleasure of Chapter 8, where Gangeśa's heirs anticipate your discipline. If you are here for the literature and philosophy, your door is the vine: read Parts I and IV and skip every formal chapter without loss of the story. If you are a student of vyākaraṇa, the Sanskrit grammatical tradition, your door is Pāṇini read as a machine and kāraka read as typed roles. And if you are a scholar of commentary, your door is the sharpest one: an edition whose every interpretive ruling is explicit, cited, diffable, and open to attack. Boxes marked engineer, pandit, and vṛtti will appear throughout, offering depth for one door without blocking the corridor for the others. Skip any box freely. The front matter lays out a suggested reading path for each of these audiences, chapter by chapter.

One verse has already shown you the whole problem. It would not hold still: three grammatical readings, three worldviews, and only the commentary to decide. The rest of the book is the story of teaching a machine to honor that decision, and of discovering, along the way, that the two traditions involved, the paramparā that carried sound without loss and the proof kernel that carries certainty without trust, were solving the same problem all along.

## The thread so far

VP 1.1 admits three grammatical translations that commit to three incompatible worldviews, and neither dictionary nor grammar can choose among them. The commentary can, because it makes specific commitments: śabdatattva is the absolute itself, the world-relation is vivarta and not pariṇāma, and the akṣara pun is intended. Those commitments can be written as a cited contract and checked by a proof assistant, which certifies one rendering adequate and refutes the other two by theorem. The book now goes back to the beginning of each tradition, the Word and the Proof, to earn that machine honestly.

*Doors: engineers meet the untrusted-translator problem in its oldest form; proof people see a new domain for decidable checking; literature readers get the verse, the pun, and the stakes; vyākaraṇa students see why the grammarians' vocabulary carries the argument; commentary scholars see their discipline treated as the specification it always was.*
