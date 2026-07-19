#!/usr/bin/env python3
"""Generate the book's diagram figures.

Publication constraints: 300 dpi PNG, white background, black/white/grey
only (grayscale-safe for print), generous font sizes for a 6x9in measure,
about 2400 px wide. Diagrams are built from matplotlib patches and
annotations, not charts. No Devanagari inside figures; IAST only.

Usage: python3 scripts/make_figures.py
"""

from __future__ import annotations

from pathlib import Path

import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.patches import Circle, FancyArrowPatch, FancyBboxPatch, Arc

OUT = Path(__file__).resolve().parents[1] / "book/assets/figures"
OUT.mkdir(parents=True, exist_ok=True)

BLACK = "#000000"
DGREY = "#444444"
MGREY = "#888888"
LGREY = "#dddddd"
FGREY = "#f2f2f2"

plt.rcParams.update(
    {
        "font.family": "DejaVu Sans",
        "font.size": 13,
        "figure.facecolor": "white",
        "savefig.facecolor": "white",
    }
)


def new_fig(w=8.0, h=6.0):
    fig, ax = plt.subplots(figsize=(w, h))
    ax.set_xlim(0, 100)
    ax.set_ylim(0, 100)
    ax.axis("off")
    return fig, ax


def save(fig, name):
    fig.savefig(OUT / name, dpi=300, bbox_inches="tight", pad_inches=0.15)
    plt.close(fig)
    print("wrote", OUT / name)


def box(ax, cx, cy, w, h, text, fs=12, fc="white", ec=BLACK, lw=1.4,
        weight="normal", style="round,pad=0.6", tc=BLACK):
    ax.add_patch(
        FancyBboxPatch(
            (cx - w / 2, cy - h / 2), w, h,
            boxstyle=style, mutation_scale=1,
            facecolor=fc, edgecolor=ec, linewidth=lw,
        )
    )
    ax.text(cx, cy, text, ha="center", va="center", fontsize=fs,
            weight=weight, color=tc, linespacing=1.35)


def diamond(ax, cx, cy, w, h, text, fs=11, fc=FGREY, ec=DGREY, lw=2.0):
    ax.add_patch(
        plt.Polygon(
            [(cx - w / 2, cy), (cx, cy + h / 2), (cx + w / 2, cy),
             (cx, cy - h / 2)],
            closed=True, facecolor=fc, edgecolor=ec, linewidth=lw,
        )
    )
    ax.text(cx, cy, text, ha="center", va="center", fontsize=fs,
            color=BLACK, linespacing=1.3)


def arrow(ax, x1, y1, x2, y2, lw=1.6, color=BLACK, style="-|>", ls="-",
          shrinkA=2, shrinkB=2, rad=0.0):
    ax.add_patch(
        FancyArrowPatch(
            (x1, y1), (x2, y2), arrowstyle=style, mutation_scale=16,
            linewidth=lw, color=color, linestyle=ls,
            shrinkA=shrinkA, shrinkB=shrinkB,
            connectionstyle=f"arc3,rad={rad}",
        )
    )


# ---------------------------------------------------------------- fig01
def fig01():
    fig, ax = new_fig(8, 6)
    box(ax, 50, 90, 34, 10, "VP 1.1 (Sanskrit)", fs=15, weight="bold",
        fc=FGREY)
    cols = [
        (18, "Absolute = the Word;\nworld its appearance",
         "ADEQUATE\n(theorem)", "white"),
        (50, "language has an\nimperishable structure",
         "UNLICENSED\n(sort error)", LGREY),
        (82, "Brahman transforms\ninto the world",
         "CONTRADICTED\n(denied relation)", LGREY),
    ]
    for x, reading, verdict, vfc in cols:
        arrow(ax, 50, 84, x, 66)
        box(ax, x, 56, 30, 18, reading, fs=11.5)
        arrow(ax, x, 46, x, 32)
        box(ax, x, 22, 30, 16, verdict, fs=12, weight="bold", fc=vfc,
            lw=2.0)
    ax.text(50, 74, "three renderings", ha="center", fontsize=11,
            style="italic", color=DGREY)
    save(fig, "fig01-three-renderings.png")


