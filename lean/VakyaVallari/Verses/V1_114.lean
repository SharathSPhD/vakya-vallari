/- Verse 1.114 — generated from data/contracts/1.114.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_114

open VakyaVallari

def vayu : Entity := ⟨"vāyu", Sorta.power⟩
def antahkarana_tattva : Entity := ⟨"antaḥkaraṇa-tattva", Sorta.absolute⟩
def tejas : Entity := ⟨"tejas", Sorta.power⟩
def dharma : Entity := ⟨"dharma", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent vayu) (Node.ent antahkarana_tattva)
    , Claim.predication "samavista" vayu
    , Claim.predication "vivartate" vayu ]
  , denials := [ Claim.relation "parinamate" (Node.ent vayu) (Node.ent tejas) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent vayu) (Node.ent antahkarana_tattva)
    , Claim.predication "samavista" vayu
    , Claim.predication "vivartate" vayu ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Ordinary breath, having become associated with mental consciousness, gains the qualities of the mind and appears as visible wind.'
   Why rejected: Treats vayu as mere physical substance (manifestation sort) rather than a subtle power. The sort error makes this reading incompatible with the axioms, which require vayu as power. -/
def vayu_physical : Entity := ⟨"vāyu", Sorta.manifestation⟩
def physical_breath_mechanics : Reading :=
  { claims := [ Claim.predication "samavista" vayu_physical ] }
theorem physical_breath_mechanics_inadequate : ¬ contract.Adequate physical_breath_mechanics := by decide
#guard contract.licenses physical_breath_mechanics = false
theorem physical_breath_mechanics_sort_error : vayu_physical ≠ vayu := by decide

/- 'The breath transforms into the luminous/visual element through the agency of the fire.'
   Why rejected: Asserts parinamate (real transformation) of vayu into tejas, which the commentary explicitly rejects: vivarta indicates appearance without loss of identity, not elemental transmutation. -/
def element_transmutation : Reading :=
  { claims := [ Claim.relation "parinamate" (Node.ent vayu) (Node.ent tejas) ] }
theorem element_transmutation_inadequate : ¬ contract.Adequate element_transmutation := by decide
#guard contract.contradicts element_transmutation = true

/- "The inner organ, having come to rest upon the breath as its base, is pervaded by the breath's qualities."
   Why rejected: Reverses the asraya relation: it is the breath that takes the inner organ as its resort, not the inverse. The reversed relation is not entailed by the axioms. -/
def reversed_dependency : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent antahkarana_tattva) (Node.ent vayu) ] }
theorem reversed_dependency_inadequate : ¬ contract.Adequate reversed_dependency := by decide
#guard contract.licenses reversed_dependency = false

end Counterexamples

end VakyaVallari.Verses.V1_114
