# 4 · From Grammar to Metaphysics

The last chapter left a machine running. A few thousand rules, packed
into eight chapters, generate the correct forms of Sanskrit from roots
and affixes. The machine works. And a machine that works raises a
question that no rule inside it can answer. Why does it work? What must
language be, if a finite rulebook can capture it? What must meaning be,
if it survives compression into aphorisms and reassembly in a student's
mind?

The Sanskrit tradition did not treat these as idle questions. It kept
them open for centuries, inside an unbroken line of commentary on
Pāṇini. This chapter follows that line to its philosophical summit: the
Vākyapadīya of Bhartṛhari, the text this whole book serves, and the text
the machine of Part III will be held to.

## The line of commentary

Pāṇini's Aṣṭādhyāyī, the "Eight Chapters," did not end inquiry. It
started an argument that ran for eight hundred years.

The first great respondent was Kātyāyana, commonly placed around the
third century BCE, perhaps a century or more after Pāṇini. He composed
vārttikas: terse examination notes attached to individual sūtras, the
aphoristic rules of the grammar. A vārttika asks, of one rule at a time,
the auditor's questions. Is the rule needed at all? Does it say too
much? Does it say too little? Does another rule already cover the case?
Kātyāyana proposed thousands of these probes, sometimes defending
Pāṇini, sometimes amending him, sometimes recording forms the master's
rules could not reach. If Chapter 2 read the commentary stack as a
decompression algorithm, the vārttikas are something else again: they
are a test suite, written against a system their author did not build
and refused to take on faith.

Then came the synthesis. Patañjali, commonly placed in the second
century BCE, wrote the Mahābhāṣya, the "Great Commentary." It is a
commentary on both layers at once: on Pāṇini's sūtras and on
Kātyāyana's vārttikas about them. And it is written as theater. Voices
argue. An objector raises a difficulty; a provisional answer is tried
and fails; a better answer stands. The reader watches rules being
defended, bent, and occasionally outmaneuvered, in a prose so lively
that the tradition never stopped quoting it. Later grammarians bundled
the three authors into a single authority, the munitraya or "three
sages," with a working rule of thumb: where they disagree, the later
voice prevails, and Patañjali's voice most of all.

The Mahābhāṣya matters to this book for one reason above the others: it
is where grammar starts asking philosophical questions in the open. Its
opening section wants to know what a word actually is. When someone
says "cow," what is the word? The sound? The sound is gone the moment
it is uttered, yet the word seems to remain. Is the word then the
individual cow it names, or the shape common to cows, or something
else? Why should anyone study grammar at all, beyond keeping the Vedic
texts correct? Patañjali collects the traditional answers and adds
arguments. The discipline of vyākaraṇa, literally "taking apart," the
science of grammatical analysis, is no longer just a toolkit. It is
becoming a darśana: a "seeing," a systematic viewpoint on what there
is, of the kind Indian philosophy counts among its schools. Later
Indian surveys of the philosophical systems would give the grammarians
a chapter of their own.

Bhartṛhari inherited all of this and said so. His verses on grammar's
standing are not modest:

> The wise call grammar the closest to that Brahman, the highest
> austerity among austerities, the foremost limb of the Vedas. (1.11)

> That is the gateway to liberation, the therapy for the impurities of
> speech, the purifier of all the sciences; it shines as the science
> standing above the sciences. (1.14)

Brahman here is the absolute reality of the Upaniṣads, the ground of
everything. The claim, then, is startling on its face: the study of
correct speech is the discipline nearest to ultimate reality, and a
door to liberation. The rest of this chapter explains why, for
Bhartṛhari, that claim is not rhetoric but the strict consequence of an
argument. Between Patañjali and Bhartṛhari lie several centuries of
thin record; verses at the end of the Vākyapadīya's second book tell,
in the tradition's own voice, of the Mahābhāṣya's study decaying and
being recovered. Bhartṛhari presents himself as a restorer, not an
innovator. A partly preserved commentary on the Mahābhāṣya is also
attributed to him. His great original work stands on the shoulders of
the whole line.

## The man, honestly

