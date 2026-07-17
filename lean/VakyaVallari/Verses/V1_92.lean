/- Verse 1.92 — generated from data/contracts/1.92.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_92

open VakyaVallari

def unit : Entity := ⟨"unit", Sorta.linguisticItem⟩
def bhaga : Entity := ⟨"bhāga", Sorta.manifestation⟩
def rupabheda : Entity := ⟨"rūpabheda", Sorta.property⟩
def dhvani : Entity := ⟨"dhvani", Sorta.linguisticItem⟩
def krama : Entity := ⟨"krama", Sorta.property⟩
def abhyupaya : Entity := ⟨"abhyupāya", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.predication "bhagavat" unit
    , Claim.relation "arises_from" (Node.ent rupabheda) (Node.ent dhvani)
    , Claim.predication "nirbhaga" unit
    , Claim.relation "is_abhyupaya" (Node.ent bhaga) (Node.ent abhyupaya) ]
  , denials := [ Claim.relation "inherent_to" (Node.ent krama) (Node.ent unit) ] }

def accepted : Reading :=
  { claims := [ Claim.predication "bhagavat" unit
    , Claim.relation "arises_from" (Node.ent rupabheda) (Node.ent dhvani)
    , Claim.predication "nirbhaga" unit
    , Claim.relation "is_abhyupaya" (Node.ent bhaga) (Node.ent abhyupaya) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Linguistic units possess real internal parts arranged in sequence.'
   Why rejected: Ignores the dilemma: both horns deny intrinsic divisibility. The first horn locates sequence in the manifesting stream (not the unit); the second denies that parts belong to the unit at all—they are posited as a device. This reading mistakes the analyst's projection for the unit's actual structure. -/
def intrinsic_divisibility : Reading :=
  { claims := [ Claim.relation "inherent_to" (Node.ent krama) (Node.ent unit) ] }
theorem intrinsic_divisibility_inadequate : ¬ contract.Adequate intrinsic_divisibility := by decide
#guard contract.contradicts intrinsic_divisibility = true

/- 'Only the partless horn (nirbhaga) resolves the part-whole paradox; the parted horn (bhagavat) leaves real divisibility intact.'
   Why rejected: Misses that Bhartrhari uses both horns symmetrically: each denies real internal sequence to the unit. The first locates it in the stream; the second demotes it to device. Neither concedes intrinsic divisibility. A reading that privileges one horn over the other fractures the solution. -/
def asymmetric_dilemma : Reading :=
  { claims := [ Claim.relation "is_essential" (Node.ent bhaga) (Node.ent unit) ] }
theorem asymmetric_dilemma_inadequate : ¬ contract.Adequate asymmetric_dilemma := by decide
#guard contract.licenses asymmetric_dilemma = false

end Counterexamples

end VakyaVallari.Verses.V1_92
