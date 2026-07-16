/- Core ontology for commentary-driven translation validation.

   Navya-Nyāya-inspired, adapted honestly to Lean 4's type theory:
   - Entities carry ontological sorts; identity across different sorts is
     stateable but decidably false (the C-TV failure mode, mechanized).
   - `Node` gives relations-as-relata: paramparā-sambandha via unbounded
     nesting.
   - `Abhava` is typed absence: counterpositive (pratiyogin) and locus
     (adhikaraṇa) as structured data. Raghunātha's doctrine that the absence
     of an absence is the presence itself is a computing equation, not prose.
-/

namespace VakyaVallari

/-- Ontological sorts for the Vākyapadīya's world. `Sorta` (not `Sort`,
    which Lean reserves). -/
inductive Sorta where
  | absolute        -- svatantra ontological ground (brahman, śabdatattva)
  | power           -- śakti (kālaśakti, ...)
  | manifestation   -- vivarta-level phenomena (jagat, artha-bhāva)
  | linguisticItem  -- empirical speech units (dhvani, pada, vākya)
  | property        -- dharma, mere attributes
  | cognition       -- pratibhā, jñāna
deriving DecidableEq, Repr

structure Entity where
  name : String
  sort : Sorta
deriving DecidableEq, Repr

/-- Relational graph node. A relation is itself a node, so relations can be
    relata of further relations without bound (paramparā-sambandha). -/
inductive Node where
  | ent : Entity → Node
  | rel : String → Node → Node → Node
deriving DecidableEq, Repr

/-- Nesting depth: 0 for a bare entity, 1 + deepest relatum for a relation. -/
def Node.depth : Node → Nat
  | .ent _ => 0
  | .rel _ a b => 1 + max a.depth b.depth

/-- Typed absence: what is absent (counterpositive) and where (locus). -/
structure Abhava where
  pratiyogin : Node
  adhikarana : Node
deriving DecidableEq, Repr

/-- Reify an absence as a node, so it can be a counterpositive itself. -/
def Abhava.toNode (a : Abhava) : Node :=
  .rel "abhāva" a.pratiyogin a.adhikarana

/-- The absence *of an absence* (same locus). -/
def Abhava.ofAbhava (a : Abhava) : Abhava :=
  { pratiyogin := a.toNode, adhikarana := a.adhikarana }

/-- Presence-or-absence verdict at a locus. -/
inductive Presence where
  | present : Node → Presence
  | absent : Node → Node → Presence   -- pratiyogin, locus
deriving DecidableEq, Repr

/-- Evaluate an absence. Double negation computes away: the absence whose
    counterpositive is itself an absence of `p` yields the presence of `p`
    (abhāvasya abhāvaḥ bhāva eva). -/
def Presence.ofAbhava (a : Abhava) : Presence :=
  match a.pratiyogin with
  | .rel "abhāva" p _ => .present p
  | n => .absent n a.adhikarana

/-- A property delimited by a delimitor at a locus (avacchedaka). The
    delimitor restricts *under which aspect* the property qualifies the
    locus — the device that keeps Navya-Nyāya statements exact. -/
structure Avacchinna where
  dharma : String
  avacchedaka : Entity
  asraya : Entity
deriving DecidableEq, Repr

end VakyaVallari
