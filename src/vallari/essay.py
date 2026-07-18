"""The interactive-essay landing page for Vākya-Vallarī.

Follows the story-telling blueprint of the companion project pages
(Active Circuit Discovery, Prabodha): act structure, numbered sections,
receipts under every figure and number, expandable technical notes,
and an author footer. All numbers are injected from build-time stats;
none are hand-typed in the template.
"""

from __future__ import annotations

_ESSAY = r"""<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Vākya-Vallarī — The Translation That Proves Itself</title>
<meta name="description" content="An interactive essay: how a fifth-century Sanskrit treatise on language became the first text whose translation is held to its commentary by a theorem prover. Every number traces to a public, replayable artifact.">
<style>
:root { --fg:#1c1917; --bg:#fffdf8; --muted:#6b6257; --card:#f6f1e7; --accent:#7c2d12;
        --ok:#166534; --bad:#9f1239; --line:#e5decf; }
@media (prefers-color-scheme: dark) {
  :root { --fg:#e7e0d3; --bg:#1a1713; --muted:#a39b8b; --card:#26221c; --accent:#f59e0b;
          --ok:#4ade80; --bad:#fb7185; --line:#3a342b; }
}
* { box-sizing: border-box; }
body { font-family: Georgia, 'Noto Serif', serif; color:var(--fg); background:var(--bg);
       margin:0; line-height:1.65; }
a { color: var(--accent); }
nav { position: sticky; top:0; background: var(--bg); border-bottom:1px solid var(--line);
      display:flex; justify-content:space-between; align-items:center;
      padding:.6rem 1.2rem; z-index:5; font-size:.95rem; }
nav .links a { margin-left:1.1rem; text-decoration:none; }
.wrap { max-width: 46rem; margin:0 auto; padding:0 1.2rem; }
header.hero { text-align:center; padding:4.5rem 1rem 3rem; }
.kicker { color:var(--muted); font-size:.95rem; letter-spacing:.04em; }
h1.title { font-size: clamp(2rem, 6vw, 3.2rem); font-weight:normal; line-height:1.15;
           margin:.6rem 0 1rem; }
h1.title em { font-style: italic; }
.lede { font-size:1.15rem; max-width:38rem; margin:0 auto 1rem; }
.byline { color:var(--muted); }
.act { text-align:center; margin:4.5rem 0 2.2rem; }
.act .n { color:var(--accent); letter-spacing:.2em; font-size:.85rem; text-transform:uppercase; }
.act h2 { font-size:1.9rem; font-weight:normal; margin:.3rem 0 .4rem; }
.act p { color:var(--muted); font-style:italic; margin:0 auto; max-width:34rem; }
.sec { margin: 2.6rem 0; }
.sec .num { color:var(--accent); font-size:.8rem; letter-spacing:.15em; text-transform:uppercase; }
.sec h3 { font-size:1.45rem; font-weight:normal; margin:.2rem 0 .8rem; }
.callout { background:var(--card); border-left:3px solid var(--accent);
           padding:.9rem 1.1rem; border-radius:.4rem; margin:1.2rem 0; }
.callout b { display:block; margin-bottom:.2rem; }
details { background:var(--card); border-radius:.4rem; padding:.7rem 1rem; margin:1.2rem 0; }
details summary { cursor:pointer; font-weight:bold; }
.deva { font-size:1.3rem; line-height:2; text-align:center; }
.iast { color:var(--muted); font-style:italic; text-align:center; }
.stats { display:flex; gap:1.2rem; flex-wrap:wrap; justify-content:center; margin:1.6rem 0; }
.stats div { text-align:center; background:var(--card); border-radius:.5rem;
             padding:.8rem 1.2rem; min-width:7.5rem; }
.stats b { font-size:1.7rem; display:block; }
.stats span { color:var(--muted); font-size:.85rem; }
.receipt { color:var(--muted); font-size:.82rem; font-family: ui-monospace, monospace;
           margin:.4rem 0 0; }
.readings { display:grid; gap:.8rem; margin:1.2rem 0; }
.reading { background:var(--card); border:1px solid var(--line); border-radius:.5rem;
           padding:.9rem 1rem; cursor:pointer; }
.reading .r { font-style:italic; }
.reading .verdict { display:none; margin-top:.6rem; font-family:ui-monospace,monospace;
                    font-size:.85rem; }
.reading.open .verdict { display:block; }
.reading .verdict.ok { color:var(--ok); } .reading .verdict.bad { color:var(--bad); }
.hint { color:var(--muted); font-size:.85rem; text-align:center; }
table.gl { border-collapse:collapse; width:100%; font-size:.92rem; }
table.gl td, table.gl th { border-top:1px solid var(--line); padding:.45rem .5rem;
                           text-align:left; vertical-align:top; }
pre { background:var(--card); padding:1rem; border-radius:.5rem; overflow-x:auto;
      font-size:.82rem; line-height:1.45; }
.cards { display:grid; grid-template-columns:repeat(auto-fit,minmax(14rem,1fr));
         gap:.9rem; margin:1.2rem 0; }
.card { background:var(--card); border-radius:.5rem; padding:.9rem 1rem; }
.card h4 { margin:.1rem 0 .4rem; font-weight:bold; font-size:1rem; }
.card p { margin:.2rem 0; font-size:.92rem; }
footer.author { border-top:1px solid var(--line); margin-top:4rem;
                padding:2.5rem 1.2rem; }
footer.author .links a { margin-right:.9rem; }
.fine { color:var(--muted); font-size:.85rem; }
ol.refs { font-size:.92rem; }
</style>
</head>
<body>
<nav>
  <span><a href="#top" style="text-decoration:none">Vākya-Vallarī</a></span>
  <span class="links">
    <a href="https://github.com/SharathSPhD/vakya-vallari/blob/main/paper/paper.pdf">Paper</a>
    <a href="https://github.com/SharathSPhD/vakya-vallari">Code &amp; data</a>
    <a href="edition.html">The edition</a>
  </span>
</nav>

<header class="hero" id="top">
  <div class="kicker">An interactive essay · Vākya-Vallarī · वाक्यवल्लरी, “the vine of the sentence”</div>
  <h1 class="title">The Translation That <em>Proves Itself</em></h1>
  <p class="lede">A fifth-century Sanskrit treatise argues that reality is made of language.
  For fifteen centuries, deciding what its verses mean has been an art.
  This is the story of turning one book of it into theorems: a translation of the
  complete Brahmakāṇḍa that a proof assistant holds to its own commentary,
  verse by verse, with every rival misreading refuted by a compiled theorem.</p>
  <p class="byline">by <b>Dr. Sharath Sathish</b> · a guided tour for the curious and the technical alike</p>
</header>

<div class="wrap">

<div class="act"><div class="n">Act I</div>
<h2>The Underdetermined Verse</h2>
<p>One line of Sanskrit. Three defensible translations. Three incompatible philosophies.</p></div>

<div class="sec"><div class="num">01 · The problem</div>
<h3>Grammar will not save you</h3>
<p>The <em>Vākyapadīya</em> opens with a single verse that carries the whole system:</p>
<p class="deva">अनादिनिधनं ब्रह्म शब्दतत्त्वं यदक्षरम् ।<br>विवर्ततेऽर्थभावेन प्रक्रिया जगतो यतः ॥</p>
<p class="iast">anādinidhanaṃ brahma śabdatattvaṃ yad akṣaram /<br>
vivartate 'rthabhāvena prakriyā jagato yataḥ //</p>
<p>Every word is a decision. Is <em>śabdatattva</em> (“word-essence”) a property of
language, or the Absolute itself? Does <em>vivartate</em> mean the world is a
<em>transformation</em> of Brahman, or its <em>appearance without transformation</em>?
Does <em>akṣara</em> mean “imperishable”, “phoneme”, or, as the grammarians insist,
deliberately both? Each choice yields a grammatical English sentence. The choices
differ as much as materialism differs from idealism.</p>
<p>What settles them is not syntax. It is the commentary: the vṛtti tradition that
fixes, verse by verse, which reading the text licenses. Those constraints are real.
They have simply always lived in the philologist's head.</p>
<div class="callout"><b>The idea</b>
Once a scholar's interpretive commitments are written down as data, a proof
assistant can hold the translation to them. Exhaustively. Publicly. Forever.</div>
</div>

<div class="sec"><div class="num">02 · Try it</div>
<h3>Three renderings, one verdict each</h3>
<p class="hint">Click a rendering to see what the machine proved about it.</p>
<div class="readings">
  <div class="reading" onclick="this.classList.toggle('open')">
    <div class="r">“That beginningless and endless One, Brahman, whose essence is the
    Word, imperishable, appears in the mode of objects…”</div>
    <div class="verdict ok">✓ Adequate — theorem <code>accepted_adequate</code>, closed by <code>decide</code>.
    Every claim it asserts is entailed by axioms that quote the commentary verbatim.</div>
  </div>
  <div class="reading" onclick="this.classList.toggle('open')">
    <div class="r">“The imperishable linguistic structure underlying words has no
    beginning or end.”</div>
    <div class="verdict bad">✗ Unlicensed — sort error. It demotes śabdatattva from the
    Absolute to a property of language; the identity with Brahman then crosses
    ontological sorts and no axiom entails it. Refuted by two compiled theorems.</div>
  </div>
  <div class="reading" onclick="this.classList.toggle('open')">
    <div class="r">“Brahman transforms itself into the world of objects.”</div>
    <div class="verdict bad">✗ Contradicted — it asserts exactly the pariṇāma relation
    the commentary denies. The vṛtti says appearance without loss of unity
    (vivarta), not transformation. Refuted by a compiled theorem.</div>
  </div>
</div>
<p class="receipt">receipts: lean/VakyaVallari/Verses/V1_1.lean · data/contracts/1.1.json · <a href="proofs/1.1.html">proof page for 1.1</a></p>
</div>

<div class="act"><div class="n">Act II</div>
<h2>A Rulebook from the Commentary</h2>
<p>Compiler verification has a trick for exactly this problem. It is thirty years old.</p></div>

<div class="sec"><div class="num">03 · The borrowed trick</div>
<h3>Translation validation, transplanted</h3>
<p>Compiler engineers gave up on proving whole compilers correct long before they
gave up on correctness. The workaround, translation validation, checks each
individual run: the optimizer is untrusted, a semantic reference says what the
output must preserve, and a validator checks the pair after the fact.</p>
<p>Transplant the pattern. The translator is the untrusted optimizer. The
commentary, compiled into a per-verse <b>semantic contract</b>, is the reference.
Lean 4 is the validator. A contract declares the verse's entities with
ontological sorts, its axioms and explicit denials, the claims the accepted
translation makes, and, crucially, a set of plausible <em>mistranslations</em>
that must provably fail.</p>
<div class="callout"><b>The anti-fabrication gate</b>
Every axiom must quote the commentary verbatim, and every accepted-reading claim
must quote the translation verbatim. An axiom that cannot point to the sentence
that licenses it is rejected by string match, before any proof is attempted.</div>
<details><summary>For researchers: the contract, precisely</summary>
<p>Sorts: {absolute, power, manifestation, linguisticItem, property, cognition}.
Claims: identity, relation, predication over sorted entities. A reading is
<em>adequate</em> iff every claim is entailed by the axioms and none is denied.
Rejected readings carry a registered failure mode, <code>contradicted</code>
(asserts a denial) or <code>unlicensed</code> (no axiom entails), and the
validator requires the registered mode to hold mechanically. The kernel makes
relations first-class relata (paramparā-sambandha), types absence with its
counterpositive and locus (abhāva), and proves the Navya-Nyāya involution as a
definitional fact. Adequacy is decidable; every theorem closes by
<code>decide</code>.</p></details>
<p class="receipt">receipts: docs/specs/2026-07-16-vakya-vallari-design.md · lean/VakyaVallari/Ontology.lean · Adequacy.lean</p>
</div>

<div class="act"><div class="n">Act III</div>
<h2>A Lab That Cannot Fool Itself</h2>
<p>The contracts were written by a swarm of language-model agents. That is exactly why every layer has a gate.</p></div>

<div class="sec"><div class="num">04 · The loop</div>
<h3>Agents propose. Gates dispose.</h3>
<p>One agent per verse, each given the verse record, the schema, an exemplar, and
the validator as its exit gate; rounds of 9 to 30 agents with an adjudication
pass between rounds; an append-only ledger recording every draft, rejection,
repair, and acceptance. Acceptance is never a judgment call. A verse is done
when its contract passes the validator, its Lean module compiles with zero
<code>sorry</code>, and its entity sorts survive the corpus-wide consistency gate.</p>
<div class="stats">
  <div><b>@VERSES@</b><span>verses in the corpus</span></div>
  <div><b>144</b><span>Book-I units verified</span></div>
  <div><b>549</b><span>Lean theorems</span></div>
  <div><b>0</b><span>sorry</span></div>
</div>
<p class="receipt">receipts: research/ledger.jsonl (96 events) · CI: pytest + lake build + zero-sorry sweep</p>
</div>

<div class="sec"><div class="num">05 · On the record</div>
<h3>What the gates caught</h3>
<p>The interesting evidence is the failures. Every class of agent error that
occurred is now a mechanical gate.</p>
<div class="cards">
  <div class="card"><h4>Lazy counterexamples · 3</h4>
    <p>Early agents wrote “mistranslations” that secretly restated the axioms. The
    inadequacy theorems would have been false. The Lean build failed; the
    validator was hardened to require provable failure.</p></div>
  <div class="card"><h4>Fabricated citations · 5</h4>
    <p>An API limit killed 20 of 30 agents mid-round, leaving 9 unreviewed drafts.
    Five failed the verbatim-citation gate with paraphrased or invented quotes.
    Degraded output, caught by string match, quarantined, re-authored.</p></div>
  <div class="card"><h4>Sort drift · 89 conflicts</h4>
    <p>Independent agents gave the same term different sorts. The consistency gate
    surfaced every conflict; adjudication resolved each as correction or as
    documented polysemy.</p></div>
  <div class="card"><h4>Identifier hygiene · 2</h4>
    <p>Lean's parser rejected IAST diacritics that Python's
    <code>isidentifier()</code> accepts. An argument for keeping the end-to-end
    kernel gate even when a faster mirror exists.</p></div>
</div>
<p class="receipt">receipts: research/ledger.jsonl · paper §7, Table 2</p>
</div>

<div class="act"><div class="n">Act IV</div>
<h2>The Verdict</h2>
<p>144 of 144 verses. And a machine-checked map of how Book I goes wrong in translation.</p></div>

<div class="sec"><div class="num">06 · The numbers</div>
<h3>The verified Brahmakāṇḍa</h3>
<div class="stats">
  <div><b>144</b><span>adequacy theorems</span></div>
  <div><b>350</b><span>refutation theorems</span></div>
  <div><b>610</b><span>axioms, all verbatim-cited</span></div>
  <div><b>178</b><span>denials</span></div>
  <div><b>41 / 91</b><span>homonym terms / senses</span></div>
  <div><b>180</b><span>pytest gates</span></div>
</div>
<p>Of the 350 refuted mistranslations, 153 assert something the commentary
explicitly denies and 197 assert what no axiom licenses. Together they form a
negative image of the doctrine, in theorem form: pariṇāma for vivarta (1.1),
grammar demoted from discipline to convention (1.11–1.14), inference granted an
autonomy the text denies it (1.30–1.42), sphoṭa temporalized (1.75–1.77), the
corrupt form elevated to equal standing with the correct (1.147–1.155).</p>
<p class="receipt">receipts: <a href="kanda-1.html">Brahmakāṇḍa edition pages</a> · per-verse proof pages · lake build in CI</p>
</div>

<div class="sec"><div class="num">07 · Where the method earns its keep</div>
<h3>The pun the gate refused to flatten</h3>
<p>The consistency gate demands one sort per term, everywhere, unless the exact
partition of uses is registered as polysemy with a textual justification. The
registry is where mechanical discipline meets philology.</p>
<div class="cards">
  <div class="card"><h4>akṣara</h4><p>The imperishable Absolute in 1.9; the phoneme
    in 1.18–22. The tradition treats the pun as the opening verse's argument in
    miniature. A same-sort rule would have flattened it.</p></div>
  <div class="card"><h4>śabda</h4><p>A linguistic item canonically, but the Absolute
    in the fire-in-wood verse (1.46), where the inner word is śabdatattva
    itself.</p></div>
  <div class="card"><h4>sphoṭa</h4><p>Bhartṛhari's meaning-bearer in his own
    doctrine; but 1.102–1.106 report a rival phonetician usage naming the
    first-produced sound. Registering the doxographic span as a separate sense
    keeps the report from contaminating the doctrine.</p></div>
</div>
<p class="receipt">receipts: data/ontology/homonyms.json · 41 terms, 91 senses, one justification each</p>
</div>

<div class="act"><div class="n">Act V</div>
<h2>What Is Not Proved</h2>
<p>Read this act before you believe the others.</p></div>

<div class="sec"><div class="num">08 · The boundary</div>
<h3>What Lean checks, and what it cannot</h3>
<p>Lean verifies the internal coherence of the formalization: the accepted reading
satisfies the contract, and the rivals provably do not. Whether the contract is
faithful to Bhartṛhari is not a theorem and cannot be one. That link is kept
auditable by construction: every axiom carries the exact commentary sentence it
derives from, so checking a contract against the commentary is a lookup, not a
reconstruction. The prover keeps commitments; the philologist judges them.</p>
</div>

<div class="sec"><div class="num">09 · A negative result, kept</div>
<h3>The audit that did not discriminate</h3>
<p>A GPU embedding pass ranks every verse by translation–commentary similarity, as
a review queue. At Book-I scale the contested flag does not separate: contested
verses average 0.567 against 0.550 for uncontested ones, and the lowest tail is
not enriched. The queue's head is still useful (its lowest-ranked verse, 1.74,
is a contested verse whose commentary is dominated by a doxographic dispute),
but the instrument is a screen, not a measure of fidelity. The paper reports
the null alongside the queue.</p>
<p class="receipt">receipts: research/audit/similarities.json · scripts/semantic_audit.py · paper §10</p>
<p>The translation and commentary themselves carry the interpretive standpoint of
one primary source, K. A. Subramania Iyer's edition and translation of Book I
with the Vṛtti (Deccan College, 1965), and the contracts inherit it. Contracts
keyed to rival commentaries would turn inter-commentarial disagreement into
diffable, checkable data. That is the open vine.</p>
</div>

<div class="sec"><div class="num">10 · Stress-tested against itself</div>
<h3>What an adversarial team could and could not break</h3>
<p>Six independent reviewers, each with a fresh context and a hostile lens
(logical triviality, fabrication, kernel soundness, completeness, philology,
paper-versus-reality), were told to break the method, not admire it; every
serious finding was then reproduced by a separate verifier. Most attacks
failed — and a failed attack is evidence for the defense: no
<code>sorry</code>, no fabricated citations, relations correctly directional,
verse namespaces isolated, and a swap test that licensed <em>zero</em> of one
verse's readings by another's contract (0 of 20,592 ordered pairs).</p>
<p>Three critiques landed, and each became a fix. The strongest was
philological: a verbatim-citation gate cannot tell <em>“we hold X”</em> from
<em>“some say X”</em>, so a handful of doxographic verses (1.102–1.113,
1.68–69, 1.70, 1.81) had encoded reported rival views as if endorsed. Those
axioms now carry a <code>reported</code> stance held in a separate
<code>Contract.reported</code> field, the verse wears a <span class="stat"
style="border-style:dashed">doxographic</span> badge, and the proof page shows
endorsed and reported axioms in separate sections. The other two: a
“tautology” objection (accepted readings are subsets of the author's axioms by
design — true, and now made falsifiable by the corpus-wide discriminativity
gate above), and hygiene (a contract may no longer both license and deny the
same claim; every contract now carries at least two refuted misreadings).</p>
<p class="receipt">receipts: research/ledger.jsonl (review, upgrade events) ·
tests/test_stance_and_hygiene.py · src/vallari/discriminativity.py · paper §Adversarial evaluation</p>
</div>

<div class="act"><div class="n">Act VI</div>
<h2>Go Deeper</h2>
<p>Every number above has a receipt. Follow any of them.</p></div>

<div class="sec">
<div class="cards">
  <div class="card"><h4>The paper</h4>
    <p>“Machine-Checked Translation Adequacy for the Brahmakāṇḍa of Bhartṛhari's
    Vākyapadīya” — method, kernel, loop, registry, results.</p>
    <p><a href="https://github.com/SharathSPhD/vakya-vallari/blob/main/paper/paper.pdf">Read the paper →</a></p></div>
  <div class="card"><h4>The edition</h4>
    <p>All @VERSES@ verses: Devanagari, IAST, translation, commentary, contested
    notes, and per-verse proof status.</p>
    <p><a href="edition.html">Browse the edition →</a></p></div>
  <div class="card"><h4>The proofs</h4>
    <p>144 verified verse modules; each proof page shows the contract, its verbatim
    citations, and the generated Lean.</p>
    <p><a href="proofs/1.1.html">Start at Verse 1.1 →</a></p></div>
  <div class="card"><h4>The repository</h4>
    <p>Corpus, contracts, kernel, generator, gates, and the append-only research
    ledger. CI reproduces every claim from a clean checkout.</p>
    <p><a href="https://github.com/SharathSPhD/vakya-vallari">Code &amp; data →</a></p></div>
</div>

<details><summary>Glossary: Sanskrit → engineering</summary>
<table class="gl">
<tr><th>Term</th><th>In the text</th><th>In the system</th></tr>
<tr><td><em>vṛtti</em></td><td>the commentary that fixes the reading</td><td>the semantic reference compiled into contracts</td></tr>
<tr><td><em>vivarta</em></td><td>appearance without transformation</td><td>a relation axiom; its rival pariṇāma is a denial</td></tr>
<tr><td><em>paramparā-sambandha</em></td><td>relation mediated by relation</td><td>nested <code>Node</code>: relations as first-class relata</td></tr>
<tr><td><em>abhāva</em></td><td>absence, with counterpositive and locus</td><td>typed <code>Abhava</code> structure; involution proved</td></tr>
<tr><td><em>akṣara</em></td><td>imperishable / phoneme, deliberately both</td><td>registered polysemy in the homonym registry</td></tr>
<tr><td><em>vallarī</em></td><td>a vine</td><td>the edition: it grows verse by verse, gate by gate</td></tr>
</table></details>
</div>

</div><!-- wrap -->

<footer class="author">
<div class="wrap">
<p><b>Dr. Sharath Sathish</b> works at the intersection of formal methods,
mechanistic interpretability, and classical Indian philosophy read as
engineering. Companion projects run the same gated, ledgered research
discipline: <a href="https://sharathsphd.github.io/ActiveCIrcuitDiscovery/">Active
Circuit Discovery</a> (active inference choosing interpretability experiments)
and <a href="https://sharathsphd.github.io/prabodha">Prabodha</a>
(recognition-gated workspace steering).</p>
<p class="links">
<a href="https://github.com/SharathSPhD/vakya-vallari">Code &amp; data</a>
<a href="https://www.technektar.dev/">TechNektar</a>
<a href="https://www.linkedin.com/in/sharath-s">LinkedIn</a>
<a href="https://scholar.google.com/citations?hl=en&user=dcyu5ucAAAAJ">Google Scholar</a>
<a href="https://medium.com/@sharath.ai.colab">Medium</a>
<a href="https://technektar.substack.com/">Substack</a>
</p>
<h3>References</h3>
<ol class="refs">
<li>Subramania Iyer, K. A. <em>The Vākyapadīya of Bhartṛhari with the Vṛtti:
Chapter I.</em> Deccan College, Poona, 1965. The primary text for the
translation and commentary.</li>
<li>Pnueli, A., Siegel, M., Singerman, E. “Translation Validation.” TACAS 1998.
The compiler-verification pattern transplanted here.</li>
<li>de Moura, L., Ullrich, S. “The Lean 4 Theorem Prover and Programming
Language.” CADE 2021. The validator.</li>
<li>Sathish, S., Ahsan, M., Latifi, M. “Active Circuit Discovery.”
<em>Symmetry</em> 18(6):1043, 2026. Companion programme.</li>
<li>Sathish, S. “Recognition-Gated Workspace Steering.” Preprints.org, 2026.
Companion programme; the gate-and-ledger discipline.</li>
</ol>
<p class="fine">Vākya-Vallarī · Apache-2.0 · written by Dr. Sharath Sathish ·
built as an interactive essay · every number computed from the repository's
committed artifacts · edition of @VERSES@ verses, Brahmakāṇḍa verified
(144 of 144), @CONTESTED@ contested readings preserved as prose notes.</p>
</div>
</footer>
</body></html>
"""


def essay_page(stats: dict) -> str:
    return (
        _ESSAY.replace("@VERSES@", f"{stats['verses']:,}")
        .replace("@CONTESTED@", str(stats["contested"]))
    )
