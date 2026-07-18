# 13 · The Word-Brahman

*Verses 1.1 to 1.10 · 10 units*

The Vine begins here. From this chapter to the end of Part IV, every one of the 144 units of the Brahmakāṇḍa appears as a verse card: Devanagari, IAST, translation, a gist distilled from the commentary, one line on the contract, and at least one refuted reading with its compiled verdict. Chapters 1 through 12 built the machinery and tested it on a single verse. Now the machinery walks the whole text, ten verses at a time.

This first movement, 1.1 to 1.10, is the charter for everything that follows. It argues one thesis and then spends nine verses absorbing its consequences. The thesis is śabdādvaita, word-monism: the ultimate reality, Brahman, is not merely describable by language but is language, śabdatattva, word-essence. The consequences arrive in strict order. If reality is one, plurality must be explained, and 1.2 explains it through śakti, power: the one functions as though divided while never separating from its powers. If there is process, time must be placed, and 1.3 makes time itself a śakti of Brahman rather than an independent container. If there is experience, its structure must be derived, and 1.4 derives the triad of experiencer, experienced, and experiencing from the one seed. Then the text turns to scripture. The Veda is both the means of reaching the word-principle and its likeness (1.5). Its branches display the fixed powers of words (1.6). The smṛtis, the secondary literature, borrow all their authority from it (1.7). The quarreling doctrines of monists and dualists alike are constructions raised on its non-injunctive portions (1.8). Their one point of convergence is the praṇava, the syllable Om (1.9). And from that source the branches of knowledge spread outward, causes of the refinement of understanding (1.10).

Readers arriving from Part III hold a tested instrument and one fully worked verse. What this movement adds is context. Verse 1.1 is not a free-standing aphorism but the head of a chain, and each link is a verse whose commentary licenses some readings and rules out others. The question the movement leaves open is the one 1.10 raises by cataloguing the disciplines: among all these branches of learning, which one leads back to the source? That question is handed directly to the next chapter, where the text answers it with an elevation of grammar that has startled readers for fifteen centuries.

Four cards reward a slow read. Slow down at 1.2, because a single particle, iva, "as if", carries the entire difference between apparent division and real division, and the contract converts that particle into a formal denial. Slow down at 1.5, because two quiet nouns, upāya, means, and anukāra, likeness, commit the text to a Veda that both points toward the word-principle and resembles it, a double role the rejected reading flattens into mere instrumentality. Slow down at 1.8, because it is deflation from inside the tradition: whole doctrinal systems are traced to arthavāda, explanatory rather than injunctive matter, worked over by their authors' own conceptual constructions. And slow down at 1.9, because after 1.8's demolition it offers a single point of convergence, Om, described as contradicting no doctrine, which is as close as this kāṇḍa comes to a peace treaty.

In the cards, watch one failure mode above all: demotion. Again and again the rejected reading renders śabdatattva as "linguistic structure", or the Veda as "only an instrument", or vidyā, knowledge, as "a mental cognition". Each time, something the commentary treats as absolute is demoted to a property, and under the six-sort discipline that is a sort error. The identity claim the commentary insists on becomes decidably false, and the reading fails as unlicensed. The opposite pole is pariṇāma, real transformation. Readings that make Brahman genuinely become the world fail as contradicted, because the commentary does not merely omit that claim, it denies it. Ten cards of alternation between those two verdicts will teach the difference between unlicensed and contradicted faster than any definition in Chapter 9 did.

Watch the contested boxes too. Three cards in this stretch carry them, at 1.1, 1.6, and 1.9, and each marks a place where the kārikā alone underdetermines the rendering: whether vivarta already carries the later Advaitic sense of illusory appearance, what the awkward compound yataśaktitvam actually fixes, whether vidyā eva takes a definite side in the knowledge-versus-action debate. In each case the edition chose a reading, cited its grounds, and recorded the doubt instead of deciding silently. That habit, doubt made visible, recurs in every chapter of the walk, and it is the part of the apparatus that most traditions of translation leave out.

One last orientation note. The featured verse of this chapter is 1.1 itself, the only verse in the book to be treated twice. Chapter 10 walked it end to end as a demonstration of the pipeline. The featured section here reads it again as the head of its own section, with one new emphasis: the single denial in its contract, and why a denial is a stronger editorial act than an omission. The walkthrough follows this intro. The cards follow the walkthrough. The vine grows from there.

