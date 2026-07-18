# 15 · The Eternal Connection

*Verses 1.23 to 1.31 · 7 units*

Grammar reaches Brahman by way of the word. But the previous movement left a bond unexamined: what secures the tie between a word and what it means? This movement fixes it. The relations between words and their meanings are nitya, eternal, and they are not made by anyone. That is the charter of 1.23 to 1.31, and everything in the stretch either states the thesis, defends it, or draws its consequences for authority.

The argument moves from the word-meaning bond to the standing of tradition. It opens by stating the eternality as inherited rather than argued: the relations are handed down as eternal by the great seers, the authors of the sūtras and the commentaries (1.23). It catalogues, across one long three-verse sentence, the subject matter the science handles, and it does so on a specific presupposition, that words are reached by apoddhāra, extraction from the sentence by analysis, not given as natural prior units (1.24-26). Then it turns to the point that matters most for a grammar of correct speech. Correct words, sādhu, are established from the cultivated by tradition and are a means of dharma; incorrect words are the reverse. And yet, in the last quarter of the verse, the text concedes that in conveying meaning there is no difference between them (1.27). Correctness is not about communication. It is about dharma. From there the movement props up that claim (a codified arrangement must have a purpose, 1.29) and widens it into a doctrine about knowledge itself (1.30, 1.31).

Readers arriving from grammar's elevation hold a discipline that reaches the supreme by regulating words. What this movement adds is the ground under the regulation. If correct and incorrect words communicate equally well, then grammar cannot justify itself by utility, and it must rest on something older than argument. That something is āgama, authoritative tradition. The consequence is stated in the two most cited verses of the stretch: dharma is not established by reasoning apart from tradition, and even the knowledge the seers possess is itself preceded by tradition (1.30). The unbroken paths of dharma are not set aside by reasoning, because they are established in the world (1.31). This is where the movement points forward. It has just claimed that reasoning cannot overturn what tradition secures. The next chapter owes us an account of why inference is so weak, and it delivers one.

A few cards reward a slow read. Slow down at 1.27, the pivot of the whole stretch, because its force is held back until its final words: sādhu and asādhu convey meaning alike, so the difference between them is moral and traditional, not semantic. Slow down at 1.28, because it is strikingly concessive: whether words are eternal or made, the text says, no beginning of them is found, as with living beings, and this beginningless arrangement is what eternality means here, vyavasthā-nityatā. Slow down at 1.30, because it is the load-bearing verse of the movement and one of the most quoted in the whole work: reasoning apart from tradition does not establish dharma, and the seers are no exception. And glance at 1.24-26 for its quiet presupposition, apoddhāra, which will govern how every later chapter treats the word as a unit extracted from the sentence rather than assembled into it.

In the cards, watch a single term do the load-bearing work: the eternality of the śabda-artha-sambandha, the word-meaning relation. The featured verse turns on its direction. The bond is given, not made, and the strongest rejected readings fail by making it. One renders the relation as samaya, convention, which the commentary flags as the Naiyāyika position; another makes it kṛta, authored by the great seers as an innovation. Both are contradicted, not merely unlicensed, because a conventional or authored relation has a beginning and an author, and a Veda whose words mean by convention is a Veda someone composed. The verdict pattern is worth watching across the stretch. Where a reading grants inference or reasoning the power to settle dharma, the commentary does not stay silent, it denies, and the card comes back contradicted (1.30, 1.31). Where a reading merely misplaces a property, treating correct words as better communicators or individual words as intrinsically eternal, the card comes back unlicensed (1.27, 1.28). The alternation keeps teaching the difference between a claim the commentary omits and one it refutes.

There are no contested boxes in this stretch. That absence is itself informative. The kārikās here are declarative and their syntax is settled, so the edition had few places to record doubt. The interpretive weight falls instead on the verdicts, and especially on the two contradicted readings at 1.30 and 1.31, where the polemic against tarka, reasoning, is stated flatly enough that any reading granting reason its own authority collides with the text head-on.

One last orientation note. The featured verse of this chapter is 1.23, the verse that states the eternality as an inheritance. The walkthrough that follows shows the one formal move that decides everything: the relation axiom's direction, given rather than made, and how a mistranslation into convention asserts a claim no axiom entails. The cards follow. The critique of reasoning that 1.30 promises begins in the next chapter.

## Featured verse: 1.23 in slow motion

This verse fixes the eternality of the word-meaning relation. The interesting formal move is the relation axiom's direction: the connection is given, not made. A mistranslation that renders the relation as convention asserts a claim no axiom entails, and fails unlicensed.

**Axioms, each with its verbatim license.**

