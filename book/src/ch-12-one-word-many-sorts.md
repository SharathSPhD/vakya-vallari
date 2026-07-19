# 12 · One Word, Many Sorts

Somewhere in the middle of the formalization campaign, two agents disagreed without ever meeting.

One of them had drawn verse 1.9 from the queue. Its job, as Chapter 11 described, was to read the verse record, read the commentary, and compile a contract: entities with sorts, axioms with verbatim citations, denials, an accepted reading, rivals doomed in advance. The commentary on 1.9 is about the syllable Om, the single point where the rival doctrines stop quarreling, and it says of the verse's key term that the imperishable is the base beneath every school. So the agent declared an entity named akṣara and gave it the sort **absolute**: the category the edition reserves for ultimate reality. Locally, this was exactly right.

The other agent had drawn the five-verse period 1.18-22, the long sentence in which the grammarian's object of worship is assembled clause by clause. There the akṣara-tradition appears as a supplier of signs: phonetic marks, varṇas, the high and low sounds of the four Vedas holding their separate stations. So that agent declared an entity named akṣara and gave it the sort **linguisticItem**: the category for words, sentences, and sounds. Locally, this was also exactly right.

Then the corpus-level gate ran, as it runs after every round, and did the one thing it knows how to do. It walked every contract, collected every entity name with every sort it had been assigned, and found that akṣara now carried two. Conflict. Build red.

Now ask what the red build means, because the honest answer is the subject of this chapter: nobody knows, least of all the gate. It could mean drift. Two independent agents, two prompts, two contexts, and a term quietly slides from one category to another; multiply that by 776 entity declarations and the ontology dissolves into mush. Catching precisely that failure is why the gate exists. But it could also mean doctrine. Bhartṛhari is the philosopher for whom the deepest truths live in words that face two directions at once, and akṣara is the most famous double-facing word he has: it means both "imperishable" and "syllable," and Chapter 1 watched the opening verse lean its whole weight on that fact. If the text is punning on purpose, then the two sorts are not an error. They are the reading.

A type-checker cannot tell these cases apart. Sameness of spelling is the only evidence it has, and sameness of spelling is exactly what a pun and a drift have in common. So the gate does the only defensible thing: it refuses to decide. It stops the build, names the term, lists the verses and their sorts, and waits. A human must rule. And here is the move that makes the ruling worth something: the ruling does not evaporate into an approval click or a merged pull request. It becomes data, in a file, with reasons, and the gate reads that file forever after. The file is the homonym registry, and it is where this project's mechanical discipline and its editorial honesty meet (data/ontology/homonyms.json; paper §8).

## The rule and its blind spot

The rule the gate enforces is easy to state. A named entity must carry one sort everywhere in the corpus, unless the exact partition of its uses, which verse gets which sort, is registered as polysemy, with a gloss and a one-sentence textual justification for every sense. No registration, no second sort. Registration with a sloppy partition, no pass either: the registry must account for the actual uses, verse by verse, or the conflict stands.

The blind spot is just as easy to state. The consistency gate cannot tell drift from doctrine. It has no access to the commentary, no theory of puns, no sense of when a tradition is speaking in its own voice and when it is reporting an opponent. Everything it knows is a table of names, verses, and sorts. This is not a defect to be engineered away. It is the division of labor from Chapter 11, surfacing at the level of meaning: machines carry volume and vigilance, humans carry judgment, and the architecture's job is to force the judgment into a form the machine can hold the humans to. The registry is that form. Drift gets corrected in the contract. Doctrine gets registered, glossed, justified, and partitioned. Either way, something diffable changes, and the ledger records who ruled and when.

Across six adjudication rounds the gate surfaced 95 sort conflicts, some terms recurring as new verses entered the corpus; every one was resolved as either a correction or a registered polysemy (paper §7). What survived that filter is the registry as it now stands.

![Three words with two registered senses each, kept from colliding by the homonym registry.](book/assets/figures/fig14-homonym-splits.png "Diagram of three small trees: akshara splitting into the imperishable Absolute of verse 1.9 and the phoneme of verses 1.18 to 22, shabda splitting into the canonical linguistic item and the Absolute of 1.46, and sphota splitting into the doctrinal meaning-bearer and the phoneticians' first sound of 1.102 to 106.")

