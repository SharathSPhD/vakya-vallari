# 16 · The Limits of Inference

*Verses 1.32 to 1.43 · 12 units*

The previous movement ended on a promise it had not yet kept. It claimed that reasoning cannot overturn what tradition secures, and that even the seers' knowledge rests on tradition rather than inference (1.30, 1.31). But it did not say why inference is so weak. This movement is the account. Verses 1.32 to 1.43 are a sustained critique of anumāna, inference, and they build toward a single conclusion: the word of those who see directly is not overturned by those who merely reason.

The critique advances by mounting pressure. It begins with the strongest available premise: the powers of things are differentiated by state, place, and time, so establishing them by inference from finite observation is exceedingly hard (1.32). Then comes defeasibility: even a well-known power is blocked when the thing enters into connection with some particular substance, so no inference from power to effect is safe (1.33). Then the most damaging pressure, and the most famous verse in the kāṇḍa: a matter inferred with great effort by skilled reasoners is established quite otherwise by others of still greater skill (1.34). Greater expertise does not converge on truth; it produces contrary conclusions. From there the text turns positive. It points to knowledge that is not inferential at all: the connoisseur's grasp of gems, learned by practice and impossible to convey (1.35); the attainments of beings that stand beyond both perception and inference (1.36); and the direct knowledge of past and future had by those whose inner light has come forth, which is not a refined inference but is not different from perception (1.37). The conclusion joins back to the previous chapter: the seer's word is not overturned by inference (1.38), and the tradition that runs unbroken like consciousness itself cannot be argued away by one who abides in it (1.41).

Readers arriving from the eternal word-meaning bond hold a doctrine of authority without its epistemology. What this movement adds is the epistemology. It explains why āgama outranks tarka, not by fiat but by showing inference to be structurally unreliable: defeasible, reversible, and terminating in no expertise that guarantees its result. The movement settles the standing of the seers' testimony and then, at its close, gathers the whole arc. Therefore, 1.43 says, it is by resting on the uncreated teaching and the grounded tradition that the cultivated undertake the regulation of words. That tasmāt reaches back to 1.27 and closes the long argument about correctness. It also clears the ground. With inference put in its place, the text is free to turn inward, to the word itself, which is where the next chapter begins.

A few cards reward a slow read. Slow down at 1.34, because its claim is precise and easy to overstate: inference is aniyata, undetermined by expertise, which is not the same as invalid. Slow down at 1.35, philosophically the quietest and most interesting verse here, because it locates a whole class of real knowledge, the expert's, that is neither inferential nor teachable, and the commentary presses the point that the connoisseur cannot even state the mark he reasons from. Slow down at 1.37, because it is the positive claim the whole critique has been building toward, that seer-knowledge is not inference at all but stands on the side of perception. And slow down at 1.42, the polemic compressed into one image, the blind man running on rough ground, because the same verse that mocks the man who relies chiefly on inference also insists that touch is a genuine means of knowledge, as inference is.

In the cards, watch a two-sided failure mode, because this movement is easier to misread than any so far. The text walks a narrow line, and the rejected readings fall off both sides. On one side, a reading grants inference too much: greater expertise yields reliable conclusions (1.34), the connoisseur reasons from marks (1.35), seer-knowledge is an especially refined inference (1.37). These come back contradicted, because the commentary denies them outright. On the other side, a reading grants inference too little: because it is fallible it has no validity and should be abandoned entirely (1.34), inference is no means of knowledge at all (1.42). These come back unlicensed, because the text never says inference is invalid, only that it is undetermined. The registry term to hold in view is anumāna itself, set against pratyakṣa and āgama. The verdicts trace the exact width of the road: inference is a real pramāṇa, a genuine means of knowledge, but not one that terminates in certainty, and both the over-trusting and the over-dismissive reading miss it.

This stretch carries no contested boxes. The kārikās are polemical and direct, and the edition found little to flag. The interpretive pressure sits entirely in the verdicts, where the balance between contradicted and unlicensed marks the difference between saying too much for inference and saying too little.

