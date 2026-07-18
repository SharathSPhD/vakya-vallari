# Appendix E · Sources and Further Reading

This appendix lists every work the project stands on, grouped by the part of the book each group deepens, with a sentence or two on what a reader gets from each. The list is deliberately closed: these are the sources the paper cites and the editions the pipeline used, receipt: `paper/refs.bib`. Nothing is padded in for show, and nothing a reader cannot actually find has been included.

## The primary text

**K. A. Subramania Iyer, *The Vākyapadīya of Bhartṛhari with the Vṛtti: Chapter I* (Deccan College, Poona, 1965).** The edition and English translation of Book I with the Vṛtti that this entire project follows. Every contract in the edition inherits this single commentarial standpoint, a limit Chapter 23 states plainly, so a reader who wants to audit the edition at its root should start here. It deepens Chapters 4, 10, and 23.

**wisdomlib.org.** The public online edition from which the project's Devanagari mūla text of all 1,796 kārikās was drawn, receipt: `paper/paper.tex` §5 and the corpus provenance fields. Useful for checking any verse of all three books against an independent presentation, including the many Book II and III verses this edition has not yet formalized.

## Bhartṛhari and sphoṭa

**Harold G. Coward, *The Sphoṭa Theory of Language: A Philosophical Analysis* (1980).** A patient book-length treatment of the sphoṭa doctrine as philosophy of language rather than curiosity. The natural companion to Chapter 17 and to the sphoṭa material in Chapter 4.

**Jan E. M. Houben, *The Saṃbandha-samuddeśa (Chapter on Relation) and Bhartṛhari's Philosophy of Language* (1995).** A close study of Book III's chapter on relation, with a substantial account of Bhartṛhari's whole system. It shows what awaits formalization beyond Book I, and so deepens Chapters 24 and 25.

**Jan E. M. Houben, "Bhartṛhari," *The Stanford Encyclopedia of Philosophy* (2016).** The best short scholarly orientation available, free online, with the dating and authorship debates handled responsibly. The right first stop after Chapter 4, and the source behind its pandit box on the vṛtti authorship question.

**Madeleine Biardeau, *Théorie de la connaissance et philosophie de la parole dans le brahmanisme classique* (1964).** The classic French study of knowledge and speech in classical Brahmanism, and one pole of the long scholarly argument about how to read Bhartṛhari's metaphysics. For readers of French who want the interpretive stakes of Chapter 4 at full depth.

**J. F. Staal, "Sanskrit Philosophy of Language" (1969).** A compact survey by a scholar fluent in both logic and Indology, written with the comparative instincts this book borrows. Good background for Chapters 4 and 8 together.

## Pāṇini, formally and computationally

**Paul Kiparsky, "On the Architecture of Pāṇini's Grammar" (2009).** The modern linguist's case for reading the Aṣṭādhyāyī as a precisely ordered formal system, including rule interaction and blocking. The scholarly backbone of Chapter 3.

**George Cardona, *Pāṇini: A Survey of Research* (1976).** The standard map of two centuries of Pāṇinian scholarship. Not a first read, but the reference a reader consults when a claim in Chapter 3 provokes the question "who established that?"

**Peter M. Scharf, "Modeling Pāṇinian Grammar" (2009).** What it takes to implement Pāṇini's system computationally, by someone who has done it. It bridges Chapter 3's machine metaphor to real software.

**Pawan Goyal, Gérard Huet, Amba Kulkarni, Peter Scharf, and Ralph Bunker, "A Distributed Platform for Sanskrit Processing" (2012).** The paper behind the Saṃsādhanī family of Sanskrit tools: segmenters, parsers, and analyzers that cooperate. It shows the computational Sanskrit ecosystem this project joins, background to Chapters 3 and 24.

**Oliver Hellwig and Sebastian Nehrdich, "Sanskrit Word Segmentation Using Character-Level Recurrent and Convolutional Neural Networks" (2018).** The neural approach to undoing sandhi, the boundary problem Chapter 3 introduces. A concrete measure of what statistical methods achieve and where verified parsing, Chapter 24's proposal, would differ.

**Ambuda Project, *Vidyut: A High-Performance Sanskrit Toolkit* (2024).** An open-source, actively maintained toolkit for Sanskrit processing. The practical starting point for a reader who wants to build on Chapter 24's agenda today.

**SARIT Project, *SARIT: Search and Retrieval of Indic Texts* (2024).** TEI-encoded electronic editions of Sanskrit texts, the philological infrastructure side of the field. Relevant to Chapter 2's story of how texts survive their carriers.

