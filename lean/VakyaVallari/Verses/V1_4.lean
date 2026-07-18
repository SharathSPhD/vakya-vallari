/- Verse 1.4 — generated from data/contracts/1.4.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_4

open VakyaVallari

def brahman : Entity := ⟨"brahman", Sorta.absolute⟩
def bhoktr : Entity := ⟨"bhoktṛ", Sorta.manifestation⟩
def bhoktavya : Entity := ⟨"bhoktavya", Sorta.manifestation⟩
def bhoga : Entity := ⟨"bhoga", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.predication "eka" brahman
    , Claim.relation "sthiti" (Node.ent brahman) (Node.ent bhoktr)
    , Claim.relation "sthiti" (Node.ent brahman) (Node.ent bhoktavya)
    , Claim.relation "sthiti" (Node.ent brahman) (Node.ent bhoga)
    , Claim.predication "sakti" bhoktr
    , Claim.predication "sakti" bhoktavya ]
  , denials := [ Claim.relation "parinama" (Node.ent brahman) (Node.ent bhoktr)
    , Claim.relation "parinama" (Node.ent brahman) (Node.ent bhoktavya)
    , Claim.relation "parinama" (Node.ent brahman) (Node.ent bhoga) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "eka" brahman
    , Claim.relation "sthiti" (Node.ent brahman) (Node.ent bhoktr)
    , Claim.relation "sthiti" (Node.ent brahman) (Node.ent bhoktavya)
    , Claim.relation "sthiti" (Node.ent brahman) (Node.ent bhoga) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Brahman creates and produces the three forms of experiencer, experienced, and experiencing as separate entities.'
   Why rejected: Asserts parinama (real transformation or production) between brahman and the three, which the commentary explicitly denies: 'Bhartrhari's claim is not that Brahman produces these three but that its sthiti — its abiding, its standing-as — simply is them.' The three are not products but constitute brahman's very standing-as, not the result of transformation. -/
def brahman_produces_three : Reading :=
  { claims := [ Claim.relation "parinama" (Node.ent brahman) (Node.ent bhoktr) ] }
theorem brahman_produces_three_inadequate : ¬ contract.Adequate brahman_produces_three := by decide
#guard contract.contradicts brahman_produces_three = true

/- 'The experiencer, experienced, and experiencing are merely attributes or properties of brahman, not actual modes of its being.'
   Why rejected: Treats the three as properties (sort: property) rather than as manifestations (sort: manifestation). This demotes their ontological status. The commentary emphasizes that the three ARE the sthiti of brahman—its actual standing-as—not mere descriptive properties of it. The sort error breaks the axiom. -/
def bhoktr_property : Entity := ⟨"bhoktṛ (property)", Sorta.property⟩
def three_as_properties : Reading :=
  { claims := [ Claim.relation "sthiti" (Node.ent brahman) (Node.ent bhoktr_property) ] }
theorem three_as_properties_inadequate : ¬ contract.Adequate three_as_properties := by decide
#guard contract.licenses three_as_properties = false

end Counterexamples

end VakyaVallari.Verses.V1_4