One last orientation note. The featured verse of this chapter is 1.34, the verse about the reasoner outdone by the better reasoner. The walkthrough that follows shows how the contract encodes inference's dependence on the word as a relation with the same sort on both ends, and how a single denial, that anumāna is a pramāṇa of truth, does the refuting. The cards follow. With inference bounded, the text turns to the word, and to the doctrine at the heart of the whole work.

## Featured verse: 1.34 in slow motion

The section's argument climaxes in a verse about inference's dependence on the word. The rejected reading grants reasoning an autonomy the text denies. The contract encodes the dependence as a relation with the cognition sort on both ends, and the refutation is a sort-checked failure of license.

**Axioms, each with its verbatim license.**

- predication `aniyata(anumana)`: “careful inferences are routinely reversed by more careful ones”
- relation `apavada(anumana → anumiti)`: “overturn the result and demonstrate the opposite”
- predication `no_terminal_expertise(anumana)`: “there is no level of expertise at which the regress terminates”

**Denials.**

- `pramana(anumana → satya)`: “the mere carefulness of an inference is no guarantee of its truth”

**Rejected readings and their compiled fates.**

- “Greater expertise in reasoning produces reliable, stable conclusions about matters.” → **contradicted**. Claims that increased expertise guarantees reliability, contradicting the denial that anumāna is a pramāṇa of satya. The verse shows that greater expertise produces contrary conclusions, not convergence.
- “Because inference is unreliable and subject to reversal, it has no epistemic validity whatsoever and should be abandoned entirely.” → **unlicensed**. Over-interprets fallibilism into complete invalidity. The verse shows anumāna is aniyata (undetermined by expertise), not that it is invalid or avidyā. The point is regress without terminal guarantee, not total rejection of inference.

**Theorems in `V1_34.lean`.** `accepted_adequate`, `expertise_guarantees_truth_inadequate`, `inference_completely_invalid_inadequate`. All close by `decide`; the build carries zero `sorry`.


## The verses

### 1.32

::: {.deva}
अवस्थादेशकालानां भेदाद् भिन्नासु शक्तिषु ।  
भावानामनुमानेन प्रसिद्धिरतिदुर्लभा ॥ ३२ ॥
:::

::: {.iast}
avasthādeśakālānāṃ bhedād bhinnāsu śaktiṣu |  
bhāvānāmanumānena prasiddhiratidurlabhā || 32 ||
:::

> Since the powers of things are differentiated by differences of state, place and time, the establishing of them by inference is exceedingly hard to attain.

The opening of a sustained critique of anumāna, and it begins with the strongest available premise. Inference from observed cases requires that the power at work in the observed case be the power at work in the unobserved one. But śakti, Bhartṛhari says, varies with avastha, desa and kala, with the condition of the thing, where it is, and when. If the causal powers of things are indexed to circumstances, then no finite survey of circumstances licenses a general conclusion, and prasiddhi by inference becomes ati-durlabha: not impossible, but exceedingly hard to come by. The force of the argument is that it does not need scepticism about the external world or about perception. It grants that things have powers and that we observe them, and locates the failure precisely at the inductive step. The next two verses will press the point from two different directions.

*Contract.* 6 entities · 4 axioms · 0 denials; adequacy proved in `V1_32`.

*Refuted.* “The powers of things remain constant across all variations in state, place, and time, making them fully establishable by inference from finite observation.” (unlicensed): Denies the core differentiation thesis.


### 1.33

::: {.deva}
निर्झतशक्तेर्द्रव्यस्य तां तामर्थक्रियां प्रति ।  
विशिष्टद्रव्यसंबन्धे सा शक्तिः प्रतिबध्यते ॥ ३३ ॥
:::

::: {.iast}
nirjhataśakterdravyasya tāṃ tāmarthakriyāṃ prati |  
viśiṣṭadravyasaṃbandhe sā śaktiḥ pratibadhyate || 33 ||
:::

> Even in the case of a substance whose power toward this or that effect is well known, that power is blocked when it enters into connection with some particular substance.