## Rulings that become data

An entry in the registry has four parts per sense: the sort; a gloss saying what the term means in this sense; a one-sentence justification pointing at the textual grounds; and the exact list of verses this sense covers. Here is the entry that settled the dispute our two agents started, verbatim from the file:

```json
"akṣara": {
  "senses": [
    {
      "sort": "absolute",
      "gloss": "the imperishable, eternal reality; Brahman itself",
      "justification": "Verse 1.9 identifies akṣara as the eternally imperishable that IS purification itself, the syllable through which supreme knowledge comes.",
      "verses": ["1.9"]
    },
    {
      "sort": "linguisticItem",
      "gloss": "phonetic signs, syllables, or phonetic elements; sound-letters",
      "justification": "Verses 1.18-22 refer to aksara-smrti's signs as the phonetic apparatus [...] the differentiated sounds (varnas) housed within the highest speech.",
      "verses": ["1.18-22"]
    }
  ]
}
```

(One typographic dash in the second justification is elided with a marker; the file is the authority.)

Read it as what it is: a court record. The question before the court was whether akṣara in 1.9 and akṣara in 1.18-22 are the same kind of thing. The ruling is no, they are not, and here is the gloss for each, here is the sentence of textual grounds for each, and here, decisively, is the partition: 1.9 to the absolute sense, 1.18-22 to the phonetic sense, and nothing else to either. The partition is the teeth. If a future contract uses akṣara in verse 1.55, the gate will not silently extend either sense to cover it. The registered partition no longer matches the actual uses, the build goes red, and a human must rule again. Polysemy, in this system, is never open-ended permission. It is an exact, exhaustive, machine-checked map of who ruled what about which verse.

::: engineer
The whole gate is about thirty lines (src/vallari/consistency.py). It builds a table from entity name to the list of (verse, sort) pairs across all contracts, main entities only, since the rejected readings' local entities are deliberate counterexamples and must not pollute the table. Any name with more than one sort is a conflict unless the registry covers it, and coverage is strict: every sense's verse list is flattened into a map from verse to allowed sort, and the check is that every actual use matches, `all(allowed.get(v) == s for (v, s) in uses)`. Note what strictness buys. A registry entry can never be broader than the evidence, because breadth is unrepresentable: the entry lists verses, not licenses. And the registry is plain JSON under version control, so every past ruling is a diff, every future dispute is a pull request, and the test suite replays every ruling on every commit (tests/test_consistency.py).
:::

Three of these rulings carry real doctrinal weight. They are worth telling in full, because each shows a different way the same mechanical question, one sort or two, turns into a different editorial question.

## The pun the gate almost flattened

Begin where the book began. Chapter 1 made much of the fact that VP 1.1 calls Brahman anādinidhana, without beginning or end, and akṣara, and that akṣara means both "imperishable" and "syllable, phoneme." The contract of 1.1 carries that as a predication with the citation "What is imperishable and what is phonic are, for him, the same thing." Eight verses later the pun pays off:

> **1.9**
> सत्या विशुद्धिस्तत्रोक्ता विद्यैवैकपदागमा ।
> युक्ता प्रणवरूपेण सर्ववादाविरोधिना ॥ ९ ॥
>
> *satyā viśuddhistatroktā vidyaivaikapadāgamā |*
> *yuktā praṇavarūpeṇa sarvavādāvirodhinā || 9 ||*
>
> The true purification is declared to be there: knowledge alone, reached through the single syllable, joined with the form of the pranava, which contradicts no doctrine.

Here akṣara is the imperishable itself. The registry's gloss for this sense says it plainly: "the imperishable, eternal reality; Brahman itself," on the grounds that 1.9 "identifies akṣara as the eternally imperishable that IS purification itself, the syllable through which supreme knowledge comes." Then, in the great five-verse period that follows, the same word turns its other face outward. Verse 20 of that period:

> **1.20** (within the period 1.18-22)
> अत्र वाचो निमित्तानि चिह्नानीवाक्षरस्मृतेः ।
> शब्दपूर्वेण योगेन भासन्ते प्रतिबिम्बवत् ॥ २० ॥
>
> *atra vāco nimittāni cihnānīvākṣarasmṛteḥ |*
> *śabdapūrveṇa yogena bhāsante pratibimbavat || 20 ||*
>
> Wherein the occasions of speech, like signs of the imperishable tradition, shine as in a reflection, through the yoga that is preceded by the word.

