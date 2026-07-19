# Appendix E · Sources and Further Reading

This appendix comes in two parts. The References list every work cited by author and date in the body of the book, with full bibliographic details drawn from the project's own reference file, receipt: `paper/refs.bib`. The Further reading section then offers guidance: what each source gives a reader, which chapters it deepens, and a handful of additional works and resources the project used that the body does not cite directly. The list is deliberately closed. Nothing is padded in for show, and nothing a reader cannot actually find has been included.

## References

AlphaProof team. 2025. "Olympiad-Level Formal Mathematical Reasoning with Reinforcement Learning." *Nature*.

"Autoformalization in the Era of Large Language Models: A Survey." 2025. arXiv:2505.23486.

Cardona, George. 1976. *Pāṇini: A Survey of Research*. The Hague: Mouton.

de Moura, Leonardo, and Sebastian Ullrich. 2021. "The Lean 4 Theorem Prover and Programming Language." In *Automated Deduction, CADE 28*, LNCS 12699, 625-635. Springer.

Gonthier, Georges. 2005. Machine-checked proof of the four-color theorem, carried out in the Coq proof assistant.

Gonthier, Georges, et al. 2013. Machine-checked proof of the Feit-Thompson odd-order theorem, carried out in the Coq proof assistant.

Google DeepMind. 2024. "AI Achieves Silver-Medal Standard Solving International Mathematical Olympiad Problems." Blog post, July 2024. deepmind.google.

Goyal, Pawan, Gérard Huet, Amba Kulkarni, Peter Scharf, and Ralph Bunker. 2012. "A Distributed Platform for Sanskrit Processing." In *Proceedings of COLING 2012*, 1011-1028.

Houben, Jan E. M. 2016. "Bhartṛhari." In *The Stanford Encyclopedia of Philosophy*, edited by Edward N. Zalta.

Ingalls, Daniel H. H. 1951. *Materials for the Study of Navya-Nyāya Logic*. Cambridge, MA: Harvard University Press.

Kiparsky, Paul. 2009. "On the Architecture of Pāṇini's Grammar." *Sanskrit Computational Linguistics*, LNCS 5402, 33-94.

Leroy, Xavier. 2009. "Formal Verification of a Realistic Compiler." *Communications of the ACM* 52 (7): 107-115.

Matilal, Bimal Krishna. 1968. *The Navya-Nyāya Doctrine of Negation*. Cambridge, MA: Harvard University Press.

Panday, Ekansh, and Sujata Ghosh. 2026. "Cubical Type Theoretic Navya-Nyāya." arXiv:2605.12548.

Pnueli, Amir, Michael Siegel, and Eli Singerman. 1998. "Translation Validation." In *Tools and Algorithms for the Construction and Analysis of Systems (TACAS)*, LNCS 1384, 151-166. Springer.

Reimers, Nils, and Iryna Gurevych. 2019. "Sentence-BERT: Sentence Embeddings Using Siamese BERT-Networks." In *Proceedings of the 2019 Conference on Empirical Methods in Natural Language Processing (EMNLP-IJCNLP)*, 3982-3992.

Sathish, Sharath. 2026a. "Pramana: Teaching Large Language Models Six-Phase Navya-Nyāya Epistemic Reasoning." arXiv:2604.04937.

Sathish, Sharath. 2026b. "Recognition-Gated Workspace Steering: Pratyabhijñā as an Engineering Specification for Language Model Control." Preprints.org. doi:10.20944/preprints202607.0895.v1.

Sathish, Sharath, Mominul Ahsan, and Majid Latifi. 2026. "Active Circuit Discovery: A Multi-Action POMDP Agent for Causal Feature Identification in Transformer Attribution Graphs." *Symmetry* 18 (6): 1043. doi:10.3390/sym18061043.

Scharf, Peter M. 2009. "Modeling Pāṇinian Grammar." *Sanskrit Computational Linguistics*, LNCS 5402, 95-126.

Subramania Iyer, K. A. 1965. *The Vākyapadīya of Bhartṛhari with the Vṛtti: Chapter I*. Poona: Deccan College.

Wu, Yuhuai, Albert Q. Jiang, Wenda Li, Markus N. Rabe, Charles Staats, Mateja Jamnik, and Christian Szegedy. 2022. "Autoformalization with Large Language Models." In *Advances in Neural Information Processing Systems* 35, 32353-32368.

