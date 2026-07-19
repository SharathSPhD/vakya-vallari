# Preface {.unnumbered}

This book landed in the middle of an argument the whole world is now
having.

Machines that generate language have become astonishingly capable and
famously unreliable. They write fluent paragraphs that contain confident
falsehoods. The industry calls this hallucination, and it is not a bug
that better engineering will simply polish away: a system trained to
produce plausible language will produce plausible language, and
plausibility is not truth. So a second question has become urgent
everywhere language models are used. Never mind whether the machine can
write; how would we ever know that what it wrote is right?

Two very different traditions turn out to hold pieces of the answer.

One is young. Over the past decade, mathematicians and computer
scientists have built proof assistants: programs such as Lean in which a
claim is not accepted because it sounds right but because a small,
ruthless checker can verify it mechanically, step by step, down to the
axioms. This machinery has stopped being a curiosity. When Google
DeepMind's AlphaProof reached silver-medal standard on International
Mathematical Olympiad problems, it did so by writing its proofs in Lean,
where every step was checked and hallucination was structurally
impossible. A growing research programme now treats formal verification
as the guardrail for machine reasoning at large: let the model propose,
and let the checker dispose.

The other tradition is old. Some fifteen centuries ago, Sanskrit
grammarians and logicians confronted their own version of the
reliability problem. Knowledge travelled by memory, texts were
compressed to the edge of legibility, and meaning was carried by
commentary; the tradition therefore built technologies of integrity:
recitation permutations that detect corruption, metarules that govern
rules, and, in Navya-Nyāya, a technical language for stating exactly
what a cognition claims, precise enough that a modern type theorist
reads it with a shock of recognition.

This book is what happened when those two traditions were put to work on
one hard, beautiful problem: the opening book of Bhartṛhari's
Vākyapadīyam, the treatise that argues reality itself is of the nature
of the word. Its verses are so compressed that a single line admits
three grammatical translations with three incompatible philosophies. For
fifteen centuries the only referee has been the commentary. What this
project did, and what this book explains from first principles, is turn
that referee into a specification: every verse's commentary compiled
into a formal contract, every accepted translation proved adequate
against it in Lean, and hundreds of plausible mistranslations refuted by
theorems that a computer checks in seconds. Objective verification,
brought into the most subjective of arts.

Different readers will want this book for different reasons, and it was
written for all of them. If you work with language models, here is a
complete, working case study of the propose-and-verify architecture
applied outside mathematics, including what the gates caught when the
generating models degraded. If you build or study proof assistants, here
is a formalization domain unlike anything in the standard library, and a
serious argument that India's Navya-Nyāya anticipated your discipline's
core moves. If you love Sanskrit, here is the complete Brahmakāṇḍa,
Devanagari and transliteration and translation and commentary, every
verse of it. If you study grammar, here is Pāṇini treated as what he
was, the author of the most sophisticated formal system of the ancient
world. And if your subject is meaning itself, here is a fifteen-century
conversation between a philosopher who said the sentence is an
undivided whole and a machine that checks whether we heard him
correctly.

One promise, kept throughout: nothing in this book asks for trust.
Every theorem mentioned is public, every verification replayable, and
every interpretive decision cited to the sentence that licenses it. The
tradition this book studies preserved its texts by building error
detection into recitation itself. This book tries to be worthy of that
standard.

London, July 2026
