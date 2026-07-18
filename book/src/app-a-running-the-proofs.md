# Appendix A · Running the Proofs

Everything this book claims about the edition rests on two commands. This appendix walks you through running them yourself, from a bare computer to a green build, assuming you have never cloned a repository before. Nothing here requires prior experience with Python, Lean, or version control. It does require patience the first time, because the tools download themselves, and honesty about what can go wrong, which the last section supplies.

If you would rather not install anything at all, skip to the section titled "Reading without installing." The living edition publishes every proof page on the web, and auditing a verse there requires only a browser.

## What you need

Three tools, one of which you may already have.

**Git.** The version control system that fetches the repository. On macOS it arrives with the Xcode command line tools; on most Linux distributions it is a package named `git`; on Windows the standard installer from git-scm.com works. If typing `git` in a terminal prints a usage message, you have it.

**A Python manager: uv is recommended.** The repository's Python side is run through uv, a tool from Astral that installs the right Python interpreter and the right packages on demand. This matters more than it sounds. The project declares that it needs Python 3.12 or newer, receipt: `pyproject.toml`, and uv reads that declaration and complies without you managing versions by hand. The continuous integration system uses uv too, receipt: `.github/workflows/ci.yml`, so using it puts you on the same path the maintainers test. Install instructions live at Astral's site; a single shell command is typical.

**Lean 4, via elan.** Lean is installed through its own version manager, called elan, the way uv manages Python. You do not choose a Lean version. The repository pins one, receipt: `lean/lean-toolchain`, currently `leanprover/lean4:v4.32.0`, and elan fetches exactly that toolchain the first time you build. The CI workflow installs elan with the official script from the Lean project's repository and nothing else, so that script is the known-good route.

**Disk and time, stated conservatively.** Budget a few gigabytes of free disk. The repository itself is small, but the Lean toolchain and its build artifacts are not. Budget up to half an hour for the first full run on an ordinary laptop, most of it downloading and elaborating the toolchain. Subsequent runs are incremental and take seconds to a few minutes. A stable internet connection is needed only for the first run of each gate.

## Getting the code

Open a terminal, change to a directory where you keep projects, and run:

```sh
git clone https://github.com/SharathSPhD/vakya-vallari
cd vakya-vallari
```

The first command copies the entire repository, code and corpus and contracts and proofs and history, onto your machine. The second moves you into it. Everything below assumes you are at the repository root, the directory containing `README.md`.

It is worth pausing to notice what you now have. The full canonical corpus of 1,796 kārikās. One JSON contract per Book I verse. The Lean kernel and 144 verse modules. The test suite. The append-only research ledger. The clone is not a demo. It is the edition.

## The two gates

The README states the reproduction recipe in two lines, and this book has quoted them more than once, receipt: `README.md`.

```sh
uv run pytest            # corpus + contract gates
cd lean && lake build    # proof gate (CI also enforces zero sorry)
```

Run them in that order, from the repository root.

**Gate one: `uv run pytest`.** The first invocation makes uv resolve the project: it fetches a suitable Python if none is present, installs the declared dependencies, then hands control to pytest, the Python test runner. Pytest discovers the suites under `tests/` and runs them. These are the corpus and contract gates: corpus integrity, contract schema conformance, sort consistency against the homonym registry, and the verbatim-citation rule, the check that every axiom's `cite` string occurs exactly in the commentary it claims to quote.

Success looks like a stream of test names or dots followed by a summary line reporting the number of tests passed, in green if your terminal supports color, and an exit back to your prompt. Any line containing `FAILED` or `ERROR`, and a nonzero summary of failures, means the gate is red, and pytest prints exactly which check broke and where.

**Gate two: `cd lean && lake build`.** This moves into the Lean project and asks Lake, Lean's build tool, to compile it. On first run, elan sees the pinned toolchain file, downloads that exact Lean version, and only then compiles the kernel, the ontology, and all verse modules under `VakyaVallari/`. This is the long step. Later runs recompile only what changed.

Success looks undramatic: build progress lines, then a return to your prompt with no error. In Lean, compiling is proving. If `lake build` finishes cleanly, every adequacy theorem and every counterexample in the project has been checked by the Lean kernel. Failure looks like a type error with a file and line number, and the build stops.

