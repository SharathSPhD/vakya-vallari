/- Machinery gates for the VakyaVallari kernel.
   These examples must compile (and `#guard`s must evaluate to true) for the
   kernel to count as working. The build is the test. -/
import VakyaVallari.Ontology
import VakyaVallari.Adequacy

namespace VakyaVallari.Tests

open VakyaVallari

/-- Entities carry ontological sorts. -/
def brahman : Entity := ⟨"brahman", Sorta.absolute⟩
def sabdatattva : Entity := ⟨"śabdatattva", Sorta.absolute⟩
/-- The naive reading's referent: "linguistic structure" as a mere property. -/
def lingStructure : Entity := ⟨"śabdatattva", Sorta.property⟩

/-- Identity across the same sort is stateable and provable when names match. -/
example : brahman = ⟨"brahman", Sorta.absolute⟩ := rfl

/-- Cross-sort identity is stateable but decidably FALSE — the C-TV failure
    mode as a mechanical fact, not a comment. -/
theorem cross_sort_identity_refuted : sabdatattva ≠ lingStructure := by decide

/-- Sambandha nesting: a relation can itself be a relatum (paramparā). -/
def kalasakti : Entity := ⟨"kālaśakti", Sorta.power⟩
def jagat : Entity := ⟨"jagat", Sorta.manifestation⟩
def firstOrder : Node := Node.rel "vivartate" (Node.ent brahman) (Node.ent jagat)
def secondOrder : Node :=
  Node.rel "nimitta" (Node.ent kalasakti) firstOrder

#guard Node.depth secondOrder = 2
#guard Node.depth (Node.ent brahman) = 0

/- Typed absence carries its counterpositive and locus as data. -/
def noParinama : Abhava :=
  { pratiyogin := Node.rel "parinamate" (Node.ent brahman) (Node.ent jagat)
  , adhikarana := Node.ent brahman }

#guard noParinama.pratiyogin ≠ noParinama.adhikarana

/- Raghunātha: the absence of an absence is the presence itself. -/
#guard Presence.ofAbhava (Abhava.ofAbhava noParinama) =
       Presence.present noParinama.pratiyogin

/-- Adequacy: a reading is adequate iff every claim it makes is entailed by
    the contract's axioms (closure includes identity symmetry). -/
def axioms : List Claim :=
  [ Claim.identity sabdatattva brahman
  , Claim.relation "vivartate" (Node.ent brahman) (Node.ent jagat) ]

def goodReading : Reading :=
  { claims := [ Claim.identity brahman sabdatattva ] }  -- symmetric form

def badReading : Reading :=
  { claims := [ Claim.identity lingStructure brahman ] }

#guard Adequate.check axioms goodReading = true
#guard Adequate.check axioms badReading = false

theorem good_is_adequate : Adequate axioms goodReading := by decide
theorem bad_is_not_adequate : ¬ Adequate axioms badReading := by decide

/- Contracts distinguish claims that are merely UNLICENSED (not entailed)
   from claims the commentary explicitly CONTRADICTS (denials). -/
def contract : Contract :=
  { axioms := axioms
  , denials := [ Claim.relation "parinamate" (Node.ent brahman) (Node.ent jagat) ] }

def parinamaReading : Reading :=
  { claims := [ Claim.relation "parinamate" (Node.ent brahman) (Node.ent jagat) ] }

#guard contract.licenses goodReading = true
#guard contract.contradicts goodReading = false
#guard contract.contradicts parinamaReading = true

theorem good_contract_adequate : contract.Adequate goodReading := by decide
theorem parinama_contradicted : ¬ contract.Adequate parinamaReading := by decide

end VakyaVallari.Tests