The akṣara-smṛti here supplies cihnāni, signs: the phonetic apparatus, sound-letters, the varṇas of the recited Vedas that the next verse sorts into their separate stations. The registry's second sense, "phonetic signs, syllables, or phonetic elements; sound-letters," covers exactly this span and nothing more.

Now run the counterfactual, because it is the argument for this whole chapter. Suppose the corpus rule had been the simple one, one name, one sort, no exceptions. Then one of the two agents was wrong by definition, and an adjudicator under that rule has only bad options: demote 1.9's akṣara to a phoneme, which makes nonsense of purification through it; promote 1.18-22's signs to the Absolute, which makes nonsense of their being signs of something; or rename one entity, akṣara_1 and akṣara_2, which is worst of all, because it hides in the identifiers the very fact the text is shouting. A same-sort rule would have flattened a deliberate pun into an error, and flattened it silently, as a routine cleanup commit.

::: pandit
The tradition does not treat this pun as ornament. The commentarial line this edition transmits reads the double sense as the opening verse's argument in miniature: for a śabdādvaitin, the claim that ultimate reality is word-natured is carried in the very fact that one word means both the imperishable and the phoneme. The commentary on 1.9 makes the closure explicit: "the circle closes: the imperishable that is also the phoneme is now the syllable through which purification comes." Eka-pada-āgama, arrival by way of one word, is on this reading not a poetic flourish about Om but the doctrine performed. The registry entry is the formal residue of that reading: two senses, two sorts, one word, on purpose. A tradition that condensed its metaphysics into a pun deserves an ontology that can register one.
:::

## The word in the wood

The second split is quieter and, for the edition's coherence, heavier. Śabda, "word," is the most frequent entity in the corpus, and its canonical sort is linguisticItem: the registry's central sense covers some forty-four verse units with the gloss "the linguistic term or word as used in utterance, grammar, and communication." That is śabda as grammar handles it, the word of derivations and sentences and correct forms. There is also a small manifestation sense, "the audible utterance or phonetic manifestation of sound; the many differentiated sounds," for the two doxographic spans where śabda names the empirical noise itself, "contrasted with the underlying word-principle," as the justification puts it.

But in nine verses, and in one above all, the commentary requires something stronger:

> **1.46**
> अरणिस्थं यथा ज्योतिः प्रकाशान्तरकारणम् ।
> तद्वच्छब्दोऽपि बुद्धिस्थः श्रुतीनां कारणं पृथक् ॥ ४६ ॥
>
> *araṇisthaṃ yathā jyotiḥ prakāśāntarakāraṇam |*
> *tadvacchabdo'pi buddhisthaḥ śrutīnāṃ kāraṇaṃ pṛthak || 46 ||*
>
> As the fire that resides in the kindling-wood is the cause of further illumination, so the word residing in the intellect is, separately, the cause of audible sounds.

This is the first of the great sphoṭa similes, and the commentary is emphatic that the simile is chosen for what it denies: the flame was in the wood before any churning, and "the sounds do not create the word; they release and transmit what was already whole within the speaker." The śabda of this verse is not an item in an utterance. It is the inner word, complete and unsounded, prior to every sound that will carry it. The registry's first sense names it: "the transcendent, inner word as an unchanging principle; the word residing in intellect before utterance; śabdatattva," justified by the observation that 1.46 "presents śabda as buddhistha (residing in intellect), complete and unsounded, latent as fire in the fire-stick," and extended to the handful of later verses, 1.94, 1.96, 1.115 and their neighbors, where the unchanging word-absolute persists through its manifestations.

Notice the word śabdatattva in that gloss. It is the word of VP 1.1, the word-essence the opening verse identifies with Brahman, and its sort in the contract of 1.1 is absolute. The registry entry for śabda is therefore doing load-bearing work across the whole edition: it is the formal statement that the śabda of the fire-in-wood verse is the same kind of thing as the śabdatattva of the first verse, and a different kind of thing from the śabda that grammar declines and conjugates. Collapse that three-way partition in either direction and the system fails doctrinally. Make all śabda absolute and grammar is left with no object; make all śabda linguisticItem and the fire goes out of the wood, the inner word demoted to one more item in the utterance stream, which is precisely the mistranslation family that 1.44-49's rejected readings are built to refute. The partition, forty-four units one way, nine another, two a third, is the edition's answer, checkable at every commit.