# ---------------------------------------------------------------- fig02
def fig02():
    fig, ax = new_fig(8, 6.4)
    words = ["a", "b", "c", "d"]
    xs = [26, 42, 58, 74]
    ax.text(8, 90, "verse", fontsize=13, weight="bold", va="center")
    for x, wd in zip(xs, words):
        box(ax, x, 90, 12, 9, wd, fs=15, weight="bold", fc=FGREY)

    ax.text(8, 70, "pada-pāṭha", fontsize=12, weight="bold", va="center")
    for x, wd in zip(xs, words):
        box(ax, x, 70, 11, 8, wd, fs=13)
    for x in [34, 50, 66]:
        ax.text(x, 70, "|", ha="center", va="center", fontsize=15,
                color=DGREY)

    ax.text(8, 52, "krama-pāṭha", fontsize=12, weight="bold", va="center")
    for x, pair in zip([30, 50, 70], ["a b", "b c", "c d"]):
        box(ax, x, 52, 15, 8, pair, fs=13)

    ax.text(8, 34, "ghana-pāṭha", fontsize=12, weight="bold", va="center")
    for x, g in zip([31, 55, 79], ["ab ba abc", "bc cb bcd", "cd dc cd…"]):
        box(ax, x, 34, 20, 8, g, fs=11.5)

    for x in xs:
        arrow(ax, x, 85.5, x, 74.5, lw=1.0, color=MGREY)
    box(ax, 50, 14, 82, 11,
        "corruption in one stream is caught\nby cross-checking the others",
        fs=12.5, fc=FGREY, ec=DGREY, lw=1.2)
    save(fig, "fig02-patha-codes.png")


# ---------------------------------------------------------------- fig03
def fig03():
    fig, ax = new_fig(7.2, 7.2)
    layers = [
        ("sūtra / kārikā", "maximally terse root text"),
        ("vṛtti", "gloss"),
        ("bhāṣya", "extended discussion"),
        ("ṭīkā", "sub-commentary"),
        ("ṭippaṇī", "marginal notes"),
    ]
    ys = [88, 70, 52, 34, 16]
    widths = [34, 42, 50, 58, 66]
    for (name, sub), y, w in zip(layers, ys, widths):
        box(ax, 45, y, w, 11, f"{name}\n{sub}", fs=12,
            fc=FGREY if y == 88 else "white")
    for y1, y2 in zip(ys[:-1], ys[1:]):
        arrow(ax, 45, y1 - 5.5, 45, y2 + 5.5)
        ax.text(48, (y1 + y2) / 2, "unpacks", fontsize=10.5,
                style="italic", color=DGREY, va="center")
    arrow(ax, 88, 20, 88, 84, lw=1.2, color=MGREY)
    arrow(ax, 88, 84, 88, 20, lw=1.2, color=MGREY)
    ax.text(90.5, 78, "compression", rotation=90, fontsize=11,
            color=DGREY, ha="center", va="top")
    ax.text(90.5, 26, "decompression", rotation=90, fontsize=11,
            color=DGREY, ha="center", va="bottom")
    save(fig, "fig03-commentary-stack.png")


# ---------------------------------------------------------------- fig04
def fig04():
    fig, ax = new_fig(8.6, 5.4)
    box(ax, 12, 74, 20, 16, "inputs\ndhātu +\npratyaya", fs=12, fc=FGREY)
    box(ax, 46, 74, 38, 22,
        "sūtra rules\nsaṃjñā | paribhāṣā\nvidhi | adhikāra",
        fs=12.5, lw=1.8)
    box(ax, 80, 74, 18, 14, "sandhi", fs=13)
    box(ax, 80, 38, 22, 13, "surface form", fs=13, weight="bold",
        fc=FGREY)
    arrow(ax, 22.5, 74, 26.5, 74)
    arrow(ax, 65.5, 74, 70.5, 74)
    arrow(ax, 80, 66.5, 80, 45)
    box(ax, 33, 30, 46, 15,
        "utsarga / apavāda:\nexception outranks general",
        fs=12.5, ec=DGREY, lw=2.2, fc="white")
    arrow(ax, 42, 38, 44, 62, lw=1.1, color=MGREY, ls=(0, (4, 3)))
    save(fig, "fig04-panini-machine.png")


