# 3 · Pāṇini's Machine

## Four thousand rules you can sing

Somewhere around the fourth century BCE, in the northwest of the Indian subcontinent, a grammarian named Pāṇini finished a description of Sanskrit so complete that no one has ever needed to replace it. The work is called the *Aṣṭādhyāyī*, "the eight chapters." It contains roughly four thousand rules. The traditional count of the received text is 3,959.

Hold those two facts together and a paradox appears. Four thousand rules sounds enormous. It is not. Printed without commentary, the entire *Aṣṭādhyāyī* fits in a slim booklet. A trained reciter can chant the whole thing in a matter of hours, and for most of its history that is exactly how it lived: not as a book but as a memorized object, carried in the heads of grammarians, recited, indexed, and searched by people who had internalized every rule and its position. The previous chapter described the oral technology that made such feats routine. Pāṇini's grammar is that technology's masterpiece: a complete generative description of one of the most morphologically rich languages on earth, compressed until it could ride in a single human memory.

The word for each rule is *sūtra*, literally "thread": a rule composed as an aphorism so compressed that it often omits its own subject, its own verb, and most of its own conditions. The omissions are not sloppiness. They are the compression scheme. Every dropped word is recoverable, by fixed convention, from the rules around it. The *Aṣṭādhyāyī* is not a list of four thousand independent statements. It is a single engineered artifact in which position, ordering, and shared context carry as much information as the words themselves.

That is why this chapter exists. The book you are reading is about holding translations of a Sanskrit philosophical text to account with a proof assistant, and the philosophical text in question, Bhartṛhari's *Vākyapadīya*, is a book about grammar. You cannot feel the force of what Bhartṛhari did to grammar until you have seen what grammar was in his tradition. It was not a schoolroom subject. It was the most rigorous formal system his civilization possessed, and one of the most rigorous any civilization possessed before the twentieth century. Modern computational linguists study the *Aṣṭādhyāyī* not as a curiosity but as a working machine: a rule system with typed definitions, scoped contexts, an addressing scheme for sound classes, deterministic rewriting, and an explicit policy for resolving conflicts between rules (paper §2.2).

The goal of this chapter is modest and concrete. By the end of it you should be able to take one real sūtra, read it mechanically, and watch it fire. Everything else, the six semantic roles, the sound-change algebra, the exception logic, is in service of that one skill.

## Fourteen strings

Every formal system has to solve a bookkeeping problem before it can say anything interesting: how do you refer to the objects you are manipulating? A grammar of Sanskrit constantly needs to say things like "all vowels," "all voiced consonants," "the sounds *i*, *u*, *ṛ*, *ḷ* as a group." Writing out the lists every time would bloat the grammar beyond memorization. Pāṇini's solution is the first thing a student of the *Aṣṭādhyāyī* learns, and it is worth slowing down for, because it is the cleanest small example of how the whole machine thinks.

The grammar opens with fourteen short strings of sounds, known as the Śivasūtras. Tradition says they came from the drum of the god Śiva as he danced; the legend is a measure of how perfect later grammarians found them. Here they are in full:

::: {.deva}
अ इ उ ण् । ऋ ऌ क् । ए ओ ङ् । ऐ औ च् । ह य व र ट् । ल ण् । ञ म ङ ण न म् । झ भ ञ् । घ ढ ध ष् । ज ब ग ड द श् । ख फ छ ठ थ च ट त व् । क प य् । श ष स र् । ह ल् ।
:::

::: {.iast}
*a i u Ṇ | ṛ ḷ K | e o Ṅ | ai au C | ha ya va ra Ṭ | la Ṇ | ña ma ṅa ṇa na M | jha bha Ñ | gha ḍha dha Ṣ | ja ba ga ḍa da Ś | kha pha cha ṭha tha ca ṭa ta V | ka pa Y | śa ṣa sa R | ha L |*
:::

Each string is a run of actual Sanskrit sounds followed by one final consonant, printed here in capitals. That final consonant is not a sound of the list. It is a marker, called an *it* or *anubandha*, literally "what goes along": a tag attached for the grammar's internal use and deleted before anything is pronounced. The fourteen strings lay out just over forty sounds of Sanskrit in a fixed order, with fourteen markers planted at chosen positions like milestones along a road.

Now the payoff. To name a class of sounds, Pāṇini gives a two-character code: one real sound plus one marker. The code means "every sound in the sequence, starting from this sound and running up to this marker." Such a code is called a *pratyāhāra*, "a drawing together."