- predication `nityah(sambandha)` — “That the sabda-artha-sambandha is eternal”
- predication `transmitted(sambandha)` — “The nityatva thesis, stated as inherited rather than argued”
- predication `parampara_siddhah(nityatva)` — “The nityatva thesis, stated as inherited rather than argued”
- relation `bhavya(nityatva → apaurusheya)` — “An eternal relation secures an authorless Veda”
- relation `samaya_bhavya_krita(samaya → apaurusheya)` — “a conventional relation has an author and a beginning, and a Veda whose words mean by convention is a Veda someone composed”

**Denials.**

- `samaya(sambandha)` — “hold against the Naiyayikas, for whom the relation is samaya”
- `krita(sambandha)` — “the bond between a word and what it means is not made”

**Rejected readings and their compiled fates.**

- “The relation between words and their meanings is established by convention or agreement.” → **contradicted**. Directly asserts sambandha is samaya, which the commentary explicitly identifies as the Naiyayika position. This contradicts both the verse's claim of nityatva and Bhartrhari's position. Conventional relations have authors and beginnings, undermining Vedic authorilessness.
- “The word-meaning relations were established by the great seers as an authoritative innovation.” → **contradicted**. Claims sambandha is krita (made/authored), which the commentary explicitly denies: 'the bond between a word and what it means is not made.' This contradicts the core doctrine that the relations are eternal and uncreated.

**Theorems in `V1_23.lean`.** `accepted_adequate`, `conventional_relation_inadequate`, `authored_relations_inadequate`. All close by `decide`; the build carries zero `sorry`.


## The verses

### 1.23

::: {.deva}
नित्याः शब्दार्थसंबन्धास्तत्रान्नाता महर्षिभिः ।  
सूत्राणां सानुतन्त्राणां भाष्याणां च प्रणेतृभिः ॥ २३ ॥
:::

::: {.iast}
nityāḥ śabdārthasaṃbandhāstatrānnātā maharṣibhiḥ |  
sūtrāṇāṃ sānutantrāṇāṃ bhāṣyāṇāṃ ca praṇetṛbhiḥ || 23 ||
:::

> There the relations between word and meaning are handed down as eternal by the great seers — by the authors of the sutras with their ancillary treatises, and of the commentaries.

*Gist.* The nityatva thesis, stated as inherited rather than argued.

*Contract.* 7 entities · 5 axioms · 2 denials; adequacy proved in `V1_23`.

*Refuted.* “The relation between words and their meanings is established by convention or agreement.” (contradicted): Directly asserts sambandha is samaya, which the commentary explicitly identifies as the Naiyayika position.


### 1.24-26

::: {.deva}
अपोद्धारपदार्था ये ये चार्थाः स्थितलक्षणाः ।  
अन्वाख्येयाश्च ये शब्दा ये चापि प्रतिपादकाः ॥ २४ ॥  
कार्यकारणभावेन योग्यभावेन च स्थिताः ।  
धर्मे ये प्रत्यये चाङ्गं संबन्धाः साध्वसाधुषु ॥ २५ ॥  
ते लिङ्गैश्च स्वशब्दैश्च शास्त्रेऽस्मिन्नुपवर्णिताः ।  
स्मृत्यर्थमनुगम्यन्ते केचिदेव यथागमम् ॥ २६ ॥
:::

::: {.iast}
apoddhārapadārthā ye ye cārthāḥ sthitalakṣaṇāḥ |  
anvākhyeyāśca ye śabdā ye cāpi pratipādakāḥ || 24 ||  
kāryakāraṇabhāvena yogyabhāvena ca sthitāḥ |  
dharme ye pratyaye cāṅgaṃ saṃbandhāḥ sādhvasādhuṣu || 25 ||  
te liṅgaiśca svaśabdaiśca śāstre'sminnupavarṇitāḥ |  
smṛtyarthamanugamyante kecideva yathāgamam || 26 ||
:::

> Those word-meanings reached by abstraction, and those meanings whose defining marks are fixed; those words that are to be explained, and those that do the explaining; those relations obtaining by way of cause and effect and by way of fitness, which are ancillary to dharma and to cognition, holding among correct and incorrect words — these are set out in this science, by indicatory marks and in their own terms; and only some are followed, for the sake of what is to be remembered, according to tradition.

*Gist.* One long sentence spanning three verses, cataloguing the subject matter of the science.

*Contract.* 7 entities · 5 axioms · 1 denials; adequacy proved in `V1_24_26`.

*Refuted.* “Words are primitive linguistic units from which sentences are built.” (unlicensed): Contradicts the presupposed apoddhara doctrine: the verse grounds itself in the principle that words are extracted from the sentence by analysis, not given as natural prior units.