The first pressure: defeasibility. It is not merely that we may be ignorant of a thing's power; it is that a power we know perfectly well can be pratibadhyate, obstructed, by the presence of something else. Fire burns, this is as well established as anything, and yet the standard examples of the tradition are gems and mantras that stop it burning. The point is structural rather than anecdotal. If any known causal power can be defeated by an unsurveyed viseṣa, a particular, then the inference from 'x has the power to produce y' to 'x will produce y here' is never secure, because securing it would require knowing that no defeater is present, and that is not something inference can deliver. Arthakriya, effective action, is the same term the Buddhist epistemologists make central to their account of the real, which sharpens the irony: the criterion of reality is exactly what turns out not to be reliably inferable.

*Contract.* 4 entities · 3 axioms · 1 denials; adequacy proved in `V1_33`.

*Refuted.* “A well-known power of a substance will reliably produce its effect.” (contradicted): The verse's central thesis is defeasibility: powers can be defeated by unseen particulars, making reliable inference from power to effect impossible.


### 1.34

::: {.deva}
यत्नेनानुमितोऽप्यर्थः कुशलैरनुमातृभिः ।  
अभियुक्ततरैरन्यैरन्यथैवोपपाद्यते ॥ ३४ ॥
:::

::: {.iast}
yatnenānumito'pyarthaḥ kuśalairanumātṛbhiḥ |  
abhiyuktatarairanyairanyathaivopapādyate || 34 ||
:::

> Even a matter inferred with great effort by skilled reasoners is established quite otherwise by others of still greater skill.

The most famous verse in the kanda, and the second and more damaging pressure. The previous verses argued that inference is hard because the world is complicated. This one argues that inference is unreliable because of something about inference itself. Take the best case available, kusala anumatr, skilled reasoners, proceeding yatnena, with effort, and it remains true that abhiyuktatara, those more expert still, overturn the result and demonstrate the opposite. The argument is a pessimistic induction on the history of reasoning: since the record shows that careful inferences are routinely reversed by more careful ones, the mere carefulness of an inference is no guarantee of its truth. What makes the verse bite is that there is no obvious reply. Adding more skill does not help, since the point is precisely that more skill is what overturns the previous result; there is no level of expertise at which the regress terminates. Bhartṛhari deploys this to clear ground for āgama, but the argument is detachable from that use and has been read on its own ever since.

*Contract.* 4 entities · 3 axioms · 1 denials; adequacy proved in `V1_34`.

*Refuted.* “Greater expertise in reasoning produces reliable, stable conclusions about matters.” (contradicted): Claims that increased expertise guarantees reliability, contradicting the denial that anumāna is a pramāṇa of satya.


### 1.35

::: {.deva}
परेषामसमाख्येयमभ्यासादेव जायते ।  
मणिरूप्यादिविज्ञानं तद्विदां नानुमानिकम् ॥ ३५ ॥
:::

::: {.iast}
pareṣāmasamākhyeyamabhyāsādeva jāyate |  
maṇirūpyādivijñānaṃ tadvidāṃ nānumānikam || 35 ||
:::

> The knowledge of gems, silver and such that experts possess arises from practice alone; it cannot be conveyed to others, and it is not inferential.

A quieter verse, and philosophically one of the most interesting in the work. The jeweller knows the stone is genuine. He did not infer it, asked for the linga, the mark from which he reasoned, he cannot produce one; asamakhyeyam, it cannot be told to others. The knowledge came from abhyāsa, sheer repeated practice, and it is reliable. Bhartṛhari's use of the example is local: he wants a wedge against the claim that anumāna exhausts non-perceptual knowledge, and connoisseurship supplies one, since here is knowledge that is neither perception nor inference nor testimony. But the observation reaches further than the use he puts it to. What he has described is tacit knowledge, competence that outruns the agent's ability to articulate its grounds, and the description is exact. The verse also sets up 1.36-38: once it is granted that reliable knowledge need not be inferential or communicable, the seer's vision becomes harder to dismiss on the ground that he cannot show his reasoning.

*Contract.* 5 entities · 3 axioms · 2 denials; adequacy proved in `V1_35`.

*Refuted.* “The connoisseur's knowledge of gems is derived from inference based on marks or signs.” (contradicted): Claims the knowledge is inferential (anumanikat), which the verse explicitly denies and the commentary emphasizes by noting the connoisseur cannot articulate the inferential mark (linga).