Two examples do most of the work in this book.

First: *aC*. Start at *a*, the first sound of the first string. Run forward until you hit the marker *C*, which closes the fourth string. Along the way you collect *a, i, u, ṛ, ḷ, e, o, ai, au*. Skip the intervening markers; they are milestones, not sounds. What you have collected is exactly the vowels of Sanskrit. So the two letters *aC* mean "any vowel." One syllable, spoken in a fraction of a second, addresses a nine-member class.

Second: *haL*. Start at *ha*, the first sound of the fifth string. Run forward to the marker *L*, which closes the fourteenth and final string. You collect every remaining sound in the list: the semivowels, the nasals, all the stops, the sibilants. The two letters *haL* mean "any consonant."

The scheme generalizes. *iK* runs from *i* to the marker *K*: the vowels *i, u, ṛ, ḷ*. *eṄ* is *e* and *o*. *yaṆ* runs from *ya* to the second marker *Ṇ*: the semivowels *y, v, r, l*. *jaŚ* collects *j, b, g, ḍ, d*, the unaspirated voiced stops. The grammar uses a few dozen of these codes, and each one exists because some rule somewhere needs precisely that class. The ordering of the fourteen strings is not alphabetical and not phonetic tradition. It is engineered so that the classes the grammar needs come out as contiguous runs. Modern scholars, Paul Kiparsky prominent among them, have analyzed the arrangement and argued that it is essentially forced: given the classes Pāṇini's rules require, hardly any shorter or better ordering exists (Kiparsky 2009).

::: engineer
A pratyāhāra is a range query over an ordered enumeration. Model the Śivasūtras as a single array of sounds with fourteen sentinel values interleaved at fixed indices. A pratyāhāra *xM* denotes the slice from the index of *x* up to the sentinel *M*, with sentinels filtered out. Every sound class the grammar needs becomes a contiguous slice, so naming a class costs two symbols regardless of its size, and membership testing is two comparisons. It is the same trick as character ranges in a regular expression, or an enum ordered so that each needed subset is an interval. The design constraint, one linear order serving dozens of overlapping subset queries, is what makes the artifact remarkable, and it is why the ordering looks strange until you see the queries. Receipt: paper §2.2.
:::

::: pandit
Two details show how deliberately the strings were built. The marker *ṇ* appears twice, closing the first string and the sixth, so a code like *aṆ* is formally ambiguous: it could mean *a, i, u* or the much longer run down to the sixth string. The tradition resolves each occurrence case by case, and the discussions of when the short reading applies and when the long one does are among the oldest recorded arguments about operator scope. Second, the sound *ha* is listed twice, in the fifth string and alone in the fourteenth. The duplication is load-bearing: it lets *ha* fall inside consonant classes counted from both ends of the list. Nothing in the fourteen strings is decorative.
:::

Keep *aC*, *iK*, and *yaṆ* in mind. They are about to appear inside a real rule, and the rule will be seven syllables long because they exist.

## Four kinds of rule

Not all sūtras do the same kind of work. The tradition sorts them into types, and the sorting is exactly the sorting a modern language designer would make. Four types matter for us.

A *saṃjñā* sūtra is a definition. It introduces a technical term and fixes what it denotes. The very first rule of the *Aṣṭādhyāyī* is one:

::: {.deva}
वृद्धिरादैच्
:::

::: {.iast}
*vṛddhir ādaic* (1.1.1)
:::

Read it with your new skill. *āT* is a pratyāhāra-style code for the vowel *ā* (the *T* is a marker); *aiC* is the pratyāhāra running from *ai* to the marker *C*, which collects *ai* and *au*. So the rule says: the term *vṛddhi* names the vowels *ā, ai, au*. Three sounds get a label, and from now on any rule that says *vṛddhi* means exactly those three. It is a type declaration, nothing more and nothing less. The word *vṛddhi* in ordinary Sanskrit means "growth, prosperity," and the commentators note with satisfaction that Pāṇini arranged for his grammar to open on an auspicious word. Even the pun is load-bearing: it tells you the author controlled his text down to the first syllable. The next rule, *ad eṅ guṇaḥ*, does the same job for the term *guṇa*, naming the vowels *a, e, o*. Definitions first, machinery after.