## The quarantine

The third split is the strangest, because here the two senses are not two faces of one doctrine. They are two rival doctrines fighting over one technical term.

Sphoṭa is Bhartṛhari's signature concept. In his own usage, the registry's first sense, it is "the meaning-bearing linguistic universal; the word-whole that resides in intellect and manifests through utterance": the partless bearer of meaning, sorted linguisticItem, distinguished from the serial audible sounds across the doctrine's home verses, 1.44, 1.45, 1.49, 1.53, 1.70, 1.75, 1.76, 1.77. That is the sphoṭa this book has been discussing since Chapter 4.

Then comes verse 1.102, and the term changes hands:

> **1.102**
> यः संयोगविभागाभ्यां करणैरुपजन्यते ।
> स स्फोटः शब्दजाः शब्दा ध्वनयोऽन्यैरुदाहृताः ॥ १०२ ॥
>
> *yaḥ saṃyogavibhāgābhyāṃ karaṇairupajanyate |*
> *sa sphoṭaḥ śabdajāḥ śabdā dhvanayo'nyairudāhṛtāḥ || 102 ||*
>
> What is generated by the organs through conjunction and disjunction, that is the sphoṭa; the sounds born from that word are what others call the dhvanis.

Others, anyaiḥ. This is reported speech. For the phonetician-grammarians whose view the verse transmits, sphoṭa names the first-produced acoustic sound, the one the articulators generate by their contacts and releases, and dhvani names the spreading train of sounds born from it. On this usage the sphoṭa is a physical event with a birth. Four verses later the same borrowed terminology is still running:

> **1.106**
> अनवस्थितकम्पेऽपि करणे ध्वनयोऽपरे ।
> स्फोटादेवोपजायन्ते ज्वाला ज्वालान्तरादिव ॥ १०६ ॥
>
> *anavasthitakampe'pi karaṇe dhvanayo'pare |*
> *sphoṭādevopajāyante jvālā jvālāntarādiva || 106 ||*
>
> Even while the vibration of the organ persists unsettled, further sounds are generated from the sphota itself, as flame from another flame.

Sounds generated from the sphoṭa: in Bhartṛhari's own vocabulary that sentence is close to heresy, since his sphoṭa is manifested, never produced, and produces nothing acoustically. It reads naturally only inside the phoneticians' usage, and the edition's contested note on 1.106 draws exactly that conclusion, calling the verse "evidence that 1.102-106 form one reported block."

The registry's second sense is the quarantine wall around that block. Sort: manifestation. Gloss: "the first-produced acoustic sound; the initial sound generated by articulation (phonetician usage, distinct from Bhartṛhari's doctrine)." The justification is the longest in the file, and it earns its length: "Verses 1.102, 1.107 report an alternative terminology from phonetician-grammarians. The sphoṭa here is acoustic and produced (not metaphysical), described as 'the one generated by the articulators' contacts and releases,' making it a manifestation of the causal power of articulation. Verse 1.106 explicitly references '1.102's usage.' These verses are positioned within a tour (1.102–113) of non-Bhartṛhari theories about sound and meaning." Partition: 1.102, 1.106, 1.107, and not one verse more.

Consider what the quarantine prevents. Without it, an adjudicator forcing one sort on sphoṭa faces a poisoned choice. Sort it all linguisticItem and the phoneticians' produced sound is silently absorbed into Bhartṛhari's doctrine, so that the doxographic report contaminates the very concept it is being contrasted with; a careless reader of the formal layer would conclude that Bhartṛhari's sphoṭa is generated by the vocal organs, which is the precise error the surrounding verses exist to fence off. Sort it all manifestation and the contamination runs the other way: the partless meaning-bearer of 1.75-77 becomes an acoustic event, the doctrine temporalized, which is one of the named mistranslation families in this edition's map of failures. The two-sense registration keeps the report a report. The same wall holds for dhvani, whose registry entry flips between linguisticItem and manifestation across the same block, tracking whose voice is speaking. Doxography is data too, but it must be labeled, and in this system the label is a sort.

