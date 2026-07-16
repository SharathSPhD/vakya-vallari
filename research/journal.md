# Vākya-Vallarī research journal

Append-only. Each entry: date, what was attempted, what the gates said, decisions.

## 2026-07-16 — M0/M1

- Adopted design: concentric verified edition (spec: `docs/specs/2026-07-16-vakya-vallari-design.md`).
- Ecosystem research (`docs/reports/2026-07-16-ecosystem-research.md`): SARIT has a TEI-XML
  Vākyapadīya (cross-check resource); vidyut offers offline morphology; **no prior
  Lean/Coq formalization of Sanskrit philosophical texts found** — the kernel here is novel.
- M0: git + uv + lake scaffold, CI workflow. **Blocker:** `gh repo create` denied by the
  permission classifier (2 attempts) — GitHub publication deferred; needs operator action.
- M1: canonical corpus built, 12 pytest gates green. Findings the tests forced:
  - `contested` is a **prose note** explaining each dispute (286 verses), not a boolean.
  - Mūla verse markers legitimately embed Latin half-verse letters (`॥ ३५cd ॥`).
  - wisdomlib assigns `2.127cd` to two different pages (halves of 2.126 and 2.127); the
    commentary documents this defect itself. Records merge the lines and carry
    `source_anomaly`; loader never silently overwrites duplicates.
  - `Verse 2.441(a)` is an empty scraping artifact with no commentary unit — excluded
    (it is mūla-side only; canonical units come from commentary).
- Corpus manifest sha256: `53043bdabcb76b0c8f20f1a7a04f20f8deaef847876cf7450751d177394f230a`.