A *paribhāṣā* is a metarule: a rule about how to read other rules. Paribhāṣās are the interpretation conventions of the system. One fixes what a genitive case ending means inside a sūtra: *ṣaṣṭhī sthāneyogā*, "a genitive denotes the thing to be replaced." Another fixes the locative: a locative in a rule means "when the following element is such." A third, *sthāne 'ntaratamaḥ*, says that when a rule offers several possible substitutes, you must choose the one most similar to what it replaces, similar in place of articulation, in length, in manner. None of these rules changes any word of Sanskrit. They configure the machine that does. We will watch all three fire shortly.

A *vidhi* is an operation: the rules that actually rewrite forms. Here is the most famous one in the grammar, and the one this book will lean on repeatedly:

::: {.deva}
इको यणचि
:::

::: {.iast}
*iko yaṇ aci* (6.1.77)
:::

Seven syllables. Unpack them. *ikaḥ* is the pratyāhāra *iK* (*i, u, ṛ, ḷ*) in the genitive case; by the paribhāṣā above, the genitive marks the thing replaced. *yaṆ* (*y, v, r, l*) stands in the nominative: it is the substitute. *aci* is *aC*, all vowels, in the locative: the following context. Assembled: "In place of *i, u, ṛ, ḷ*, there is *y, v, r, l*, when a vowel follows." This is the rule that turns *dadhi* + *atra* into *dadhyatra*, "the curd is here." It is a rewrite rule with a left-hand side, a right-hand side, and a context condition, stated in seven syllables because the sound classes have two-letter names and the case endings encode the rule's syntax.

An *adhikāra* is a heading: a sūtra that states no operation itself but declares a scope. It might consist of a single word, and that word is then understood to hang over every following rule until the heading expires, sometimes hundreds of rules later. The word *pratyayaḥ*, "suffix," stands as a heading over a vast stretch of the grammar; every element taught under it is thereby a suffix, without any rule needing to repeat the word. The word *aṅgasya*, "of the stem," governs another long stretch; every operation taught under it applies to stems. An adhikāra is a lexical scope. Open the brace once, and everything inside inherits the declaration.

Which brings us to the general mechanism the headings exemplify: *anuvṛtti*, "continuation." Words from an earlier sūtra are understood to continue into later sūtras until something cancels or replaces them. This is how the grammar omits so much and loses nothing. Our vidhi *iko yaṇ aci* is an example: a few rules before it, the single word *saṃhitāyām* appears, "in continuous utterance," meaning speech flowing without pause. That word silently carries forward, so the full reading of 6.1.77 is: "In continuous utterance, in place of *i, u, ṛ, ḷ* there is *y, v, r, l* when a vowel follows." Say the words separately, with a pause, and the rule does not fire; *dadhi atra* spoken slowly stays *dadhi atra*. The condition is real, operative, and textually invisible unless you track the inherited context.

Anuvṛtti is why the *Aṣṭādhyāyī* cannot be dipped into. A sūtra ripped from its position is often uninterpretable, not because it is vague but because half its words live upstream. Traditional students memorized the text in order precisely so that every rule arrived with its inherited environment intact. A modern programmer recognizes the situation exactly: a line of code means nothing outside the scopes that enclose it. The grammar is a program text, and position is semantics.

## Six roles

So far the machine has handled sounds and rule syntax. But Pāṇini's grammar also does something that looks startlingly modern: before assigning any case endings, it analyzes a sentence into semantic roles.

The system is called *kāraka*, from the root *kṛ*, "to do": a kāraka is a "factor of the action," a way a thing can participate in an event. Pāṇini defines six. Each gets a short abstract definition, and the case endings, *vibhakti*, are then taught as expressions of these roles, not the other way around. The roles are the deep layer; the endings are surface.

Here are the six, with the paraphrased sense of Pāṇini's definitions and the labels a modern linguist would reach for:

| kāraka | Pāṇini's sense (paraphrase) | Modern label |
|---|---|---|
| *kartṛ* | the independent one, the participant not subordinated to another | agent |
| *karman* | what the agent most directly aims to reach | patient |
| *karaṇa* | the most effective means | instrument |
| *sampradāna* | the one had in view through the object given | recipient |
| *apādāna* | the fixed point from which departure occurs | source |
| *adhikaraṇa* | the location that supports the action | locus |

Take the grammarians' favorite example sentence, shown here word by word, without the sound changes that would fuse it in fluent speech:

::: {.deva}
देवदत्तः अतिथये स्थाल्यां काष्ठैः ओदनं पचति
:::

::: {.iast}
*devadattaḥ atithaye sthālyāṃ kāṣṭhaiḥ odanaṃ pacati*
:::