::: vrtti
The commentary on 1.102 is worth hearing on its own terms, because its equanimity explains the edition's. It calls the verse "a terminological about-face, reported deadpan," notes that "on this usage the sphota is itself acoustic and produced," and observes that Bhartṛhari can afford to report the rival usage without protest because half of his apparatus survives translation into it: the first sound fixes the word's identity, the propagated train varies freely. What does not survive is the metaphysical core, and "the sequence 1.102-113 is precisely a tour of what theories look like when the undivided word is left out." The contested note adds that the reporter's own name for the view is unrecoverable, the kārikā's anonymous anyaiḥ leaving candidates from early phoneticians to the Auḍumbarāyaṇa line, but "what is clear is that the terminology here inverts Bhartrhari's own." The registry does not adjudicate who the others were. It adjudicates only what the gate needs: within this span, the word sphoṭa denotes a different kind of thing.
:::

## The later round

The first harvest of registrations came from the early adjudication rounds, and its entries read like the ones above: full sentences, discursive justifications. Then the campaign reached the final third of the kāṇḍa, the verses on tradition, correctness, and the Veda, and a later round of conflicts produced a second harvest. You can see the round in the registry's own style: the later entries are terse, their justifications compressed to a verse pointer and a clause, rulings logged by an adjudicator who had by then written dozens of them. The registry is a court record, and like any court record it shows its history.

The flagship of the later round is veda itself, and the entry is short enough to quote whole:

```json
"veda": {
  "senses": [
    {
      "sort": "linguisticItem",
      "gloss": "the recited Vedic corpus",
      "justification": "anukāra and upāya of Brahman, an empirical text",
      "verses": ["1.135", "1.23", "1.5", "1.7"]
    },
    {
      "sort": "absolute",
      "gloss": "the eternal seed-order re-manifested each aeon",
      "justification": "1.132: eternal bīja persists through dissolutions",
      "verses": ["1.132"]
    }
  ]
}
```

The verse that forced the split is the one where Bhartṛhari threads between Mīmāṃsā's authorless Veda and Nyāya's authored one:

> **1.132**
> न जात्वकर्तृकं कश्चिदागमं प्रतिपद्यते ।
> बीजं सर्वागमापाये त्रय्येवातो व्यवस्थिता ॥ १३२ ॥
>
> *na jātvakartṛkaṃ kaścidāgamaṃ pratipadyate |*
> *bījaṃ sarvāgamāpāye trayyevāto vyavasthitā || 132 ||*
>
> Never does anyone accept a tradition to be without an author; when all traditions perish, the seed remains, and hence the triple Veda stands established.

Every current of teaching is received as someone's; yet when all traditions perish in the dissolution between world-ages, a seed persists from which the triple Veda re-establishes itself. The commentary's resolution: "what is eternal is not any authored text-body but the vyavastha, the seed-order that re-flowers identically each age." So the Veda of 1.5 and 1.7, the anukāra and upāya, imitation of and means to Brahman, is a recited corpus, a linguisticItem; and the Veda of 1.132 is the eternal seed-order, absolute. One word, two standings, and the contract format is what forced the question. A prose translator can write "the Veda" in both places and never decide. A contract cannot: the sort field admits no shrug.

The same round registered six more splits, each a small ruling with its justification quoted here verbatim from the file. Vyavasthā: observed "systematic arrangement as observed order" in 1.28, where "eternality belongs to the arrangement," versus the eternal ordering power of 1.132, the "seed-order that re-establishes the Veda." Śruti: the received revealed text, "recited canon alongside smṛti," versus revelation as beginningless, authorless order in 1.144, "anādi, avyavacchinna, akartṛka." Rūpa: the sensible quality of things, "form-bound powers of sensible qualities" in 1.135 and 1.138, versus the word-form, "linguistic form vs meaning," in 1.136 and 1.148. Sādhu: correctness as dharmic efficacy in 1.139, where "sādhu enables abhyudaya," correct speech bearing spiritual fruit, versus the correct word-form itself, "sādhu vs apabhraṃśa forms," in 1.27 and 1.152. Viparīta: "incorrect forms" as a property in 1.27, versus "viparīta cognition from wrong reading" in 1.140, where the inversion lives in the knower, not the word. And kārya: the manifest deed in 1.127, where "word-power IS the deed in non-differentiation," versus the grammatical operation of 1.62, "operations construed with what elements mean." Six words, six exact partitions, six sentences of grounds. None is as dramatic as the akṣara pun. All are the same act: an editor, forced by a red build to say which kind of thing a word names in a particular verse, saying so on the record.