Almost everything in this book about what the Vākyapadīya says can be
checked against a printed page. Almost everything about the man who
wrote it cannot. It is worth being exact about which is which.

::: pandit
What is known, and what is argued. Bhartṛhari is generally placed
around the fifth century CE. The strongest anchor is that Buddhist
philosophers of the sixth century, Dignāga among them, already quote
his verses; an older dating to the seventh century rested on a Chinese
pilgrim's travel report and is now widely set aside as resting on a
confusion (Houben 2016). Nothing reliable is known of his life. A famous collection
of worldly poetry circulates under the same name, and whether poet and
grammarian are one person is an old and open question this book does
not need to settle.

The text has its own puzzle. The kārikās, the memorial verses of Book
I, come down with a prose commentary, the Vṛtti. Whether Bhartṛhari
wrote the Vṛtti himself or a later hand did (a name transmitted with
it, Harivṛṣabha, may or may not be the same person) is a genuine
scholarly dispute, argued from style, from cross-references, and from
how the Vṛtti glosses verses in ways the kārikās alone do not force.

This project's ruling is procedural, not doctrinal. Its primary text is
K. A. Subramania Iyer's edition of Book I with the Vṛtti (Subramania
Iyer 1965), and its contracts treat that edition's text as the
standpoint to be formalized (paper §2.1). Every axiom in Part III inherits that single-source
choice, and Chapter 23 states plainly what would change under a
different one. The machine does not decide who wrote the Vṛtti. It
decides whether a translation is faithful to what the Vṛtti says.
:::

## Three books

The work's title declares its subject matter: Vākyapadīya, from vākya,
"sentence," and pada, "word." It is the treatise of the sentence and
the word, and it comes in three books, each called a kāṇḍa, a "section"
or "book" (paper §2.1).

Book I is the Brahmakāṇḍa, the "Book of Brahman." The manuscript
tradition also transmits it under the title Āgama-samuccaya, a
"compendium of received tradition" (data/corpus/vakyapadiya.jsonl,
unit titles). Both names are accurate. The book states the metaphysics
of the word, and it states it as the collected doctrine of a lineage,
constantly citing what "they declare" and what "those who know the
word" discern. In this edition's corpus it comprises 144 verse units in
ten thematic movements: the Word-Brahman; grammar as the path; the
eternal connection of word and meaning; the limits of inference; the
sphoṭa doctrine; phoneme, word, and sentence; the phoneticians' rival
reports; cognition interwoven with the word; the necessity of
tradition; and the levels of speech. Part IV of this book walks all ten.

Book II is the Vākyakāṇḍa, the "Book of the Sentence." Its central
argument is holist: the sentence, not the word, is the real unit of
meaning. Sentence meaning arrives as a single flash of understanding,
and the "words" our grammars extract are useful fictions of analysis,
real for the workshop but not for the hearer. Book III, the Padakāṇḍa,
the "Book of Words," is the longest: a run of studies on what word
meanings are, treating universals, substance, relation, quality,
direction, time, action, and more, each examined with full scholastic
machinery.

This book, and the formal edition behind it, covers Book I. The reason
is not only scope. Book I is the metaphysical core on which the other
two stand, and its doctrines are the ones a translator is most likely
to flatten (paper §2.1). What follows is those doctrines, plainly.

## Śabdādvaita, stated plainly

The thesis has a name: śabdādvaita, from śabda, "word," and advaita,
"non-dual." The non-duality of the word. Chapter 1 opened with the
verse that states it, and the verse will not be improved on here:

> Brahman is without beginning or end, imperishable, and its essence is
> the Word. It appears in the mode of objects, and from it proceeds the
> unfolding of the world. (1.1)

One reality, without beginning or end. Its essence is not merely
describable in language; it is language, word-essence, śabdatattva. The
many things of the world are that one reality appearing, the way one
word appears through many voices, and the world's unfolding proceeds
from it the way a word-form unfolds from its root in a grammatical
derivation. Chapter 1 dwelt on the verbs: the text says the one
appears (vivarta) as the many, and pointedly does not say it
transforms (pariṇāma) into the many, the way milk becomes curds. The
one remains one while presenting itself as world.