### 1.27

::: {.deva}
शिष्टेभ्य आगमात् सिद्धाः साधवो धर्मसाधनम् ।  
अर्थप्रत्यायनाभेदे विपरीतास्त्वसाधवः ॥ २७ ॥
:::

::: {.iast}
śiṣṭebhya āgamāt siddhāḥ sādhavo dharmasādhanam |  
arthapratyāyanābhede viparītāstvasādhavaḥ || 27 ||
:::

> Correct words, established from the cultivated by way of tradition, are the means of dharma; the incorrect are the reverse — though in conveying the meaning there is no difference between them.

*Gist.* One of the pivotal verses of the kanda, and its force lies entirely in the last quarter.

*Contract.* 9 entities · 5 axioms · 1 denials; adequacy proved in `V1_27`.

*Refuted.* “Correct words communicate meaning better than incorrect ones.” (unlicensed): Treats sadhu and asadhu as semantically distinguished in their capacity to convey meaning.


### 1.28

::: {.deva}
नित्यत्वे कृतकत्वे वा तेषामादिर्न विद्यते ।  
प्राणिनामिव सा चैषा व्यवस्थानित्यतोच्यते ॥ २८ ॥
:::

::: {.iast}
nityatve kṛtakatve vā teṣāmādirna vidyate |  
prāṇināmiva sā caiṣā vyavasthānityatocyate || 28 ||
:::

> Whether they are eternal or made, no beginning of them is found — as with living beings; and this arrangement is what is called eternality.

*Gist.* A strikingly concessive move.

*Contract.* 7 entities · 4 axioms · 1 denials; adequacy proved in `V1_28`.

*Refuted.* “Individual words possess eternality as an intrinsic metaphysical property.” (unlicensed): The verse's concessive opening ('whether they are eternal or made') explicitly declines any commitment to individual eternality.


### 1.29

::: {.deva}
नानर्थिकामिमां कश्चिद् व्ववस्थां कर्तुमर्हति ।  
तस्मान्निवध्यते शिष्टैः साधुत्वविषया स्मृतिः ॥ २९ ॥
:::

::: {.iast}
nānarthikāmimāṃ kaścid vvavasthāṃ kartumarhati |  
tasmānnivadhyate śiṣṭaiḥ sādhutvaviṣayā smṛtiḥ || 29 ||
:::

> No one would undertake this arrangement if it served no purpose; therefore the tradition concerning correctness is composed by the cultivated.

*Gist.* A brief argument from purpose, propping up 1.27.

*Contract.* 6 entities · 3 axioms · 1 denials; adequacy proved in `V1_29`.

*Refuted.* “The tradition concerning correctness could be purposeless if properly established.” (unlicensed): Reverses the causal principle: the verse establishes that IF something is codified, it MUST have purpose.


### 1.30

::: {.deva}
नागमादृते धर्मस्तर्केण व्यवतिष्ठते ।  
ऋषीणामपि यज्ज्ञानं तदप्यागमपूर्वकम् ॥ ३० ॥
:::

::: {.iast}
nāgamādṛte dharmastarkeṇa vyavatiṣṭhate |  
ṛṣīṇāmapi yajjñānaṃ tadapyāgamapūrvakam || 30 ||
:::

> Dharma is not established by reasoning apart from tradition; even the knowledge that the seers possess is itself preceded by tradition.

*Gist.* The most consequential verse in this stretch, and one of the most cited in the whole work.

*Contract.* 5 entities · 3 axioms · 2 denials; adequacy proved in `V1_30`.

*Refuted.* “Reasoning alone is sufficient to establish dharma.” (contradicted): The verse explicitly negates this: dharma is not established by reasoning apart from tradition.


### 1.31

::: {.deva}
धर्मस्य चाव्यवच्छिन्नाः पन्थानो ये व्यवस्थिताः ।  
न तांल्लोकप्रसिद्धत्वात् कश्चित्तर्केण बाधते ॥ ३१ ॥
:::

::: {.iast}
dharmasya cāvyavacchinnāḥ panthāno ye vyavasthitāḥ |  
na tāṃllokaprasiddhatvāt kaścittarkeṇa bādhate || 31 ||
:::

> And those paths of dharma that stand unbroken — no one sets them aside by reasoning, because they are established in the world.

*Gist.* The complement to 1.30.

*Contract.* 2 entities · 4 axioms · 1 denials; adequacy proved in `V1_31`.

*Refuted.* “Reasoning can overturn the unbroken paths of dharma.” (contradicted): Directly contradicts the verse's denial that tarka badhate dharma.