# ---------------------------------------------------------------- fig05
def fig05():
    fig, ax = new_fig(8, 7.2)
    ax.set_xlim(-6, 106)
    cx, cy = 50, 50
    box(ax, cx, cy, 26, 12, "pacati\n(cooks)", fs=15, weight="bold",
        fc=FGREY, lw=2.0)
    import math
    spokes = [
        ("kartṛ · agent", "devadattaḥ\n(Devadatta)"),
        ("karman · patient", "odanam\n(the rice)"),
        ("karaṇa · instrument", "agninā\n(with fire)"),
        ("sampradāna · recipient", "atithaye\n(for the guest)"),
        ("apādāna · source", "sthālyāḥ\n(from the pot)"),
        ("adhikaraṇa · locus", "gṛhe\n(in the house)"),
    ]
    r = 36
    for i, (role, ex) in enumerate(spokes):
        angle = math.radians(90 - i * 60)
        x = cx + r * math.cos(angle) * 1.15
        y = cy + r * math.sin(angle) * 0.95
        arrow(ax, cx + 14 * math.cos(angle), cy + 8 * math.sin(angle),
              x - 11 * math.cos(angle), y - 7 * math.sin(angle),
              lw=1.2, color=DGREY, style="-")
        box(ax, x, y, 28, 13, f"{role}\n{ex}", fs=11)
    save(fig, "fig05-karaka-roles.png")


# ---------------------------------------------------------------- fig06
def fig06():
    fig, ax = new_fig(8.4, 5)
    for i, x in enumerate([12, 26, 40]):
        box(ax, x, 62, 11, 11, f"d{i + 1}", fs=14, fc="white")
    arrow(ax, 5, 48, 48, 48, lw=1.4, color=DGREY)
    ax.text(26, 42, "time: sound-events (dhvani), one after another",
            ha="center", fontsize=11, color=DGREY)
    circ = Circle((77, 60), 16, facecolor=FGREY, edgecolor=BLACK,
                  linewidth=2.0)
    ax.add_patch(circ)
    ax.text(77, 60, "sphoṭa\n(undivided\nmeaning-whole)", ha="center",
            va="center", fontsize=12.5, weight="bold", linespacing=1.4)
    for x in [12, 26, 40]:
        arrow(ax, x + 4, 68, 66, 66, lw=1.1, color=MGREY, rad=-0.18)
    ax.text(52, 80, "manifests", fontsize=12, style="italic",
            color=DGREY, ha="center")
    box(ax, 50, 16, 84, 12,
        "the sounds reveal it; they do not compose it",
        fs=13, fc="white", ec=DGREY, lw=1.4)
    save(fig, "fig06-sphota-dhvani.png")


# ---------------------------------------------------------------- fig07
def fig07():
    fig, ax = new_fig(9.2, 5.2)
    arrow(ax, 3, 62, 97, 62, lw=1.8)
    stages = [
        (14, "MEMORY", "pāṭha permutations,\nrecited redundancy",
         "a broken lineage\nloses the text"),
        (38, "TEXT", "axiomatics:\nEuclid's Elements",
         "gaps hidden in\n'obviously'"),
        (62, "LOGIC", "Hilbert, Gödel:\nformal systems",
         "unformalized proofs\ntoo long to check"),
        (86, "MACHINE", "kernel-checked:\nLean, Coq",
         "trust shifts to\na small kernel"),
    ]
    for x, name, what, fail in stages:
        box(ax, x, 78, 21, 17, f"{name}\n{what}", fs=11, fc=FGREY)
        ax.plot([x], [62], marker="o", color=BLACK, markersize=7)
        box(ax, x, 36, 21, 15, f"failure mode:\n{fail}", fs=10,
            ec=MGREY, lw=1.1)
        arrow(ax, x, 69, x, 64, lw=1.0, color=MGREY, style="-")
        arrow(ax, x, 60, x, 44, lw=1.0, color=MGREY, style="-")
    save(fig, "fig07-proof-carriers.png")


# ---------------------------------------------------------------- fig08
def fig08():
    fig, ax = new_fig(8.4, 6.2)
    rows = [
        ("Proposition", "Type"),
        ("Proof", "Program"),
        ("Implication A→B", "Function A→B"),
        ("Conjunction A∧B", "Pair (A, B)"),
        ("Checking a proof", "Type-checking"),
    ]
    ax.text(24, 95, "LOGIC", ha="center", fontsize=15, weight="bold")
    ax.text(76, 95, "COMPUTATION", ha="center", fontsize=15,
            weight="bold")
    ys = [82, 66, 50, 34, 18]
    for (l, r), y in zip(rows, ys):
        box(ax, 24, y, 34, 11, l, fs=13)
        box(ax, 76, y, 34, 11, r, fs=13)
        arrow(ax, 42, y, 58, y, style="<|-|>", lw=1.4, color=DGREY)
    ax.add_patch(FancyBboxPatch((44, 8), 12, 84,
                                boxstyle="round,pad=0.5",
                                facecolor=FGREY, edgecolor="none",
                                zorder=0))
    ax.text(50, 4, "the Curry–Howard bridge", ha="center", fontsize=11,
            style="italic", color=DGREY)
    save(fig, "fig08-curry-howard.png")