### 1.36

::: {.deva}
प्रत्यक्षमनुमानं च व्यतिक्रम्य व्यवस्थिताः ।  
पितृरक्षःपिशाचानां कर्मजा एव सिद्धयः ॥ ३६ ॥
:::

::: {.iast}
pratyakṣamanumānaṃ ca vyatikramya vyavasthitāḥ |  
pitṛrakṣaḥpiśācānāṃ karmajā eva siddhayaḥ || 36 ||
:::

> The attainments of the ancestors, the raksases and the pisacas, standing beyond both perception and inference, are born of karma alone.

The wedge from 1.35 is widened by an appeal to what the tradition takes to exist. The siddhis of these beings are karmaja, born of karma, and they lie outside the reach of both pramāṇas that a critic would accept. Whether the modern reader grants the premise is beside the point of the argument's structure: Bhartṛhari is establishing that his opponents' own commitments already include cases where perception and inference are jointly insufficient, so a principle restricting knowledge to those two is not one his interlocutors can consistently hold. The move is dialectical, and it is worth being clear that it is doing no independent work for a reader who does not share the commitment.

*Contract.* 4 entities · 3 axioms · 2 denials; adequacy proved in `V1_36`.

*Refuted.* “The attainments of ancestors, raksasas and pisacas can be directly perceived.” (contradicted): Violates the explicit claim that siddhis stand beyond (vyatikramya) perception.


### 1.37

::: {.deva}
आविर्भूतप्रकाशानामनुपप्लुतचेतसाम् ।  
अतीतानागतज्ञानं प्रत्यक्षान्न विशिष्यते ॥ ३७ ॥
:::

::: {.iast}
āvirbhūtaprakāśānāmanupaplutacetasām |  
atītānāgatajñānaṃ pratyakṣānna viśiṣyate || 37 ||
:::

> For those whose inner light has come forth, whose minds are unclouded, knowledge of the past and the future is not different from perception.

The positive claim toward which the whole critique has been building. Two conditions are named: avirbhuta-prakasa, an inner light that has become manifest, and anupapluta-cetas, a mind not flooded or disturbed. Where they are met, knowledge of atita and anagata, what is gone and what has not yet come, is pratyaksat na visisyate, not distinguishable from perception. The claim is not that such knowledge is a superior inference. It is that it is not inference at all; it has perception's immediacy, and therefore inherits perception's freedom from the defeat 1.34 visited on reasoning. Structurally this is why the preceding critique had to come first. Having shown that inference cannot secure its conclusions, and that non-inferential expert knowledge exists (1.35), Bhartṛhari can present yogic cognition as an extension of a category already conceded rather than as a special pleading.

*Contract.* 6 entities · 5 axioms · 1 denials; adequacy proved in `V1_37`.

*Refuted.* “Knowledge of the past and future is a form of especially refined or powerful inference.” (contradicted): The commentary explicitly states 'it is that it is NOT inference at all'.


### 1.38

::: {.deva}
अतीन्द्रियानसंवेद्यान् पश्यन्त्यार्षेण चक्षुषा ।  
ये भावान् वचनं तेषां नानुमानेन बाध्यते ॥ ३८ ॥
:::

::: {.iast}
atīndriyānasaṃvedyān paśyantyārṣeṇa cakṣuṣā |  
ye bhāvān vacanaṃ teṣāṃ nānumānena bādhyate || 38 ||
:::

> Those who see, with the seer's eye, things that lie beyond the senses and cannot be felt, their word is not overturned by inference.

The conclusion, and the join back to 1.30. If the rsis' knowledge is perceptual in character (1.37), and inference is defeasible in the way 1.34 showed, then vacana, their word, the āgama, cannot be arraigned by tarka: the weaker instrument does not get to overrule the stronger. This completes the argument that 1.30 and 1.31 asserted without proof, and it does so without ever claiming that reasoning is worthless. The claim throughout has been comparative. Inference is a real pramāṇa; it is simply not one that can stand against direct seeing, and the domain of dharma is exactly where direct seeing is available to some and inference to all. Whether the argument succeeds depends on a step it does not defend, that we can identify who the arsa-caksus belong to, and that gap is where its critics have always gone.

