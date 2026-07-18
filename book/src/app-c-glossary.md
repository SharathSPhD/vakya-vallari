# Appendix C · Glossary

Sanskrit appears in IAST throughout, and the chapter where each term does its work is usually named in its gloss. Fuller senses of the polysemous terms, with their verse partitions, live in the homonym registry (data/ontology/homonyms.json).

## Sanskrit terms

**abhāva**. Typed absence: a negation carrying its structure, the counterpositive (pratiyogin) that is absent and the locus (adhikaraṇa) where it is absent. Two absences with different counterpositives are two different objects, so this negation never forgets what it negates or where.

**adhikaraṇa**. The locus: the substrate that hosts an absence, and in Pāṇini's grammar the locational kāraka, the site of an action. The logicians borrow the grammarians' word.

**akṣara**. A word facing two ways at once: "imperishable" and "syllable, phoneme." The pun carries the opening verse's doctrine, since for a śabdādvaitin the ultimate's word-nature lives in one word meaning both.

**anuvṛtti**. Continuation: the carrying of a word or heading from an earlier sūtra into later ones that do not repeat it, so a rule operates inside a scope it never restates.

**apavāda**. An exception rule, the special case that overrides the general rule (utsarga) wherever both would apply. The narrower rule wins.

**avacchedaka**. The delimitor: the item that pins down under which aspect or region a property qualifies its bearer. It works as a type index, so a claim that omits it is not yet meaningful rather than merely false.

**dhvani**. The audible sound, the serial acoustic event that reaches the ear, distinguished from the sphoṭa, the meaning-bearing word-whole it releases.

**kāraka**. One of the six semantic roles Pāṇini assigns to an action's participants: agent, object, instrument, recipient, source, and locus. They are relations between the action and its arguments.

**kārikā**. A verse of the root text, one metrical unit of the Vākyapadīya and the object a contract is written about.

**mūla**. The root text: the primary verses themselves, as against the commentary that expounds them. Each verse card's Devanagari mūla is drawn verbatim from the corpus.

**paramparā**. The transmission lineage, the unbroken succession from teacher to student. The same word names the device paramparā-sambandha, a relation holding not directly but through a spelled-out chain of further relations.

**paribhāṣā**. A metarule: a rule about how to read and apply other rules, configuring the machine without rewriting a word itself. Its modern counterpart is a proof assistant's tactic, which steers the kernel but cannot add an axiom.

**pariṇāma**. Real transformation, in which a substance genuinely becomes its effect and is changed by it. The commentary on 1.1 rules it out in favor of vivarta.

**paśyantī**. The innermost level of speech, "the seeing": speech before sequence, intention not yet unrolled into order. It lies within madhyamā (inner sequenced thought) and vaikharī (outward sound).

**pāṭha**. A recitation of the fixed text. The tradition rehearses several: the continuous saṃhitā, the word-isolated pada, and the permutation forms krama, jaṭā, and ghana, each rehearsing the junctions so one memory checks another.

**pratyāhāra**. Pāṇini's abbreviation for a range of phonemes: a two-character code, one real sound plus one marker, naming every sound from the first up to the marker. It lets a rule name a slice of the sound inventory instead of listing it.

**śabda**. Word or language, the corpus's most frequent term; usually a linguistic item that grammar declines and conjugates, but in the sphoṭa verses the inner word before utterance, and at its height the word-Absolute itself.

**śābdabodha**. Verbal cognition: the structured awareness a sentence produces in a hearer, analyzed word by word into a tree of meanings tied by grammatical relations. It is a fully specified compositional semantics.

**śabdādvaita**. The word-Absolute thesis: that ultimate reality is not merely describable by language but is language, so that Brahman and the word-essence are one.

**śabdatattva**. The word-essence: the word taken as the ultimate principle, sorted absolute and identified with Brahman in the contract of 1.1.

**sandhi**. The euphonic sound change at word and morpheme boundaries, where adjacent sounds fuse or assimilate, as vāk plus īśa becomes vāgīśa. Applying it forward is near-deterministic; undoing it to recover word boundaries is genuinely ambiguous.

**smṛti**. Remembered tradition: the derived, re-composable texts framed by those who know the Veda, as against śruti. In the book's storage analogy it is the versioned, rewritable layer.

**sphoṭa**. The meaning-bearing word-whole: the partless universal that resides in the intellect and manifests through utterance, distinct from the serial dhvani that carries it. It is Bhartṛhari's signature concept.

**śruti**. Revealed, heard scripture, the received canon transmitted with full error correction; at its height, revelation as beginningless and authorless. The read-only master record, as against smṛti.

**sūtra**. An aphoristic rule compressed to the fewest possible syllables, as in Pāṇini's grammar. Sūtras state facts; paribhāṣās govern how they apply.