# ---------------------------------------------------------------- fig09
def fig09():
    fig, ax = new_fig(8.4, 6.6)
    box(ax, 18, 88, 26, 11, "Sorta (6)\nfixed sort enum", fs=12,
        fc=FGREY)
    box(ax, 18, 66, 26, 11, "Entity\nname : sort", fs=12)
    box(ax, 58, 66, 42, 13,
        "Claim\nidentity | relation | predication", fs=12)
    box(ax, 30, 40, 40, 13, "Contract\naxioms, denials", fs=12)
    box(ax, 76, 40, 30, 13, "Reading\nclaims", fs=12)
    box(ax, 52, 14, 52, 13,
        "Adequate : decidable,\nevery theorem closed by decide",
        fs=12.5, weight="bold", fc=FGREY, lw=2.0)
    arrow(ax, 18, 82.5, 18, 71.5)
    arrow(ax, 31, 66, 36.5, 66)
    arrow(ax, 48, 59.5, 36, 46.5)
    arrow(ax, 66, 59.5, 74, 46.5)
    arrow(ax, 33, 33.5, 46, 20.5)
    arrow(ax, 72, 33.5, 58, 20.5)
    ax.text(24.5, 76.5, "typed by", fontsize=10, color=DGREY,
            style="italic")
    ax.text(33.5, 69, "over", fontsize=10, color=DGREY, style="italic")
    save(fig, "fig09-kernel-types.png")


# ---------------------------------------------------------------- fig10
def fig10():
    fig, ax = new_fig(9.4, 5.6)
    y = 70
    box(ax, 10, y, 16, 15, "Iyer 1965\n(source\ntext)", fs=10.5, fc=FGREY)
    box(ax, 31, y, 18, 15, "machine\ntranslation +\ncommentary", fs=10.5)
    box(ax, 53, y, 19, 15, "semantic\ncontract\n(verbatim cites)",
        fs=10.5)
    box(ax, 74, y, 15, 15, "Lean\nmodule", fs=10.5)
    box(ax, 91, y, 13, 15, "theorems", fs=10.5, weight="bold", fc=FGREY)
    for x1, x2 in [(18.5, 21.5), (40.5, 43), (63, 66), (82, 84)]:
        arrow(ax, x1, y, x2, y)
    diamond(ax, 53, 36, 17, 17, "validator", fs=10.5)
    diamond(ax, 74, 36, 15, 17, "lake build", fs=10.5)
    diamond(ax, 91, 36, 15, 17, "consistency", fs=9.5)
    for x in [53, 74, 91]:
        arrow(ax, x, y - 7.5, x, 45, lw=1.1, color=MGREY, style="-")
    arrow(ax, 44, 36, 31, 61.5, lw=1.4, color=DGREY, ls=(0, (5, 3)),
          rad=0.25)
    ax.text(26, 36, "repair", fontsize=12, style="italic", color=DGREY,
            ha="center")
    ax.text(72.5, 14, "gates: any failure loops the draft back",
            fontsize=11, color=DGREY, ha="center", style="italic")
    save(fig, "fig10-ctv-pipeline.png")


# ---------------------------------------------------------------- fig11
def fig11():
    fig, ax = new_fig(8.6, 6.4)
    rows = [
        ("avacchedaka\n(delimitor)", "type index"),
        ("paramparā-sambandha\n(chained relation)", "nested relation\n(Node)"),
        ("abhāva (pratiyogin,\nadhikaraṇa)", "typed absence"),
        ("śābdabodha\n(verbal cognition)", "elaboration"),
        ("viśeṣya–viśeṣaṇa\n(qualified–qualifier)", "subject–predicate\ntyping"),
    ]
    ax.text(25, 96, "Navya-Nyāya", ha="center", fontsize=15,
            weight="bold")
    ax.text(75, 96, "Type theory", ha="center", fontsize=15,
            weight="bold")
    ys = [84, 67, 50, 33, 16]
    for (l, r), y in zip(rows, ys):
        box(ax, 25, y, 40, 13, l, fs=12)
        box(ax, 75, y, 36, 13, r, fs=12)
        arrow(ax, 46, y, 56, y, style="<|-|>", lw=1.4, color=DGREY)
    save(fig, "fig11-nyaya-mapping.png")