Classical Sanskrit works are cited in the body by title alone, as is conventional: the Vākyapadīya (whose Book I text and Vṛtti this project takes from Subramania Iyer 1965), Pāṇini's Aṣṭādhyāyī, Patañjali's Mahābhāṣya, and Gaṅgeśa's Tattvacintāmaṇi.

## Further reading

### The primary text

**Subramania Iyer 1965** (see References). The edition and English translation of Book I with the Vṛtti that this entire project follows. Every contract in the edition inherits this single commentarial standpoint, a limit Chapter 23 states plainly, so a reader who wants to audit the edition at its root should start here. It deepens Chapters 4, 10, and 23.

**wisdomlib.org.** The public online edition from which the project's Devanagari mūla text of all 1,796 kārikās was drawn, receipt: `paper/paper.tex` §5 and the corpus provenance fields. Useful for checking any verse of all three books against an independent presentation, including the many Book II and III verses this edition has not yet formalized.

### Bhartṛhari and sphoṭa

**Harold G. Coward, *The Sphoṭa Theory of Language: A Philosophical Analysis* (Delhi: Motilal Banarsidass, 1980).** A patient book-length treatment of the sphoṭa doctrine as philosophy of language rather than curiosity. The natural companion to Chapter 17 and to the sphoṭa material in Chapter 4.

**Jan E. M. Houben, *The Saṃbandha-samuddeśa (Chapter on Relation) and Bhartṛhari's Philosophy of Language* (Groningen: Egbert Forsten, 1995).** A close study of Book III's chapter on relation, with a substantial account of Bhartṛhari's whole system. It shows what awaits formalization beyond Book I, and so deepens Chapters 24 and 25.

**Houben 2016** (see References). The best short scholarly orientation available, free online, with the dating and authorship debates handled responsibly. The right first stop after Chapter 4, and the source behind its pandit box on the vṛtti authorship question.

**Madeleine Biardeau, *Théorie de la connaissance et philosophie de la parole dans le brahmanisme classique* (Paris: Mouton, 1964).** The classic French study of knowledge and speech in classical Brahmanism, and one pole of the long scholarly argument about how to read Bhartṛhari's metaphysics. For readers of French who want the interpretive stakes of Chapter 4 at full depth.

**J. F. Staal, "Sanskrit Philosophy of Language," *Current Trends in Linguistics* 5 (1969): 499-531.** A compact survey by a scholar fluent in both logic and Indology, written with the comparative instincts this book borrows. Good background for Chapters 4 and 8 together.

### Pāṇini, formally and computationally

**Kiparsky 2009** (see References). The modern linguist's case for reading the Aṣṭādhyāyī as a precisely ordered formal system, including rule interaction and blocking. The scholarly backbone of Chapter 3.

**Cardona 1976** (see References). The standard map of two centuries of Pāṇinian scholarship. Not a first read, but the reference a reader consults when a claim in Chapter 3 provokes the question "who established that?"

**Scharf 2009** (see References). What it takes to implement Pāṇini's system computationally, by someone who has done it. It bridges Chapter 3's machine metaphor to real software.

**Goyal et al. 2012** (see References). The paper behind the Saṃsādhanī family of Sanskrit tools: segmenters, parsers, and analyzers that cooperate. It shows the computational Sanskrit ecosystem this project joins, background to Chapters 3 and 24.

**Oliver Hellwig and Sebastian Nehrdich, "Sanskrit Word Segmentation Using Character-Level Recurrent and Convolutional Neural Networks," in *Proceedings of EMNLP 2018*, 2754-2763.** The neural approach to undoing sandhi, the boundary problem Chapter 3 introduces. A concrete measure of what statistical methods achieve and where verified parsing, Chapter 24's proposal, would differ.

**Ambuda Project, *Vidyut: A High-Performance Sanskrit Toolkit* (2024), github.com/ambuda-org/vidyut.** An open-source, actively maintained toolkit for Sanskrit processing. The practical starting point for a reader who wants to build on Chapter 24's agenda today.

**SARIT Project, *SARIT: Search and Retrieval of Indic Texts* (2024), sarit.indology.info.** TEI-encoded electronic editions of Sanskrit texts, the philological infrastructure side of the field. Relevant to Chapter 2's story of how texts survive their carriers.

### Navya-Nyāya

**Ingalls 1951** (see References). The book that opened Navya-Nyāya's technical language to readers trained in Western logic. Chapter 8's mapping table descends from the tradition of analysis Ingalls began.

**Matilal 1968** (see References). The definitive study of typed absence, abhāva with its counterpositive and locus, which is exactly the structure the kernel implements. The direct source for Chapter 8's treatment of negation-with-evidence.