Say what this does not mean, because mistranslation usually starts
here. It does not mean that Sanskrit is a magic language, or any
language is. The thesis is about word as such, not about one people's
words. It does not mean that rocks are made of noises. Audible sound,
as the next section shows, is for Bhartṛhari the outermost husk of the
word, not its substance. It does not mean that saying a thing makes it
so. And it is not a private idealism in which each mind dreams its own
world. The claim runs deeper and stranger: reality is intrinsically
intelligible, intelligibility is linguistic, and there is no residue
of pure, wordless being hiding behind what can be known and said. To be
is to be sayable. The evidence Bhartṛhari presses is close to home:

> There is no cognition in the world that does not follow upon word;
> all knowledge appears as if interpenetrated by word. (1.123)

Try to catch yourself knowing something with no word in it anywhere,
not even the silent "this" that picks the thing out. The tradition's
claim is that you will fail, and that the failure is data. Every
cognition comes already word-shaped. That is exactly what you would
expect if consciousness and language are, at the root, the same stuff,
and it is why grammar can be "the gateway to liberation": if the world
is the unfolding of the word, then the discipline that studies
unfolding words is studying, in miniature, how everything comes to be.
Refine speech and you refine the speaker; follow the word to its source
and you arrive at the source of the world.

## Sphoṭa and dhvani: the whole and the series

The Brahmakāṇḍa's central technical distinction arrives at verse 1.44,
and its opening move is a deliberate paradox: every word is two words.

::: {.deva}
द्वावुपादानशब्देषु शब्दौ शब्दविदो विदुः ।
एको निमित्तं शब्दानामपरोऽर्थे प्रयुज्यते ॥ ४४ ॥
:::

::: {.iast}
dvāvupādānaśabdeṣu śabdau śabdavido viduḥ |
eko nimittaṃ śabdānāmaparo'rthe prayujyate || 44 ||
:::

> In the words employed, those who know the word discern two words: one
> is the cause of words, the other is what is used in respect of
> meaning. (1.44)

One of the two is the sound: the audible, physical event that the vocal
organs produce and the ear receives. Bhartṛhari's usual terms for it
are dhvani and nāda, both meaning "sound." The other is the word as
meaning-bearer, and for this the tradition's term is sphoṭa, from a
root meaning "to burst forth": the meaning-whole that flashes in the
mind, entire and undivided, when the sounds have done their work.

Why split the word in two? Because of a problem hiding in plain sight.
Speech is serial. Sounds come one at a time, and each is gone before
the next arrives; when the last sound of "cow" is uttered, the first
no longer exists anywhere. At no instant is the whole sound-sequence
present. Yet meaning does not arrive in installments, a third of a cow
per phoneme. It arrives whole, or not at all. So the thing that bears
the meaning cannot simply be the sound-series, which is never all there
at once. The bearer of meaning and the vehicle of audition must be
distinguished. The sphoṭa is what is expressed; the dhvani is what
expresses it (paper §2.1; corpus 1.44 commentary).

> Since audible sound is born in sequence, the word is neither prior
> nor posterior; the sequenceless, taking on the form of sequence, is
> born as though divided. (1.48)

Note the "as though." The word itself has no earlier and later; sequence
belongs to the machinery of utterance, and the appearance of division is
borrowed, the miniature of 1.1's vivarta. The one word appears as many
sounds the way the one Brahman appears as many things.

![Sequential sound events manifest the single undivided sphoṭa; the sounds reveal it, they do not compose it.](book/assets/figures/fig06-sphota-dhvani.png "Diagram showing a sequence of dhvani sound events along a time arrow on the left, a single circle labeled sphota, the undivided meaning-whole, on the right, arrows from the sequence to the circle labeled manifests, and a note that the sounds reveal it rather than compose it.")

Bhartṛhari argues this with images, and the images are the part of the
text a reader keeps. The first is fire hidden in wood. Fire was made,
in the Vedic ritual world, by churning a fire-stick, the araṇi, until
the flame latent in the wood came out.

