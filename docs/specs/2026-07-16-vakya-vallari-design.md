# Vākya-Vallarī — The Verified Vākyapadīya

**Design specification · 2026-07-16 · status: adopted**

*vākya-vallarī* — "the vine of the sentence." A living digital edition of Bhartṛhari's
Vākyapadīya that grows verse by verse, where every claim about what a verse *means* is
either mechanically checked or honestly marked as unverified.

## 1. What exists (inputs)

| Asset | Location | Content |
|---|---|---|
| Mūla kārikās | `docs/build/vakyapadiya_mula_deva.json` | 1,814 scraped entries (1,797 with Devanagari lines) from wisdomlib.org, labeled `Verse K.N` |
| Translation + commentary | `docs/build/commentary/kanda{1,2,3}.json` | 1,796 verses (144 / 426 / 1,226) of **original** English translation and analytical commentary, with `contested` flags (286 verses) |
| Research treatise | `docs/Lean Prover and Sanskrit Verification.txt` | Proposes Commentary-Driven Translation Validation (C-TV): Lean 4 + kāraka graphs + Navya-Nyāya typed ontology as translation validator |
| Machine | GB10 (128 GB unified, CUDA 13), Lean 4.32 + lake, uv/Python 3.12, gh (SharathSPhD), Vercel + Supabase + HF MCP |
| Prior art on machine | prabodha (EFE autoresearch ledger pattern), panini-data-toolkit (Saṃsādhanī client, kāraka annotation), pranava (Vākyapadīya edition data), pramana (Navya-Nyāya + z3) |

## 2. Approaches considered

**A. Full C-TV research pipeline** — Pāṇinian parser + Grammatical Framework + cubical
Navya-Nyāya + LLM autoformalization over the whole text, as the treatise sketches.
*Rejected*: research-years of scope; guarantees stubs and fabricated milestones. GF has no
production Sanskrit resource grammar; Lean is not cubical.

**B. Concentric verified edition (chosen)** — build outward in honest, independently
verifiable layers: canonical corpus → semantic contracts → Lean adequacy kernel → agentic
formalization loop → published living edition. Every layer has an objective gate that
either passes or fails; scope grows only by adding verses/depth, never by weakening gates.

**C. Train a Sanskrit-internal model on the GB10** — *Rejected* as the spine (slow,
weakly verifiable); GPU instead serves corpus-scale semantic auditing and, later,
candidate generation.

## 3. The chosen design

### 3.1 Canonical corpus (layer 1)
One JSONL record per verse: `id` (e.g. `1.42`), `kanda`, `section`, `mula_deva` (lines),
`mula_iast` (transliterated), `translation`, `commentary`, `contested`, `provenance`.
Alignment of mūla ↔ commentary is *checked, not assumed*: unaligned or malformed entries
go to a quarantine file with reasons — no silent drops, no invented text.
Pytest is the gate: counts per kāṇḍa, key alignment, script purity (Devanagari in mūla),
non-empty translations, stable sorted IDs, round-trip transliteration sanity.

### 3.2 Semantic contracts (layer 2)
Per verse, a small JSON document *derived from our own commentary* stating its
formalizable core: entities with ontological sorts (e.g. `brahman : Absolute`,
`śabdatattva : Absolute` — not `LinguisticProperty`), identities, predications,
constraints (e.g. "manifestation is vivarta, not pariṇāma"), and which translation
phrases realize which claims. Contracts are versioned data, not code, validated by JSON
Schema. A contract cites the commentary sentences it derives from (no fabrication:
every axiom must be traceable to commentary text).

### 3.3 Lean adequacy kernel (layer 3)
Lean 4 library `VakyaVallari` (no Mathlib dependency unless proven necessary):
- Ontological sorts as types; entities as terms; `Sambandha` supporting nested relations
  (relations as first-class relata); `Avacchedaka` (delimitation) via dependent types;
  `Abhāva` as a structure carrying locus and counterpositive (typed absence).
- A verse module pattern: commentary axioms as hypotheses/instances; the *translation
  reading* rendered as a Lean proposition; theorem
  `adequate : TranslationReading → CommentaryConstraints → Prop` proved for the accepted
  translation. Inadequate readings (e.g. Verse 1.1's "śabdatattva = linguistic structure")
  are encoded so they fail — demonstrated via type errors or provable negations, kept in
  a `Counterexamples` namespace that must also compile (proving the *rejection*, not
  merely commenting it).
- Gate: `lake build` green **and** zero `sorry`/`admit` (CI script).

Honesty boundary, stated in every output: Lean verifies **internal coherence of the
formalization** — that the accepted translation's reading satisfies the contract axioms
and rival readings do not. It cannot verify that the contract itself is faithful to
Bhartṛhari; that link is the human-auditable contract→commentary citation trail.

### 3.4 Formalization loop (layer 4)
Ralph-loop with the Lean kernel as the objective gate, prabodha-style append-only ledger
(`research/ledger.jsonl`): pick next verse → agent drafts contract + Lean from verse data
→ `lake build` gates → on failure, error trace feeds repair (bounded retries) → on
success, record and advance. Selection favors Brahmakāṇḍa opening sequence first
(densest philosophy, treatise's own examples), then contested verses (highest value).

### 3.5 Living edition (layer 5)
Static site (generated from corpus + proof status) deployed on Vercel: per-verse page with
Devanagari, IAST, translation, commentary, contested badge, and a proof badge —
`verified` (Lean theorem compiled) / `contracted` (contract exists, proof pending) /
`unformalized`. GitHub repo `SharathSPhD/vakya-vallari` with Actions CI running pytest +
lake build + zero-sorry check. GPU work (layer 6+): embedding audit of all 1,796
translation/commentary pairs for semantic drift and cross-verse terminology consistency,
feeding the contested-verse queue.

## 4. Repository layout

```
vakya-vallari/
├── docs/            # source material (as found) + specs + reports
├── src/vallari/     # Python: ingest, validate, contracts, leangen, site build
├── tests/           # pytest — the corpus/contract gates
├── data/corpus/     # canonical JSONL (built, committed)
├── data/contracts/  # per-verse semantic contracts (JSON)
├── lean/            # lake project: VakyaVallari lib + Verses/ + Counterexamples
├── research/        # ledger.jsonl, journal.md (append-only, prabodha pattern)
├── site/            # static site source
└── .github/workflows/ci.yml
```

## 5. Milestones (objective gates, tracked as tasks #1–#7)

- **M0** scaffold: git + GitHub repo, uv + lake projects build, spec committed.
- **M1** corpus: 1,796 verses aligned; pytest suite green; quarantine report exists.
- **M2** kernel: Lean ontology library builds, zero sorry, example theorems.
- **M3** Verse 1.1 end-to-end incl. compiled counterexample of the naive reading.
- **M4** loop: ≥10 Brahmakāṇḍa verses verified; ledger records every attempt.
- **M5** publish: CI green on GitHub; edition live on Vercel.
- **M6+** iterate: GPU semantic audit, coverage growth, cross-verse consistency.

Failure reporting is part of the contract: if a gate cannot be met, the ledger and
journal record why, and the milestone stays open — no redefining gates to pass.

## 6. Testing strategy
TDD throughout the Python layer (tests first for ingest/validation/contract schema/
leangen). Lean is self-testing (the build *is* the test), plus `#guard`/`example`
assertions for machinery. CI reproduces all gates from a clean checkout.