## Featured verse: 1.1 in slow motion

Chapter 10 walked this verse end to end. Here it stands at the head of its own section, and one detail deserves a second look: the contract's single denial. The commentary does not merely prefer vivarta over pariṇāma; it rules pariṇāma out. That is why the transformation reading fails as contradicted rather than unlicensed. A denial is a stronger editorial act than an omission, and the theorem records the difference.

**Axioms, each with its verbatim license.**

- identity `sabdatattva = brahman` — “the ultimate is not merely describable by language but is language — sabda-tattva, word-essence”
- relation `vivartate(brahman → jagat)` — “Vivarta is appearance without loss of unity: the one presents itself as many while remaining one”
- predication `anadinidhana(brahman)` — “its plain sense is 'imperishable', which is why it sits naturally beside anadinidhana, 'without beginning or end'”
- predication `aksara(brahman)` — “What is imperishable and what is phonic are, for him, the same thing”

**Denials.**

- `parinamate(brahman → jagat)` — “Bhartrhari does not say Brahman becomes the world (parinamate), which would make the world a real transformation of its substance”

**Rejected readings and their compiled fates.**

- “The imperishable linguistic structure underlying words has no beginning or end.” → **unlicensed**. Renders śabdatattva as a mere linguistic property, demoting the ontological identity the commentary insists on: the ultimate IS language, not something described by it. The sort error (property vs absolute) makes the identity claim decidably false.
- “Brahman transforms itself into the world of objects.” → **contradicted**. Asserts a real transformation (parinama) of Brahman's substance, which the commentary explicitly rules out in favor of vivarta (appearance without loss of unity).

**Theorems in `V1_1.lean`.** `accepted_adequate`, `naive_linguistic_structure_inadequate`, `naive_linguistic_structure_sort_error`, `parinama_transformation_inadequate`. All close by `decide`; the build carries zero `sorry`.


## The verses

### 1.1

::: {.deva}
अनादिनिधनं ब्रह्म शब्दतत्त्वं यदक्षरम् ।  
विवर्ततेऽर्थभावेन प्रक्रिया जगतो यतः ॥ १ ॥
:::

::: {.iast}
anādinidhanaṃ brahma śabdatattvaṃ yadakṣaram |  
vivartate'rthabhāvena prakriyā jagato yataḥ || 1 ||
:::

> Brahman is without beginning or end, imperishable, and its essence is the Word. It appears in the mode of objects, and from it proceeds the unfolding of the world.

*Gist.* The opening karika states the sabdadvaita thesis in a single breath: the ultimate is not merely describable by language but is language — sabda-tattva, word-essence.

*Contract.* 3 entities · 4 axioms · 1 denials; adequacy proved in `V1_1`.

*Refuted.* “The imperishable linguistic structure underlying words has no beginning or end.” (unlicensed): Renders śabdatattva as a mere linguistic property, demoting the ontological identity the commentary insists on: the ultimate IS language, not something described by it.

::: {.contested}
*Contested.* whether vivarta already carries the later Advaitic sense of *illusory* appearance, or only the weaker sense of manifestation, is disputed; the karika alone does not settle it
:::


### 1.2

::: {.deva}
एकमेव यदाम्नातं भिन्नशक्तिव्यपाश्रयात् ।  
अपृथक्त्वेऽपि शक्तिभ्यः पृथक्त्वेनेव वर्तते ॥ २ ॥
:::

::: {.iast}
ekameva yadāmnātaṃ bhinnaśaktivyapāśrayāt |  
apṛthaktve'pi śaktibhyaḥ pṛthaktveneva vartate || 2 ||
:::

> That which tradition declares to be one alone, resting on its differentiated powers, functions as though it were divided — though it is in fact not separate from those powers.

*Gist.* Having asserted unity, Bhartrhari must account for plurality, and he does it through sakti, power.

*Contract.* 3 entities · 4 axioms · 2 denials; adequacy proved in `V1_2`.

*Refuted.* “Brahman genuinely transforms itself into the world through its differentiated powers.” (contradicted): Asserts parinama (real transformation of substance), which the verse rejects through the 'iva' (as if).


### 1.3