**ṭīkā**. A sub-commentary: a commentary on a commentary, which argues about what the earlier gloss settled.

**utsarga**. The general rule, the default that holds wherever no exception (apavāda) displaces it.

**vaikharī**. The outermost level of speech, "the elaborated": audible, fully sequenced articulate sound, the level at which dhvani lives.

**vākya**. The sentence, the unit of complete utterance above the word and the phoneme. For Bhartṛhari the sentence, not the word, can be the true indivisible bearer of meaning.

**vallarī**. A vine or creeper, and the edition's namesake; Part IV, the verse walk, is titled "The Vine."

**vidhi**. An operational rule, one that actually rewrites a form, as against a heading or a metarule. Pāṇini's substitution rules are vidhis.

**vivarta**. Appearance without transformation: the one presenting itself as many while remaining undivided. The contract of 1.1 asserts vivarta and denies pariṇāma.

**vṛtti**. The commentary: the prose exposition that fixes, defends, and transmits a verse's reading. It is the semantic reference of this edition, since the bare verse under-determines itself.

**vyākaraṇa**. Grammar as a discipline: both the science of correct language grounded in textual rules and, for Bhartṛhari, a transformative power that opens onto the Absolute. The homonym registry records both senses.

## Formal terms

**adequacy**. The property that a reading satisfies its contract: every claim it makes is entailed by the contract's axioms and no claim it makes is denied. Each adequacy theorem proves exactly this.

**axiom**. A positive claim the commentary asserts, admitted into a contract only when licensed by a verbatim commentary citation. Axioms come in three kinds: identity, relation, and predication.

**contract**. The per-verse semantic contract: one JSON file compiling the commentary into sorted entities, cited axioms, denials, an accepted reading, and pre-registered rejected readings. It is the specification a translation must meet.

**decidability / decide**. The guarantee that a check is settled by a terminating computation rather than by search or cleverness. The kernel decides adequacy and every refutation by running a procedure, so proof here means proof by computation.

**denial**. A claim the commentary explicitly rules out, recorded as a first-class object with its rejecting sentence attached. A reading that asserts a denied claim is contradicted.

**dependent type**. A type that may mention a value, not just other types. Dependency is what lets "this reading is adequate to this contract" be a type at all.

**elaboration**. The front-end step that turns what a human wrote into the fully explicit core term the kernel checks. Here the drafting of contract claims from commentary sentences plays that role, the modern counterpart of śābdabodha.

**entailment**. Deliberately shallow in this project: not full logical consequence but membership-like closure, the contract's literal claims taken together with the symmetry of identity. A reading's claim is entailed when it falls under that closure, and nothing deeper is asserted.

**gate**. A mechanical pass-or-fail check with no partial credit: the schema validator, the verbatim-citation matcher, the consistency check, the proof build. Agents propose; gates dispose.

**inductive type**. A type built from named constructors, its values assembled and taken apart by cases. The kernel's Node and Abhava are inductive types.

**kernel**. The small trusted checker at the base of the system, simple enough to audit, on whose correctness everything rests; also this project's own kernel, the roughly 150-line Lean ontology and adequacy core.

**ledger**. The append-only event record of the formalization loop: one JSON object per line for every draft, gate verdict, rejection, repair, and acceptance, in order. The book keeps its own ledger in the same grammar.

**refutation theorem**. A theorem that a rejected reading fails, in one of exactly two registered modes. A reading is **contradicted** when it asserts something the contract denies, and **unlicensed** when it asserts something no axiom entails; the mode is pre-committed, and a reading that fails the wrong way is itself a build error.

**sort**. One of the six ontological categories every entity carries: absolute, power, manifestation, linguisticItem, property, cognition. Sorts are the edition's coarse type system, and a cross-sort identity is decidably false.

**sorry**. Lean's placeholder that asks the kernel to take a claim on faith without proof. This project forbids it: continuous integration greps the sources and fails if sorry or admit appears, so a green badge means free of placeholders, not merely compiled.

**theorem**. A statement the kernel has certified by checking a proof term. Each verse compiles into theorems: the accepted reading adequate, each rival refuted in its mode.

**translation validation / C-TV**. Pnueli's method of leaving the translator untrusted and checking each translation after the fact against a semantic reference. Commentary-driven translation validation (C-TV) is this book's variant, where the reference is the commentary compiled into a contract, not the source verse.

**type checking**. The kernel's act of verifying that a term has the type it claims, which under propositions-as-types is the act of verifying a proof.

**verbatim citation rule**. The gate requiring that every axiom, denial, and entity carry a citation occurring word for word in the commentary, and every accepted-reading claim a citation occurring word for word in the translation, checked by exact string match. It turns fabricated support into a failed match.