::: {.deva}
अरणिस्थं यथा ज्योतिः प्रकाशान्तरकारणम् ।
तद्वच्छब्दोऽपि बुद्धिस्थः श्रुतीनां कारणं पृथक् ॥ ४६ ॥
:::

::: {.iast}
araṇisthaṃ yathā jyotiḥ prakāśāntarakāraṇam |
tadvacchabdo'pi buddhisthaḥ śrutīnāṃ kāraṇaṃ pṛthak || 46 ||
:::

> As the fire that resides in the kindling-wood is the cause of further
> illumination, so the word residing in the intellect is, separately,
> the cause of audible sounds. (1.46)

::: vrtti
This edition's commentary on 1.46 unpacks the simile so: "Fire is
latent in the arani, the fire-stick, before any kindling; churned, it
becomes flame, which then illuminates other things. So the word sits
buddhistha, in the intellect, complete and unsounded; articulation
churns it into audible sruti, and the sounds then do the manifesting."
The simile is chosen for what it denies: churning does not create the
flame from nothing, and sounds do not create the word. They release and
transmit what was already whole within the speaker
(data/corpus/vakyapadiya.jsonl, record 1.46).
:::

The second image is the lamp. It appears twice, once for each side of
the relation. On one side, sound is like lamplight: it is the condition
under which the unchanging word gets apprehended, and the light's own
qualities are not the word's qualities.

> From afar, only the sound is discerned, like the glow of a lamp; and
> in the notes of bells and the like, that difference is plainly seen.
> (1.104)

You can see, from far off, that a lamp is burning without seeing
anything it illuminates. Just so, you can hear that someone is speaking
before you hear what they say. Loudness, speed, timbre, accent: these
belong to the dhvani. A verse recited quickly and the same verse
recited slowly differ in sound from end to end, yet they are the same
verse. What varies with delivery is the light; what is revealed does
not vary. On the other side, the lamp cuts against a naive picture of
words as invisible glass:

> Words that have not themselves become objects do not illuminate the
> meaning; not by their mere existence, ungrasped, are they revealers
> of meanings. (1.56)

A lamp no one sees lights nothing. A word must itself be grasped in
order to reveal its meaning; like light, it is both grasped and
grasping, an object to the ear and an instrument to the mind. Meaning
is not poured from head to head. It is kindled: the sounds strike, and
the hearer's own inner word flares up whole, fire answering fire.

::: engineer
The modern reader will feel a familiar shape. Sphoṭa and dhvani sit
close to type and token, or to a message and its encoding: an invariant
carried unchanged across variation in the carrier, recovered whole by
the receiver rather than shipped in pieces. The verse recited fast or
slow is the checksum intuition; the fire-in-wood simile says the
receiver decodes with structure it already has. The analogy is honest
work, and this book uses it. But hold it loosely, for two reasons.
First, sphoṭa is not an abstraction over utterances; for Bhartṛhari it
is more real than the sounds, not a convenient equivalence class of
them. Second, even inside Book I the terminology moves: verses 1.102 to
1.106 report rival phoneticians for whom "sphoṭa" names the produced
sound itself and the dhvanis its after-ripples, nearly the reverse
assignment. The formal edition does not paper over this; its homonym
registry quarantines those doxographic senses into their own entries,
and Chapter 12 tells that story
(data/ontology/homonyms.json; paper §2.1).
:::

## The pun that carries the thesis

Return once more to the first verse. Brahman is called akṣara. As an
adjective, the word means "imperishable": a-kṣara, not subject to
decay, which is why it sits so naturally beside "without beginning or
end." But every schoolchild in the tradition also knew akṣara as an
ordinary noun meaning "syllable," the minimal speakable unit, the thing
recitation counts. Bhartṛhari was a grammarian writing for grammarians.
When he calls the ultimate reality akṣara, both readings fire at once,
and the pun is the whole argument in one word: the imperishable is the
phonic. What does not pass away is of the same nature as what speech is
made of.

The pun is beautiful in Sanskrit and a trap in translation, because a
translator must usually choose one sense per verse. Elsewhere in Book I
the choice is forced and differs: at 1.9 the word points at the
imperishable itself, while verses 1.18 to 1.22 use it for the phonetic
signs of the sciences of recitation.

