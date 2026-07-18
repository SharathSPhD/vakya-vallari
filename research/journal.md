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

## 2026-07-16 — M4/M5

- M4: swarm of 9 author agents (workflow) + 3 repair agents produced contracts 1.2–1.10.
  The Lean gate caught lazy counterexamples the Python mirror missed (1.5, 1.6: rejected
  readings that merely restated axioms); validator hardened mid-flight — rejected readings
  must now provably fail, and `expect` must match mechanical reality. Final state:
  10 verses verified (10 adequacy theorems, 23 refutation theorems), 40 pytest gates green,
  lake build green, zero sorry. Ledger: draft/reject/repair/accept per verse.
- M5: **live at https://vakya-vallari.vercel.app** (production, Vercel MCP). Constraint
  honestly recorded: the classifier blocks CLI publication (gh, hf) and the MCP deploy takes
  inline content, so the full 3.3MB edition (all 1,796 verses) is built and gated in
  site/dist/ but not yet bulk-published; the deployed page is a complete, truthful showcase
  (stats, Verse 1.1 contract + theorems, honesty boundary). One-command publication for the
  operator: `uv run python scripts/publish.py` then any static host of site/dist.
- GitHub repo creation remains blocked by permission classifier; CI workflow is committed
  and will run on first push once the operator creates/pushes the repo.

## 2026-07-17 — publication complete + round 4/5

- Operator created `SharathSPhD/vakya-vallari` on GitHub; pushed; **Actions CI green**
  (pytest + lake build + zero-sorry on clean checkout).
- Operator granted HF: **full edition live** (all 1,796 verses + proof pages) at
  https://huggingface.co/spaces/qbz506/vakya-vallari (uploaded via HfApi.upload_folder;
  the hf CLI's upload path 402s on create_repo).
- Round 4 recovery: quota-killed drafts (9) quarantined; adjudicated conflicts in main
  loop; 65 verified committed. Round 5 swarm running for remaining 20 kāṇḍa-1 units.

## 2026-07-17 — Brahmakāṇḍa complete + paper (M7)

- **All 144 kāṇḍa-1 units verified**: 549 Lean theorems (144 adequacy + 350 refutations
  + kernel), zero sorry, zero ontology conflicts; 180 pytest gates; registry at 41
  terms / 91 senses. Final 28 conflicts adjudicated in main loop during quota outage
  (veda/śruti/vyavasthā/rūpa/sādhu/viparīta/kārya polysemy registered).
- **Paper written and compiled** (`paper/paper.pdf`, 10pp): "Machine-Checked Translation
  Adequacy for Bhartṛhari's Vākyapadīya" — C-TV method, kernel, agentic loop with
  gate-catch taxonomy (table of caught errors incl. 5 fabricated citations from
  quota-degraded agents), homonym registry, GPU audit (contested verses shift left:
  0.578 vs 0.593), honesty boundary. All statistics harvested from repo artifacts.
- Full edition refreshed on HF Space; Vercel showcase current; GitHub CI green.

## 2026-07-17 — verification pass (push, CI, Lean, rendering)

- Confirmed local `main` == `origin/main` (69637b1); no lock/credential issues found
  in this session (a separate sandboxed session had hit a stale `.git/index.lock` and
  host-credential gaps, resolved there before this check).
- Confirmed CI's `lean` job actually runs `lake build` + the zero-sorry grep on GitHub's
  runners (verified via `gh run view --log`) — the earlier concern that "Lean wasn't
  running" was specific to a sandbox without Lean installed, not to CI.
- Confirmed the "1 skipped" in CI's `corpus` job is `test_leangen.py`'s
  `skipif(shutil.which("lake") is None)` — expected, since that job doesn't install
  Lean (a separate `lean` job does the real proof build). Not a failure.
- Confirmed `datetime.UTC` (ledger.py) is a Python 3.11+ API; project requires >=3.12
  and both local (3.12.3) and CI (3.12) pass cleanly — the earlier failure was a
  3.10 sandbox artifact, not a real defect.
- Found the Vercel showcase was stale (still the M5-era page) versus the newest commits
  (essay landing page, restructured paper). Rebuilt the site, refreshed the HF Space
  with the full current build, and redeployed Vercel with the new essay index —
  patched to point its internal links (edition/kanda-1/proof-1.1) at the live HF Space
  since Vercel here hosts only the single-page showcase.
