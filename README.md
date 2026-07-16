# Vākya-Vallarī — the verified Vākyapadīya

*vākya-vallarī* ("the vine of the sentence") is a living digital edition of Bhartṛhari's
**Vākyapadīya** in which claims about what each verse means are mechanically checked
where possible and honestly marked where not.

It combines:

- **A canonical corpus** — all 1,796 kārikās (Brahmakāṇḍa 144 · Vākyakāṇḍa 426 ·
  Padakāṇḍa 1,226) with Devanagari mūla, IAST, an original English translation, and an
  original analytical commentary; 286 verses carry an explicit `contested` flag.
- **Semantic contracts** — per-verse JSON stating the formalizable core of the
  commentary: entities and their ontological sorts, identities, predications, and
  constraints, each traceable to the commentary sentences it derives from.
- **A Lean 4 adequacy kernel** — a typed ontology (Navya-Nyāya-inspired: nested
  relations, delimitors, typed absence) in which each verse's accepted translation
  reading is proved to satisfy its contract, and rejected readings are *compiled
  counterexamples*, not comments. Gate: `lake build` green, zero `sorry`.
- **A formalization loop** — an agentic pipeline gated by the Lean type-checker, with
  an append-only research ledger (`research/ledger.jsonl`).

## Honesty boundary

Lean verifies the **internal coherence of the formalization**: that the accepted
translation satisfies the contract axioms and rival readings do not. Whether the
contract is faithful to Bhartṛhari is a human-auditable question — which is why every
contract axiom cites the commentary text it derives from.

## Layout

- `data/corpus/` canonical JSONL (built from `docs/build/` sources)
- `data/contracts/` per-verse semantic contracts
- `lean/` Lake project `VakyaVallari` (kernel + `Verses/` + `Counterexamples/`)
- `src/vallari/`, `tests/` ingest/validation/generation pipeline (TDD)
- `research/` append-only ledger and journal
- `docs/specs/` design specifications

## Reproduce the gates

```sh
uv run pytest            # corpus + contract gates
cd lean && lake build    # proof gate (CI also enforces zero sorry)
```