**Panday and Ghosh 2026** (see References). Independent contemporary work formalizing Navya-Nyāya in a richer type theory than this project uses. It deepens Chapter 6's horizon box and Chapter 8's honest note on what the six-sort kernel leaves out.

**Sathish 2026a** (see References). The author's earlier Pramana project bringing Navya-Nyāya's epistemic discipline to language models, named in Chapter 8 as prior art for treating the tradition as live engineering rather than museum piece.

**Stephen Diehl, "Four-Fold Logic with Lean" (2024), stephendiehl.com.** A short online formalization of the catuṣkoṭi in Lean, proof that classical Indian logical structures sit comfortably in a modern kernel. A quick, concrete companion to Chapters 7 and 8.

### Proof and verification

**de Moura and Ullrich 2021** (see References). The system description of the prover this book uses: small trusted kernel, fast elaboration, a programming language and a proof language in one. The reference behind Chapters 6 and 7.

**Pnueli, Siegel, and Singerman 1998** (see References). The origin of the idea Chapter 9 transplants: do not verify the translator, verify each translation. Read it and the architecture of this whole project becomes almost obvious.

**Leroy 2009** (see References). CompCert, the proof that a production-scale compiler can be verified end to end. It sets the standard of seriousness against which Chapter 9 measures the commentary-as-specification analogy.

**Jean-Baptiste Tristan and Xavier Leroy, "Formal Verification of Translation Validators: A Case Study on Instruction Scheduling Optimizations," in *Proceedings of the 35th ACM SIGPLAN-SIGACT Symposium on Principles of Programming Languages (POPL)*, 2008, 17-27.** The next turn of the screw: verifying the validators themselves. Relevant to Chapter 23's question of where trust finally bottoms out.

**Gonthier 2005 and Gonthier et al. 2013** (see References). The Coq formalizations of the four-color theorem and the Feit-Thompson odd-order theorem, the two landmarks Chapter 5 uses to show computation brought inside checked logic.

**Wu et al. 2022** (see References). The landmark study of models translating informal mathematics into formal statements, with its error modes. Chapter 11's draft-and-gate architecture is a response to exactly the failures this line of work documents.

**Shashank Pathak, "GFLean: An Autoformalisation Framework for Lean via GF," arXiv:2404.01234 (2024).** A grammar-based route from controlled natural language into Lean. A useful contrast to this project's contract route, and background to Chapter 24's dream of elaboration from Sanskrit itself.

**Google DeepMind 2024** (see References). The announcement that AlphaProof, writing machine-checked proofs in Lean, reached silver-medal standard on the 2024 IMO, solving four of six problems. The clearest public demonstration of the propose-and-verify architecture Chapters 6 and 7 place this book inside.

**AlphaProof team 2025** (see References). The full scientific account behind the announcement: how a reinforcement-trained proposer and the Lean checker divide the labor. The technical companion to Chapter 6's closing section on models that propose and kernels that dispose.

**"Autoformalization in the Era of Large Language Models: A Survey" 2025** (see References). A map of the field Wu and colleagues named in 2022, now grown wide enough to need one. Useful for placing Chapter 11's draft-and-gate pipeline among its contemporaries.

**Reimers and Gurevych 2019** (see References). The sentence-embedding method behind Chapter 23's audit instrument, the one honestly demoted to a review queue.

### The companion programmes

**Sathish, Ahsan, and Latifi 2026** (see References). The first companion programme, Active Circuit Discovery: an agent that proposes causal hypotheses about model internals and has them judged by registered gates. Chapter 11 names it as the lineage of the propose-gate-ledger loop used here.

**Sathish 2026b** (see References). The Prabodha preprint, the second companion programme, which turns a Śaiva recognition doctrine into a control specification the same way this book turns commentary into contracts. It deepens Chapters 11 and 24.

### This project

**The repository: github.com/SharathSPhD/vakya-vallari.** The corpus, the contracts, the Lean kernel and verse modules, the tests, and the append-only ledger, everything Appendix A teaches you to run. The primary artifact of which this book is the narrative.

**The paper.** The technical companion to this book lives in the repository under `paper/`, with the full apparatus of citations, tables, and audit results that the chapters reference by section number.

**The living edition.** The project site is at vakya-vallari.vercel.app, and the edition itself, every verse page and every proof page, is served from the Hugging Face space at huggingface.co/spaces/qbz506/vakya-vallari. Chapter 25 explains how to read a proof page; the site is where you go and do it.