## Navya-Nyāya

**Daniel H. H. Ingalls, *Materials for the Study of Navya-Nyāya Logic* (1951).** The book that opened Navya-Nyāya's technical language to readers trained in Western logic. Chapter 8's mapping table descends from the tradition of analysis Ingalls began.

**Bimal Krishna Matilal, *The Navya-Nyāya Doctrine of Negation* (1968).** The definitive study of typed absence, abhāva with its counterpositive and locus, which is exactly the structure the kernel implements. The direct source for Chapter 8's treatment of negation-with-evidence.

**Ekansh Panday and Sujata Ghosh, "Cubical Type Theoretic Navya-Nyāya" (2026).** Independent contemporary work formalizing Navya-Nyāya in a richer type theory than this project uses. It deepens Chapter 6's horizon box and Chapter 8's honest note on what the six-sort kernel leaves out.

**Sharath Sathish, "Pramana: Teaching Large Language Models Six-Phase Navya-Nyāya Epistemic Reasoning" (2026).** The author's earlier project bringing Navya-Nyāya's epistemic discipline to language models, named in Chapter 8 as prior art for treating the tradition as live engineering rather than museum piece.

**Stephen Diehl, "Four-Fold Logic with Lean" (2024).** A short online formalization of the catuṣkoṭi in Lean, proof that classical Indian logical structures sit comfortably in a modern kernel. A quick, concrete companion to Chapters 7 and 8.

## Proof and verification

**Leonardo de Moura and Sebastian Ullrich, "The Lean 4 Theorem Prover and Programming Language" (2021).** The system description of the prover this book uses: small trusted kernel, fast elaboration, a programming language and a proof language in one. The reference behind Chapters 6 and 7.

**Amir Pnueli, Michael Siegel, and Eli Singerman, "Translation Validation" (1998).** The origin of the idea Chapter 9 transplants: do not verify the translator, verify each translation. Read it and the architecture of this whole project becomes almost obvious.

**Xavier Leroy, "Formal Verification of a Realistic Compiler" (2009).** CompCert, the proof that a production-scale compiler can be verified end to end. It sets the standard of seriousness against which Chapter 9 measures the commentary-as-specification analogy.

**Jean-Baptiste Tristan and Xavier Leroy, "Formal Verification of Translation Validators: A Case Study on Instruction Scheduling Optimizations" (2008).** The next turn of the screw: verifying the validators themselves. Relevant to Chapter 23's question of where trust finally bottoms out.

**Yuhuai Wu, Albert Q. Jiang, Wenda Li, Markus N. Rabe, Charles Staats, Mateja Jamnik, and Christian Szegedy, "Autoformalization with Large Language Models" (2022).** The landmark study of models translating informal mathematics into formal statements, with its error modes. Chapter 11's draft-and-gate architecture is a response to exactly the failures this line of work documents.

**Shashank Pathak, "GFLean: An Autoformalisation Framework for Lean via GF" (2024).** A grammar-based route from controlled natural language into Lean. A useful contrast to this project's contract route, and background to Chapter 24's dream of elaboration from Sanskrit itself.

## The companion programmes

**Sharath Sathish, Mominul Ahsan, and Majid Latifi, "Active Circuit Discovery: A Multi-Action POMDP Agent for Causal Feature Identification in Transformer Attribution Graphs," *Symmetry* 18(6), 1043 (2026).** The first companion programme: an agent that proposes causal hypotheses about model internals and has them judged by registered gates. Chapter 11 names it as the lineage of the propose-gate-ledger loop used here.

**Sharath Sathish, "Recognition-Gated Workspace Steering: Pratyabhijñā as an Engineering Specification for Language Model Control" (2026).** The Prabodha preprint, the second companion programme, which turns a Śaiva recognition doctrine into a control specification the same way this book turns commentary into contracts. It deepens Chapters 11 and 24.

## This project

**The repository: github.com/SharathSPhD/vakya-vallari.** The corpus, the contracts, the Lean kernel and verse modules, the tests, and the append-only ledger, everything Appendix A teaches you to run. The primary artifact of which this book is the narrative.

**The paper.** The technical companion to this book lives in the repository under `paper/`, with the full apparatus of citations, tables, and audit results that the chapters reference by section number.

**The living edition.** The project site is at vakya-vallari.vercel.app, and the edition itself, every verse page and every proof page, is served from the Hugging Face space at huggingface.co/spaces/qbz506/vakya-vallari. Chapter 25 explains how to read a proof page; the site is where you go and do it.