::: {.deva}
अध्याहितकलां यस्य कालशक्तिमुपाश्रिताः ।  
जन्मादयो विकाराः षड् भावभेदस्य योनयः ॥ ३ ॥
:::

::: {.iast}
adhyāhitakalāṃ yasya kālaśaktimupāśritāḥ |  
janmādayo vikārāḥ ṣaḍ bhāvabhedasya yonayaḥ || 3 ||
:::

> Resting upon its power of Time, on which divisions are superimposed, arise the six modifications beginning with birth; and these are the wombs of the differentiation of beings.

*Gist.* Time enters as a sakti of Brahman, not as an independent container.

*Contract.* 4 entities · 4 axioms · 2 denials; adequacy proved in `V1_3`.

*Refuted.* “Time is an independent absolute power that directly generates the six modifications.” (unlicensed): Treats time as an independent absolute rather than a power (sakti) of Brahman, contradicting the commentary's explicit teaching that time enters as a sakti of Brahman, not as an independent container.


### 1.4

::: {.deva}
एकस्य सर्वबीजस्य यस्य चेयमनेकधा ।  
भोक्तृभोक्तव्यरूपेण भोगरूपेण च स्थितिः ॥ ४ ॥
:::

::: {.iast}
ekasya sarvabījasya yasya ceyamanekadhā |  
bhoktṛbhoktavyarūpeṇa bhogarūpeṇa ca sthitiḥ || 4 ||
:::

> It is one, the seed of all; and this abiding of it is manifold — in the form of the experiencer, in the form of what is to be experienced, and in the form of the experiencing.

*Gist.* The triad is subject, object, and act: bhoktr, bhoktavya, bhoga.

*Contract.* 4 entities · 6 axioms · 3 denials; adequacy proved in `V1_4`.

*Refuted.* “Brahman creates and produces the three forms of experiencer, experienced, and experiencing as separate entities.” (contradicted): Asserts parinama (real transformation or production) between brahman and the three, which the commentary explicitly denies: 'Bhartrhari's claim is not that Brahman produces these three but that its st…


### 1.5

::: {.deva}
प्राप्त्युपायोऽनुकारश्च तस्य वेदो महर्षिभिः ।  
एकोऽप्यनेकवर्मेव समाम्नातः पृथक् पृथक् ॥ ५ ॥
:::

::: {.iast}
prāptyupāyo'nukāraśca tasya vedo maharṣibhiḥ |  
eko'pyanekavarmeva samāmnātaḥ pṛthak pṛthak || 5 ||
:::

> The Veda is both the means of attaining it and its likeness; and though one, it was handed down separately by the great seers, as though it had many paths.

*Gist.* Two words are doing the work: upaya and anukara.

*Contract.* 3 entities · 4 axioms · 1 denials; adequacy proved in `V1_5`.

*Refuted.* “The Veda serves only as an instrument to reach Brahman, not as Brahman itself.” (unlicensed): Treats veda as purely instrumental by degrading Brahman from absolute reality (word-essence) to a mere external goal (property).


### 1.6

::: {.deva}
भेदानां बहुमार्गत्वं कर्मण्येकत्र चाङ्गता ।  
शब्दानां यतशक्तित्वं तस्य शाखासु दृश्यते ॥ ६ ॥
:::

::: {.iast}
bhedānāṃ bahumārgatvaṃ karmaṇyekatra cāṅgatā |  
śabdānāṃ yataśaktitvaṃ tasya śākhāsu dṛśyate || 6 ||
:::

> In its branches are seen the many courses taken by its divisions, the subordination of several elements to one rite, and the determinate power of words.

*Gist.* A continuation of 1.5, cataloguing what the recensions display.

*Contract.* 7 entities · 3 axioms · 1 denials; adequacy proved in `V1_6`.

*Refuted.* “Words possess an indeterminate and variable power that manifests differently across ritual traditions.” (contradicted): The verse and commentary emphasize yata-saktitvam as determinate and fixed, not variable.

::: {.contested}
*Contested.* yata-saktitvam is difficult; read as yata- ('restrained, fixed') it yields the determinate or fixed power of words, which is how we render it, but the compound is awkward and the line resists a confident construal on the karika alone
:::


### 1.7