"Devadatta cooks rice in a pot with firewood for the guest." Now run the role analysis. *Devadattaḥ* is the *kartṛ*, the agent: the independent participant, the one not directed by anyone else in the event. *Odanam*, the rice, is the *karman*, the patient: what the cooking aims at. *Kāṣṭhaiḥ*, the firewood, is the *karaṇa*, the instrument: the most effective means. *Atithaye*, the guest, is the *sampradāna*, the recipient: the one for whose sake the act proceeds. *Sthālyām*, the pot, is the *adhikaraṇa*, the locus. The sixth role, *apādāna*, the source, wants its own example: in *vṛkṣāt parṇaṃ patati*, "a leaf falls from the tree," the tree is the *apādāna*, the fixed point of departure. Only after these assignments does the grammar hand out endings: nominative for the agent in this construction, accusative for the patient, instrumental, dative, locative, ablative for the rest.

The design decision buried here is worth naming. Pāṇini could have described Sanskrit case endings directly: this ending appears here, that one there, with lists of exceptions. Instead he interposed an abstract layer of typed roles between meaning and morphology, defined the roles independently of their surface expression, and then mapped roles to endings by rule. That is exactly the move a compiler makes when it lowers source code through a typed intermediate representation instead of translating syntax straight to machine code. The role layer is what lets one semantic analysis drive many surface forms: the same *karman* shows up as an accusative in the active sentence, as a nominative in the passive one, and the grammar derives both from a single role assignment. Twenty-five centuries later, linguists building semantic role labelers for machine translation converged on inventories that read like annotated kāraka lists: agent, patient, instrument, recipient, source, location. Chapter 24 will take this correspondence literally and sketch kāraka as a typed role calculus in a proof assistant. For now it is enough to see that the oldest complete grammar we possess already refused to confuse meaning roles with their surface spelling.