# ---------------------------------------------------------------- fig12
def fig12():
    fig, ax = new_fig(9.4, 6.2)
    y = 74
    box(ax, 8, y, 13, 13, "verse\nqueue", fs=11, fc=FGREY)
    box(ax, 24.5, y, 14, 13, "drafting\nagent", fs=11)
    diamond(ax, 42, y, 17, 16, "validator\ngate", fs=10)
    diamond(ax, 60, y, 15, 16, "lean\ngate", fs=10)
    diamond(ax, 78.5, y, 19, 16, "consistency\ngate", fs=10)
    box(ax, 94.5, y, 9, 13, "ledger", fs=11, fc=FGREY)
    pairs = [(15, 17), (32, 33), (51, 52), (68, 68.5), (88.5, 89.5)]
    for x1, x2 in pairs:
        arrow(ax, x1, y, x2, y)
    box(ax, 46, 38, 20, 12, "repair\nagent", fs=12, ec=DGREY, lw=2.0)
    for x in [42, 60, 78.5]:
        arrow(ax, x, y - 8.5, 46 + (x - 46) * 0.25, 44.5, lw=1.2,
              color=MGREY, ls=(0, (4, 3)))
    arrow(ax, 36.5, 40, 24.5, 66.5, lw=1.4, color=DGREY, rad=0.2)
    ax.text(25, 47, "redraft", fontsize=11, style="italic", color=DGREY,
            ha="center")
    ax.text(63, 55, "fail", fontsize=11, style="italic", color=DGREY,
            ha="center")
    box(ax, 50, 14, 88, 14,
        "caught by the gates: 3 lazy counterexamples · "
        "5 fabricated citations ·\n95 sort conflicts surfaced, "
        "then adjudicated",
        fs=12, fc=FGREY, ec=DGREY, lw=1.2)
    save(fig, "fig12-agent-gates.png")


# ---------------------------------------------------------------- fig13
def fig13():
    fig, ax = new_fig(8, 5.6)
    cx, cy = 50, 6
    for r, name, sub in [
        (78, "vaikharī", "uttered sound"),
        (54, "madhyamā", "inner articulation"),
        (30, "paśyantī", "unitary vision"),
    ]:
        ax.add_patch(Arc((cx, cy), 2 * r, 2 * r * 1.05, theta1=0,
                         theta2=180, edgecolor=BLACK, linewidth=1.8))
        ax.text(cx, cy + r * 1.05 - 9, f"{name} · {sub}", ha="center",
                fontsize=13, weight="bold", zorder=5,
                bbox=dict(facecolor="white", edgecolor="none",
                          pad=2.5))
    ax.plot([cx], [cy + 4], marker="o", color=BLACK, markersize=8)
    arrow(ax, 62, 16, 84, 52, lw=1.4, color=DGREY)
    ax.text(84, 58, "manifestation\n(outward)", fontsize=11,
            color=DGREY, ha="center")
    arrow(ax, 16, 52, 38, 16, lw=1.4, color=DGREY)
    ax.text(16, 58, "return\n(inward)", fontsize=11, color=DGREY,
            ha="center")
    save(fig, "fig13-levels-of-speech.png")


# ---------------------------------------------------------------- fig14
def fig14():
    fig, ax = new_fig(9.2, 5.6)
    trees = [
        (17, "akṣara",
         [("imperishable\nAbsolute (1.9)", ""),
          ("phoneme\n(1.18–22)", "")]),
        (50, "śabda",
         [("linguistic item\n(canonical)", ""),
          ("the Absolute\n(1.46)", "")]),
        (83, "sphoṭa",
         [("meaning-bearer\n(doctrine)", ""),
          ("first sound\n(phoneticians,\n1.102–106)", "")]),
    ]
    for cx, root, senses in trees:
        box(ax, cx, 82, 20, 11, root, fs=14, weight="bold", fc=FGREY)
        for dx, (label, _) in zip([-8.5, 8.5], senses):
            x = cx + dx
            arrow(ax, cx + dx * 0.4, 76, x, 58)
            box(ax, x, 44, 16, 24, label, fs=10.5)
    ax.text(50, 10, "one word, two registered senses: "
            "the homonym registry keeps them from colliding",
            ha="center", fontsize=12, style="italic", color=DGREY)
    save(fig, "fig14-homonym-splits.png")


if __name__ == "__main__":
    for f in [fig01, fig02, fig03, fig04, fig05, fig06, fig07, fig08,
              fig09, fig10, fig11, fig12, fig13, fig14]:
        f()
    print("done:", len(list(OUT.glob("fig*.png"))), "figures in", OUT)
