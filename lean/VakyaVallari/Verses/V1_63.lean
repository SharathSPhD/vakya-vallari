/- Verse 1.63 — generated from data/contracts/1.63.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_63

open VakyaVallari

def upamana : Entity := ⟨"upamāna", Sorta.manifestation⟩
def upameya : Entity := ⟨"upameyā", Sorta.manifestation⟩
def samanya : Entity := ⟨"sāmānya", Sorta.property⟩
def dharma : Entity := ⟨"dharma", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "samanya" upamana
    , Claim.predication "samanya" upameya
    , Claim.predication "dharma" upamana ]
  , denials := [ Claim.predication "dharma" upameya
    , Claim.identity upamana upameya ] }

def accepted : Reading :=
  { claims := [ Claim.predication "samanya" upamana
    , Claim.predication "samanya" upameya
    , Claim.predication "dharma" upamana ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The standard of comparison and what is compared are identical in their essential properties, differing only accidentally.'
   Why rejected: Ignores the dharma (distinguishing property) which the verse says must characterize the standard and distinguish it from the target. Without dharma, the two would collapse into identity, defeating the purpose of analogy. The commentary is explicit: 'else the two would not be two.' -/
def samanya_only : Reading :=
  { claims := [ Claim.identity upamana upameya ] }
theorem samanya_only_inadequate : ¬ contract.Adequate samanya_only := by decide
#guard contract.contradicts samanya_only = true

/- 'What is compared retains a further property that the standard of comparison lacks.'
   Why rejected: The verse and commentary are clear that it is the upamana (standard) that always retains the dharma; the compared item (upameya) lacks it. This reading reverses the asymmetry that makes comparison intelligible. The commentary states: 'the standard always retains a dharma the compared item lacks'. -/
def reversed_dharma : Reading :=
  { claims := [ Claim.predication "dharma" upameya ] }
theorem reversed_dharma_inadequate : ¬ contract.Adequate reversed_dharma := by decide
#guard contract.contradicts reversed_dharma = true

/- 'The residual difference between the standard and what is compared is a defect that weakens the analogy.'
   Why rejected: The commentary explicitly rejects this: 'Residual disanalogy is thus not a defect of similes but a condition of their possibility.' The dharma that distinguishes the standard is not a weakness but a necessity for the comparison to function without collapsing into claimed identity. -/
def disanalogy_defect : Reading :=
  { claims := [ Claim.predication "defect" dharma ] }
theorem disanalogy_defect_inadequate : ¬ contract.Adequate disanalogy_defect := by decide
#guard contract.licenses disanalogy_defect = false

end Counterexamples

end VakyaVallari.Verses.V1_63