*Contract.* 8 entities · 7 axioms · 2 denials; adequacy proved in `V1_38`.

*Refuted.* “The inference of ordinary reasoners can overturn the testimony of the seers.” (contradicted): Directly contradicts the verse's core claim that the rsis' word cannot be overturned by inference.


### 1.39

::: {.deva}
यो यस्य स्वमिव ज्ञानं दर्शनं नातिशङ्कते ।  
स्थितं प्रत्यक्षपक्षे तं कथमन्यो निवर्तयेत् ॥ ३९ ॥
:::

::: {.iast}
yo yasya svamiva jñānaṃ darśanaṃ nātiśaṅkate |  
sthitaṃ pratyakṣapakṣe taṃ kathamanyo nivartayet || 39 ||
:::

> When someone does not doubt a cognition, a seeing that is, as it were, his own possession, and it stands on the side of perception, how could another turn him back from it?

A phenomenological coda to the epistemology. The jeweller of 1.35 and the seer of 1.37 share a mark: their cognition arrives with the self-evidence of perception, svam iva, like one's own property, and na atisankate, without residual doubt. Bhartṛhari's question, katham anyah nivartayet, how could another dislodge it?, is not rhetorical bluster; it records something true about the architecture of conviction. Argument gets its grip only where doubt has a foothold, and a cognition that presents itself perceptually offers none. The verse thereby also quietly marks the limit of the whole preceding polemic: if the opponent's conviction is likewise perception-shaped, no argument of Bhartṛhari's will move him either. The appeal to what stands pratyakṣa-pakse, on perception's side, cuts in every direction.

*Contract.* 5 entities · 4 axioms · 2 denials; adequacy proved in `V1_39`.

*Refuted.* “Rational argument has the power to overturn any cognition, whether it is grounded in perception or not.” (contradicted): Contradicts the core epistemological claim: argument only has grip where doubt already exists.


### 1.40

::: {.deva}
इदं पुण्यमिदं पापमित्येतस्मिन् पदद्वये ।  
आचण्डालं मनुष्याणामल्पं शास्त्रप्रयोजनम् ॥ ४० ॥
:::

::: {.iast}
idaṃ puṇyamidaṃ pāpamityetasmin padadvaye |  
ācaṇḍālaṃ manuṣyāṇāmalpaṃ śāstraprayojanam || 40 ||
:::

> 'This is merit, this is sin', in this pair of terms, for men down to the candala, the need for the treatise is small.

A concession that reframes what śāstra is for. Everyone, acandalam, down to the outcaste, the expression marking the widest possible social range, already commands the pair punya and papa. Ordinary moral competence does not wait upon learning, and the treatise's prayojana there is alpa, slight. The verse prevents an overreading of 1.30-31: the dependence of dharma on āgama does not mean the unlettered are morally blind, since tradition circulates in common life and not only in texts. What the śāstra adds is precision at the margins, the hard cases, the exact forms, not the basic orientation, which is already universally distributed. The realism here about how little explicit doctrine ordinary practice requires is of a piece with 1.35's realism about how little explicit reasoning expert knowledge requires.

*Contract.* 6 entities · 3 axioms · 1 denials; adequacy proved in `V1_40`.

*Refuted.* “The treatise is essential for understanding the moral distinction between merit and sin.” (unlicensed): Asserts that śāstra is necessary for basic moral knowledge, contradicting the verse's claim that all people already know punya and papa without formal instruction.


### 1.41

::: {.deva}
चैतन्यमिव यश्चायमविच्छेदेन वर्तते ।  
आगमस्तमुपासीनो हेतुवादैर्न बाध्यते ॥ ४१ ॥
:::

::: {.iast}
caitanyamiva yaścāyamavicchedena vartate |  
āgamastamupāsīno hetuvādairna bādhyate || 41 ||
:::

> And this tradition, which persists without interruption like consciousness itself, cannot be overturned by argumentation for the one who abides in it.