One more check rides on top of gate two in CI. A Lean file can compile while containing `sorry`, the placeholder that asks the kernel to take a claim on faith. The CI workflow therefore greps the Lean sources for `sorry` and `admit` and fails if either appears, receipt: `.github/workflows/ci.yml`. You can read that workflow to see the exact command; the point is that the published green badge means compiled and free of placeholders, not merely compiled.

When both gates are green on your machine, you have independently reproduced the verified state of the edition. No trust in the maintainers, the CI provider, or this book is involved.

## Reading the artifacts

The gates check objects you can open and read.

**Contracts** live in `data/contracts/`, one JSON file per verse, named by verse id, so verse 1.1 is `data/contracts/1.1.json`. Each file lists entities with their sorts, the endorsed axioms with verbatim cites, the denials, and the accepted and rejected readings. Chapter 10 walked through 1.1 in full; the file on your disk is the same object.

**Verse modules** live in `lean/VakyaVallari/Verses/`, one Lean file per verse, so `V1_1.lean` is the compiled form of the 1.1 contract: its adequacy theorem and its compiled counterexamples. The kernel these modules build on sits beside them in `lean/VakyaVallari/`.

**The ledger** lives in `research/`. The file `ledger.jsonl` is the append-only event log of the formalization loop that Chapter 11 described: drafts, gate verdicts, rejections, repairs, acceptances, one JSON object per line, in order. The `journal.md` beside it is the human-readable running commentary.

## Reading without installing

The same artifacts are published on the web, rebuilt from the repository, so a browser is a legitimate way to audit.

The project site is at `vakya-vallari.vercel.app`. The edition itself, every verse page and every proof page, is served from the project's Hugging Face space, `huggingface.co/spaces/qbz506/vakya-vallari`. Open any verified verse and follow its badge to the proof page: the endorsed axioms each sit above their verbatim commentary cite, the denials and rejected readings follow, and the full Lean module is printed at the bottom. Chapter 25 described how to read one; the two-minute read and the ten-minute audit both work without a single install. What the web edition cannot give you is the ability to change something and watch the gates respond. For that, you need the clone.

## Troubleshooting, honestly

**The first `lake build` is slow.** This is expected, not broken. The first build downloads the pinned Lean toolchain and compiles everything from scratch. Let it finish once; every later build is incremental. If it was interrupted mid-download, running `lake build` again resumes sensibly.

**Python version complaints.** The project targets modern Python, 3.12 or newer, and says so in `pyproject.toml`. If you drive the tests through uv, as the README does, this should never bite, because uv provisions the right interpreter. If you bypass uv and use a system Python that is too old, the tests will refuse or fail in confusing ways. The fix is to use the command as written.

**Something else fails.** Do not debug in the dark. The repository's CI badge and the workflow file `.github/workflows/ci.yml` are the known-good recipe: they show, step by step, the exact commands that produce a green build on a fresh machine, from checkout through elan install through both gates. If your local run diverges from CI's result, the difference between your steps and that file is almost always the cause. And if CI itself is red at the commit you cloned, then the edition really is broken at that commit, which is precisely the honesty the badge exists to report.

## Trying a change

Chapter 25 proposed an experiment. Here it is as concrete steps.

1. Open `data/contracts/1.1.json` in any text editor.
2. Find the relation axiom named `vivartate`, the claim that the world is Brahman's appearance, not its real transformation. Change the name to `parinamate`, the reading the commentary explicitly denies. Save the file.
3. From the repository root, run the first gate:

   ```sh
   uv run pytest
   ```

   Watch it go red. Your edited axiom now carries a cite that does not license it, because no sentence of the commentary asserts pariṇāma, and the citation gate reports the exact axiom that lost its footing.
4. Run the second gate:

   ```sh
   cd lean && lake build
   ```

   If you regenerate or hand-edit the Lean module to match your new contract, the contradiction with the contract's denial surfaces here as a type error, with a file and line.
5. Restore the file. Run both gates again. Green returns.

That round trip is the entire argument of this book compressed into ten minutes at a terminal. The interpretation is not protected by authority. It is protected by gates, and now you have operated them.