::: {.deva}
स्मृतयो बहुरूपाश्च दृष्टादृष्टप्रयोजनाः ।  
तमेवाश्रित्य लिङ्गेभ्यो वेदविद्भिः प्रकल्पिताः ॥ ७ ॥
:::

::: {.iast}
smṛtayo bahurūpāśca dṛṣṭādṛṣṭaprayojanāḥ |  
tamevāśritya liṅgebhyo vedavidbhiḥ prakalpitāḥ || 7 ||
:::

> The smrtis, various in form and having both seen and unseen purposes, were framed by those who know the Veda from indicatory marks, resting upon that alone.

*Gist.* The authority of the secondary literature is made derivative.

*Contract.* 6 entities · 4 axioms · 1 denials; adequacy proved in `V1_7`.

*Refuted.* “The smritis are authoritative texts composed independently, with both seen and unseen purposes.” (contradicted): Asserts independence (svatantra) for smritis, which the commentary explicitly denies.


### 1.8

::: {.deva}
तस्यार्थवादरूपाणि निश्रिताः स्वविकल्पजाः ।  
एकत्विनां द्वैतिनां च प्रवादा बहुधा मताः ॥ ८ ॥
:::

::: {.iast}
tasyārthavādarūpāṇi niśritāḥ svavikalpajāḥ |  
ekatvināṃ dvaitināṃ ca pravādā bahudhā matāḥ || 8 ||
:::

> Resting on its arthavada portions, the manifold doctrines of the monists and the dualists are held — arising from their own conceptual constructions.

*Gist.* Sharp, and slightly deflationary.

*Contract.* 5 entities · 4 axioms · 2 denials; adequacy proved in `V1_8`.

*Refuted.* “The monist and dualist doctrines rest on the injunctive commands of the Veda.” (contradicted): Misidentifies the foundation as vidhi (injunctive portions) when the verse explicitly states it is arthavada (non-injunctive explanatory material).


### 1.9

::: {.deva}
सत्या विशुद्धिस्तत्रोक्ता विद्यैवैकपदागमा ।  
युक्ता प्रणवरूपेण सर्ववादाविरोधिना ॥ ९ ॥
:::

::: {.iast}
satyā viśuddhistatroktā vidyaivaikapadāgamā |  
yuktā praṇavarūpeṇa sarvavādāvirodhinā || 9 ||
:::

> The true purification is declared to be there: knowledge alone, reached through the single syllable, joined with the form of the pranava, which contradicts no doctrine.

*Gist.* Against the multiplying constructions of 1.8, a single point of convergence: the pranava, Om.

*Contract.* 5 entities · 5 axioms · 1 denials; adequacy proved in `V1_9`.

*Refuted.* “Knowledge as a mental cognition is the path to purification through the sacred syllable Om.” (unlicensed): Demotes vidya from the absolute presented in the verse (true purification itself) to a mere cognition, losing the ontological identity.

::: {.contested}
*Contested.* vidya eva could be read either as 'knowledge alone' (excluding ritual action as a means) or more weakly as 'knowledge itself'; the first reading takes a definite stand in the knowledge-versus-action debate and may be reading later concerns into the verse
:::


### 1.10

::: {.deva}
विधातुस्तस्य लोकानामङ्गोपाङ्गनिबन्धनाः ।  
विद्याभेदाः प्रतायन्ते ज्ञानसंस्कारहेतवः ॥ १० ॥
:::

::: {.iast}
vidhātustasya lokānāmaṅgopāṅganibandhanāḥ |  
vidyābhedāḥ pratāyante jñānasaṃskārahetavaḥ || 10 ||
:::

> Of that ordainer of the worlds, the divisions of knowledge — bound up with the limbs and sub-limbs — are extended, being the causes of the refinement of understanding.

*Gist.* The vidya-bhedas are the branches of learning, structured around the angas and upangas, the auxiliary disciplines of the Veda: phonetics, metre, grammar, etymology, ritual, astronomy, and their subsidiaries.

*Contract.* 6 entities · 4 axioms · 1 denials; adequacy proved in `V1_10`.

*Refuted.* “The auxiliary disciplines are the primary divisions of knowledge causing the refinement of understanding.” (unlicensed): Confuses the auxiliary framework (angas/upangas) with the primary category of vidya-bhedas.