> The true purification is declared to be there: knowledge alone,
> reached through the single syllable, joined with the form of the
> pranava, which contradicts no doctrine. (1.9)

The formal edition records exactly this split: its homonym registry
assigns akṣara two senses with two different sorts, the absolute and
the linguistic item, each justified and each tied to its verses
(data/ontology/homonyms.json). A translation that renders 1.1 as if
akṣara meant only "syllable" has demoted Brahman to a phoneme; one that
renders 1.18 as if it meant only "the imperishable" has promoted a
spelling-sign to godhead. Both errors are one word wide. Chapter 12
shows how the machine forces every such choice into the open, where it
can be checked.

## The levels of speech

One more doctrine completes the map, and Book I saves it for its final
movement. Speech, Bhartṛhari teaches, has depth. Verse 1.142 names
three levels and declares a wonder beyond them. Outermost is vaikharī,
the "elaborated": audible, articulated speech, fully sequenced, the
level at which dhvani lives. Within it is madhyamā, the "middle": the
inner word of thought, still sequenced, run through silently in the
mind with no breath spent. Innermost is paśyantī, the "seeing": speech
at the level where it no longer says but sees, undivided, without
sequence, intention not yet unrolled into order. And beyond even these
three, the verse says, lies the supreme station of the Word. Whether
that station is a fourth level or the summit of the third is a
classical crux, and this edition's corpus records it as contested
rather than deciding it silently (data/corpus/vakyapadiya.jsonl,
record 1.142, contested note).

The hierarchy generalizes everything this chapter has built. The
sphoṭa-dhvani pair becomes a gradient: speaking is a descent, from
vision through inner sequence to sound, and understanding is the same
stair climbed the other way. The śabdatattva of 1.1 stands at the top,
which means the top is reachable, level by level, through one's own
speech. That is the ground under the astonishing claims of 1.11 and
1.14. Chapter 22 walks these verses one by one, with their contracts
and their theorems.

## The text the machine answers to

The reader now holds the Word tradition whole. A grammar became a
darśana; the darśana asked what language must be for grammar to work;
and Bhartṛhari's answer was maximal: the ground of everything. One
reality, of the nature of the word, appearing as world; in every
utterance a meaning-whole revealed, not assembled; in every key term,
senses that must be kept distinct on pain of heresy.

Notice what these doctrines do to the task of translation. Each one is
a hazard with a shape (paper §2.1). Render the śabdatattva as a mere
property of Brahman rather than its essence, and you have made a sort
error. Render vivarta with the vocabulary of transformation, and you
have made a relation error, converting Bhartṛhari into the rival he
declined to be. Collapse akṣara, sphoṭa, and dhvani into whichever
English word lies nearest, and you have made homonym errors that erase
the argument itself. Chapter 1 promised a machine that catches exactly
these failures, and Part III builds it. But a proof is only as good as
the discipline of proving, and that is a tradition of its own. Part II
teaches it: what a proof really is, how propositions became types, and
how a small, checkable kernel came to deserve the same kind of trust
the paramparā placed in flawless recitation.

## The thread so far

An oral civilization compressed its knowledge into sūtras, and
commentary became the decompression discipline; Pāṇini's grammar showed
that language itself could be generated by rules. Through Kātyāyana's
probes and Patañjali's great synthesis, that grammar grew into a
philosophy, and Bhartṛhari answered its deepest question: language
works because reality itself is of the nature of the word, one
meaning-whole appearing as many sounds. The Brahmakāṇḍa states that
vision in 144 verses, and this book's machine will be held to what its
commentary says. Before the machine, the reader needs the other
tradition: proof.

*Doors: the Sanskrit reader now has the whole Vākyapadīya in outline
and its central images in hand (C); the vyākaraṇa student has the
commentarial line from vārttika to bhāṣya to darśana (D); the
commentary scholar has the Vṛtti question and this edition's
single-source ruling stated honestly (E); engineers and provers get the
sphoṭa-dhvani pair as their first bridge, held loosely (A, B).*