The strongest statement of the āgama doctrine, made through its boldest simile. Tradition persists avicchedena, without break, caitanyam iva, the way consciousness does. The comparison is exact on two points. Consciousness has no observable first moment, and neither has the tradition (1.28's vyavastha-nityata); and consciousness is not the kind of thing one argues someone out of, since every argument presupposes it. The simile thus imports transcendental status: āgama is presented not as a body of claims that might be true or false but as a standing condition of the upasina, the one who dwells in it. Hetuvada, reasoned refutation, arrives inside that condition and so cannot get behind it. The move is powerful and question-begging in equal measure, to one not already dwelling in the tradition, the analogy with consciousness is exactly what needs showing.

*Contract.* 4 entities · 3 axioms · 1 denials; adequacy proved in `V1_41`.

*Refuted.* “This conventional teaching, which is transmitted without interruption, cannot be questioned by those who practice it.” (unlicensed): Demotes āgama from an absolute standing condition to a mere property or convention.


### 1.42

::: {.deva}
हस्तस्पर्शादिवान्धेन विषमे पथि धावता ।  
अनुमानप्रधानेन विनिपातो न दुर्लभः ॥ ४२ ॥
:::

::: {.iast}
hastasparśādivāndhena viṣame pathi dhāvatā |  
anumānapradhānena vinipāto na durlabhaḥ || 42 ||
:::

> Like a blind man running on rough ground, feeling his way by the touch of his hand, one who relies chiefly on inference does not find his fall hard to come by.

The polemic against anumāna compressed into one image, and the image is chosen with care. The blind man's hand does give him real information, touch is a genuine pramāṇa, as inference is, and on even ground, walking slowly, it suffices. The failure comes from the combination the verse specifies: visame pathi, on broken ground, and dhavata, running. Inference fails not because it delivers nothing but because it is local, serial and slow, while the terrain (1.32-33: powers indexed to circumstance, defeaters unsurveyed) is uneven and the reasoner in practice moves at speed. Vinipata, the headlong fall, is then na durlabha, 'not hard to obtain', the litotes doing dry work. The verse closes the epistemological digression; 1.43 draws the practical conclusion for grammar.

*Contract.* 7 entities · 6 axioms · 2 denials; adequacy proved in `V1_42`.

*Refuted.* “Inference is not a valid means of knowledge and should be completely rejected.” (unlicensed): The commentary explicitly states 'touch is a genuine pramāṇa, as inference is', establishing anumāna's legitimacy.


### 1.43

::: {.deva}
तस्मादकृतकं शास्त्रं स्मृतिं च सनिबन्धनाम् ।  
आश्रित्यारभ्यते शिष्टैः शब्दानामनुशासनम् ॥ ४३ ॥
:::

::: {.iast}
tasmādakṛtakaṃ śāstraṃ smṛtiṃ ca sanibandhanām |  
āśrityārabhyate śiṣṭaiḥ śabdānāmanuśāsanam || 43 ||
:::

> Therefore it is by resting on the uncreated teaching, and on the tradition with its grounds, that the cultivated undertake the regulation of words.

Tasmat gathers the whole arc since 1.27. Because correctness serves dharma and not mere communication (1.27), because dharma is not established or overturned by unaided reasoning (1.30-31, 1.42), the sistas' anusasana of words, the term echoes sabdanusasana, the traditional name of grammar itself, proceeds akrtakam sastram asritya, resting on a teaching that is not made. Sanibandhana, 'with its grounds' or 'bindings', concedes that the smṛti is not arbitrary: it has nibandhana, attachments to its source, the lingas of 1.7. The verse ends the kanda's first movement. The ground of the discipline is now laid, and with 1.44 the text turns abruptly from why grammar matters to what a word is, the sphoṭa doctrine, which is the reason the work is still read.

*Contract.* 3 entities · 3 axioms · 1 denials; adequacy proved in `V1_43`.

*Refuted.* “The cultivated decide the regulation of words by an arbitrary, self-justifying tradition without any transcendent grounding.” (contradicted): Misrepresents tradition as arbitrary and self-grounded, contradicting the commentary's explicit insistence that the smṛti is not arbitrary but grounded in nibandhana and attachments to its source.