![The six kāraka roles arranged around the verb pacati, each with its example word from the grammarians' cooking sentence.](book/assets/figures/fig05-karaka-roles.png "Diagram with the verb pacati, cooks, at the center and six labeled spokes radiating to the roles kartri the agent, karman the patient, karana the instrument, sampradana the recipient, apadana the source, and adhikarana the locus, each with its Sanskrit example word.")

## The joints of speech

Sanskrit is unusual among classical languages in writing down its speech stream more or less as spoken. Where English writing preserves word shapes across boundaries, Sanskrit orthography records what actually happens when words collide. The collisions are governed by *sandhi*, "junction": the system of sound changes at boundaries. To an outsider, sandhi is the wall that makes Sanskrit text look impenetrable, since words fuse and change spelling as they meet. To Pāṇini, sandhi is a small deterministic rewriting system, and his treatment of it is the part of the grammar a computer scientist recognizes fastest.

Work one junction end to end. The word *vāk* means "speech"; you met the goddess in Chapter 1. The word *īśa* means "lord." Put them together into a compound and Sanskrit does not say *vāk-īśa*. It says *vāgīśa*, "lord of speech," a title later given to great poets and to the god of eloquence. Where did the *g* come from?

Step by step:

1. *vāk* ends in *k*, a voiceless velar stop. *īśa* begins with *ī*, a vowel, and every vowel is voiced.
2. In continuous utterance, a word-final stop assimilates in voicing to what follows. Before a voiced sound, a voiceless stop may not stand. The rule that enforces this replaces the final stop with a member of *jaŚ*: the pratyāhāra collecting *j, b, g, ḍ, d*, the unaspirated voiced stops. Notice the machinery reappearing: the rule does not list five sounds; it names a slice of the Śivasūtras.
3. Which of the five? The metarule *sthāne 'ntaratamaḥ* decides: choose the substitute most similar to what it replaces. *k* is a velar; among *j, b, g, ḍ, d* the velar is *g*. So *g* it is.
4. Result: *vāg* + *īśa* = *vāgīśa*.

Every step is forced. Given the input and the rules, no human judgment intervenes; two grammarians running the derivation independently must produce the same output, which is why the tradition could treat correct speech as a matter of proof rather than taste. Sandhi is a pure function from adjacent sounds to junction, and the *Aṣṭādhyāyī* specifies it exhaustively, class by class, using the same pratyāhāra addressing throughout. This is also why sandhi matters to this book's larger machine: a system that parses Sanskrit must run these rules backwards, splitting fused text into words, and a system that verifies must run them forwards, checking that a proposed split is lawful. Deterministic rules can be inverted and checked. Vibes cannot.

## When rules collide

Any rule system rich enough to be useful will have rules that overlap, and a grammar of a real language overlaps constantly. Some rule says vowels behave one way; another rule says these particular vowels, in this particular environment, behave differently. Both match. Which fires?

Pāṇini's tradition has a general answer, and it is stated as a principle rather than left to intuition. Rules come in pairs of *utsarga* and *apavāda*: the general rule and the exception. An utsarga, "the general provision," states the default over a broad domain. An apavāda, "the exception," carves out a subdomain and prescribes something else there. The resolution principle is that the exception wins within its domain. The tradition puts it sharply: the apavāda blocks the utsarga wherever the apavāda can apply, and the general rule operates only in the remainder. A companion metarule, *vipratiṣedhe paraṃ kāryam*, handles a different collision: when two rules of equal standing genuinely conflict, the later one in the grammar's order prevails. Between them, these principles make rule selection a procedure instead of a debate.

The pattern is old and the pattern is everywhere. A programmer meets it as specific-over-general dispatch: pattern-matching clauses tried in order with the most specific case written to win; a subclass method overriding the superclass default; the CSS rule with higher specificity beating the site-wide style; the longest-prefix route beating the default route. In every such system, the exception is not a violation of the general rule but a part of the system's meaning, and the general rule's true domain is "everything the exceptions leave behind." Pāṇini's grammar is built this way from end to end. The broad vowel rules like *iko yaṇ aci* state defaults; narrower rules pin down environments where something else happens; the exception-wins principle makes the whole set coherent. What looks like a heap of four thousand rules is a prioritized cascade, and the priorities are part of the formal system, not editorial apology.

::: vrtti
The commentarial tradition did not merely use these principles; it audited them. Kātyāyana's *vārttikas*, brief notes on Pāṇini's rules, probe cases where the stated rules seem to under- or over-generate, and Patañjali's *Mahābhāṣya*, the "Great Commentary," stages full adversarial discussions: an objector proposes a counterexample, a provisional answer is refuted, a settled resolution emerges. Whole treatises were later devoted to collecting the paribhāṣās and testing when each may be invoked. The tradition treated its grammar the way a kernel team treats a compiler: as an artifact whose edge cases must be found, argued, and closed. Bug reports and regression arguments about the machine, carried on for centuries, are themselves the literature we inherit.
:::

## One derivation, end to end

Time to collect the whole toolkit and run it. The task: derive the correct fused form of *dadhi* + *atra*, "curd" + "here," spoken in one breath. Sanskrit speakers say *dadhyatra*. The machine must produce exactly that, and nothing else.

| Step | State | Machinery consulted | What happens |
|---|---|---|---|
| 1 | *dadhi* + *atra* | input | Two words, uttered in continuous speech. |
| 2 | *dadhi* + *atra* | adhikāra and anuvṛtti | The heading word *saṃhitāyām*, "in continuous utterance," is in force and carries into the sandhi rules. The derivation is inside its scope. |
| 3 | *dadh-**i*** + *atra* | Śivasūtras | Classify the final sound: *i* lies in the run from *i* to marker *K*, so it is an *iK*. |
| 4 | *dadhi* + ***a**tra* | Śivasūtras | Classify the following sound: *a* lies in the run from *a* to marker *C*, so it is an *aC*. A vowel follows a vowel: a junction needs resolving. |
| 5 | rule lookup | vidhi | *iko yaṇ aci* (6.1.77) matches: something in *iK* stands before something in *aC*. |
| 6 | rule reading | paribhāṣā | The genitive *ikaḥ* marks the replaced element; the locative *aci* marks the following context; nominative *yaṆ* is the substitute class. The rule commands: replace the *iK* sound with an *yaṆ* sound before the vowel. |
| 7 | choose substitute | paribhāṣā | *yaṆ* offers *y, v, r, l*. By *sthāne 'ntaratamaḥ*, take the nearest match: *i* is palatal, and among the four candidates *y* is the palatal. Substitute *y*. |
| 8 | *dadhy* + *atra* | rewrite | The replacement is made. No further rule targets the new junction. |
| 9 | *dadhyatra* | output | The derivation halts. "The curd is here." |

Nine steps, and every one mechanical. Step 2 used a heading and inherited context. Steps 3 and 4 ran range queries against the fourteen strings. Step 5 matched a rewrite rule. Steps 6 and 7 applied metarules, one to parse the rule's own syntax, one to resolve a one-of-four choice deterministically. Had a sharper rule covered this environment, the exception-wins principle would have preempted step 5. The output is forced. Run it again tomorrow, or in another century, and it is *dadhyatra* again.

This is what it means to say the *Aṣṭādhyāyī* is a machine. Not a metaphor: an input, a rule base with typed rule kinds, a conflict policy, a halting condition, and a determinate output. The reader who followed the table has now read a sūtra mechanically, which is what this chapter promised. Pāṇini's students did this for every form of every word, from memory, at speed. The grammar generates the language in the strict sense: correct Sanskrit is whatever the machine derives, and the machine's verdicts are checkable by anyone who has internalized the rules.

![Pāṇini's grammar as a pipeline: roots and suffixes pass through the typed rules and sandhi to a forced surface form, with exceptions outranking general rules.](book/assets/figures/fig04-panini-machine.png "Diagram of a pipeline in which the inputs dhatu plus pratyaya enter a box of sutra rule types, samjna, paribhasha, vidhi, and adhikara, then pass through sandhi to the surface form, with a side box stating the utsarga apavada principle that an exception outranks the general rule.")

## The earliest generative grammar

Step back and inventory what the system contains. An ordered inventory of primitives with an addressing scheme for its subsets: the Śivasūtras and pratyāhāras. Typed rules: definitions, metarules, operations, headings. Scoping and inheritance: adhikāra and anuvṛtti. A typed intermediate layer between meaning and surface form: the kārakas. Deterministic rewriting at boundaries: sandhi. A priority system for overlapping rules: utsarga and apavāda, with exception-wins resolution. And over all of it, an economy so severe that the tradition joked a grammarian rejoices over a saved half-syllable as over the birth of a son.

Every item in that inventory has a name today in the theory of formal systems and programming languages, and every one of those names was coined more than two millennia after Pāṇini. This is why the standard judgment of modern scholarship is not that the *Aṣṭādhyāyī* resembles a generative grammar but that it is one: the earliest known, and among the most complete descriptions of any language ever produced by any method. When twentieth-century linguistics built generative grammar as a discipline, its founders acknowledged the *Aṣṭādhyāyī* as the tradition's true ancestor. Scholars have since taken the machine seriously on its own terms: Paul Kiparsky (2009) analyzed the economy of the Śivasūtras and the logic of Pāṇinian rule ordering; George Cardona (1976) produced the standard modern accounts of how the grammar's devices actually work; Peter Scharf and colleagues have carried Pāṇinian architecture directly into computational linguistics, building machine-readable implementations of its rule types (Scharf 2009; Goyal et al. 2012). The judgment that this is a formal system is not romantic projection backwards. It is the professional assessment of the people who study formal systems for a living. Receipt: paper §2.2 and refs.bib.

One more thing, and it is the hinge to everything that follows. A tradition that possessed such a machine had to ask what the machine's existence implied. If four thousand rules can generate all correct speech, what is the relation between the rules and the speech? Are words assembled from parts because the grammar assembles them, or does the grammar merely describe joints that were always there? When the machine says *vāgīśa* is correct and some other junction is not, what kind of fact is that: a convention, a law of nature, or something deeper? Pāṇini did not ask these questions; he built. But his successors did ask. Kātyāyana annotated the machine. Patañjali argued through its hard cases and began to wonder aloud about the eternity of words. And some centuries later, Bhartṛhari inherited the whole apparatus, the machine and the questions, and gave the radical answer: the machinery of language is not a description of reality; it is the closest we come to reality itself. The grammarians did not stop at syntax. Grammar became metaphysics. That story is the next chapter.

## The thread so far

One verse showed us that translation depends on interpretation, and an oral library showed us why interpretation lives in commentary. Now we have seen the tradition's crown jewel: a grammar that is a genuine formal system, with typed rules, scoped contexts, deterministic rewriting, and principled conflict resolution, built to run in human memory. The tradition that produced Bhartṛhari was already a tradition of machine-builders. Next we watch their machine turn philosophical.

*Doors: vyākaraṇa students (D) get Pāṇini's devices presented as the formal systems they are; AI engineers (A) and proof-assistant readers (B) get the rule-system reading, from range queries to exception priority; Sanskrit readers (C) are carried by the story of the fourteen strings and the lord of speech; commentary scholars (E) glimpse the vārttika and bhāṣya tradition auditing the machine.*