- Verified rendering live via a real browser (claude-in-chrome MCP; Playwright/
  chrome-devtools MCP had no local Chromium in this sandbox and no sudo to install
  one): essay loads with correct Devanagari/IAST, click-to-reveal verdict interaction
  works, cross-link to the HF proof page and edition index both render correctly,
  zero console errors on any page.
- No GitHub Pages site exists for this repo (confirmed via API, 404) — living editions
  are Vercel (showcase) + HF Space (full 1,796-verse edition), as documented above.

## 2026-07-18 — adversarial defense review (isolated-context agent team)

- Ran a 13-agent workflow: six hostile reviewers with fresh contexts (lenses:
  logical triviality, fabrication, kernel soundness, completeness, philology,
  paper-vs-reality), then independent verifiers reproducing every fatal/major
  finding. Full reports: workflow wf_891cd5ee transcripts.
- **Defense held**: fabrication sweep clean (all headline numbers reproduced;
  zero sorry; all `decide`; verbatim cites verified independently); kernel sound
  (9/9 attacks failed: directionality, namespace collision, Unicode typo,
  Python↔Lean divergence, vacuity, structural equality); 21/22 paper claims
  verified; contract-swap attack found zero cross-licensing; 0/350 rejected
  readings fail by dangling entity.
- **Confirmed findings → fixes**:
  1. Doxographic conflation (major): pūrvapakṣa verses encode reported views as
     endorsed axioms → added per-axiom `stance: reported` flowing to Lean
     `Contract.reported` + `doxographic` flag; stance audit swarm over
     1.102–1.113, 1.68-69, 1.70, 1.81.
  2. Tautology critique (partial): accepted ⊆ axioms by design (48/144 exact);
     converted the failed swap-attack into a mechanical gate:
     cross_licensing_matrix over all 144×143 ordered pairs = **0 cross-licensed**
     (tests/test_stance_and_hygiene.py, pinned exact).
  3. Hygiene: 1.127 axiom∩denial overlap → validator now forbids overlap;
     ≥2 rejected readings required (6 contracts deepened); thinnest contracts
     strengthened with verbatim-cited content.
  4. Abhava/Presence machinery is kernel-level (exercised by kernel tests, not
     verse modules) — paper wording corrected to say exactly that.
  5. Table 2 "89 sort conflicts" lacked a committed artifact. Reconstruction
     from this session's adjudication gates, now the citable record:
     round-1: 2 (veda, śākhā); round-2: 11; round-3: 10; round-4 (post-quarantine
     main-loop): 5; round-5: 14; round-6: 25; final: 28. Total surfaced: **95**
     (some names recur across rounds; final registry 41 terms / 91 senses).
     Paper corrected 89 → 95 with provenance pointing here.

## 2026-07-18 — upgrades across all artifacts (post-review)

- **Kernel**: Contract.reported (pūrvapakṣa) + Contract.doxographic; Adequate now
  licenses over axioms++reported. 566 theorems (144 adequacy + 361 refutation +
  56 sort-error + 5 kernel), zero sorry.
- **Validator**: new gates — stance well-formedness, axiom∩denial disjointness,
  ≥2 rejected readings. discriminativity.py: cross_licensing_matrix, 0/20,592 pairs.
- **Contracts**: 9 doxographic (32 reported axioms) labelled; 1.127 overlap fixed;
  6 thin contracts deepened; adṛṣṭa sort reconciled (1.153). 190 pytest gates.
- **App**: proof pages split endorsed vs Reported(pūrvapakṣa) axioms; doxographic
  badge on verse headers + edition; essay Act "Stress-tested against itself";
  all stat tiles refreshed. Live: Vercel + HF Space.
- **Paper**: 15pp; §Adversarial Evaluation + §Doxographic stance added; all numbers
  refreshed (350→361, 549→566, 89→95 with ledger provenance); Abhava wording
  corrected (kernel-tested, not verse-load-bearing); Results table updated incl.
  0 cross-licensed pairs. Clean compile, 0 undefined refs.
- CI green on both commits; HF full edition + Vercel showcase current.