## Forty-one terms, ninety-one senses

The registry now holds 41 terms carrying 91 senses among them (paper §8; the results table in that section counts it beside the theorems). Artha, "meaning, object, purpose," is the champion with five senses spanning five of the six sorts; śabda's three-way partition is the largest by coverage; most entries are modest two-way splits like guṇa, the grammatical constituent of 1.62 against the quality of 1.64. Every one of the 91 is a documented editorial ruling with a gloss, a one-sentence textual justification, and an exact verse partition, and every one is enforced by the same thirty-line gate on every commit.

It is worth being precise about what kind of object this is, because it looks like a dictionary and is not one. A dictionary lists senses a word may bear and leaves the reader to decide which applies where. The registry decides. It assigns every occurrence of every conflicted term in the corpus to exactly one sense, exhaustively, with no residue, and it submits the assignment to a machine that will fail loudly the moment the corpus and the map disagree. Polysemy, which in most editions lives in footnotes and translators' instincts, has become data: diffable, so every past ruling is inspectable and every change is a visible event; checkable, so no ruling can silently rot as the corpus grows; and contestable, because a reader who thinks the sphoṭa quarantine is drawn one verse too wide can edit one line of JSON and watch the gates tell her exactly what her reading costs. Chapter 23 will argue that this contestability is the edition's real product. The registry is its densest exhibit.

## Sameness of spelling, sameness of being

Two lessons ran through this chapter in opposite directions, and both are worth stating plainly.

The machine forced the philology to become explicit. Nothing in the practice of translation obliges anyone to decide whether the Veda of 1.132 is the corpus or the seed-order; prose absorbs the ambiguity, and most editions let it. A sort field does not. The consistency gate took a question philologists could always defer and made deferral a build failure, and the result is a catalogue of 91 rulings that would otherwise exist nowhere, each pinned to its textual grounds.

And the philology taught the machine something it could not know: that sameness of spelling is not sameness of being. A type system left to itself would have enforced one-name-one-sort and been wrong, wrong about a pun that carries the opening verse's doctrine, wrong about the inner word in the kindling, wrong about a reported rival's vocabulary. The registry is the interface where each side corrects the other, mechanical discipline making the rulings unavoidable, editorial judgment making them right. One word, many sorts, every split on the record.

## The thread so far

The corpus-level gate demands one sort per entity name and cannot tell drift from doctrine, so every conflict it surfaces goes to a human, and the ruling becomes data: a homonym registry entry with sort, gloss, one-sentence justification, and an exact verse partition that the gate re-checks forever. Three splits carry doctrine: akṣara's pun between the imperishable and the phoneme, śabda's inner word in the fire-in-wood verse against its everyday grammatical self, and the sphoṭa quarantine that keeps the phoneticians' reported usage in 1.102-1.106 from contaminating Bhartṛhari's own. A later round added veda, śruti, vyavasthā, rūpa, sādhu, viparīta, and kārya, bringing the registry to 41 terms and 91 senses, every one a documented, diffable, contestable editorial ruling. With that, Part III's machinery is complete, and the vine itself is next: the verses of Book I, section by section, card by card.

*Doors: commentary scholars, this chapter is yours: the registry is polysemy adjudication in your discipline's own terms, gloss and grounds and scope, merely held to account by a machine. Vyākaraṇa students, watch akṣara and sphoṭa change hands between doctrines; the registry is doing what the tradition's own technical glossaries do, occurrence by occurrence. Literature readers, the pun survived the type-checker, and the story of how is the story of the whole method. Engineers, the gate is thirty lines and the override file is JSON under test; steal the pattern. Proof people, note that the partition check is exact and decidable, so every editorial ruling is also a regression test.*
