/- Verse 1.83 — generated from data/contracts/1.83.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_83

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def svarupa : Entity := ⟨"svarūpa", Sorta.property⟩
def pratyaya : Entity := ⟨"pratyaya", Sorta.cognition⟩
def grahana : Entity := ⟨"grahaṇa", Sorta.cognition⟩
def dhvani : Entity := ⟨"dhvani", Sorta.linguisticItem⟩
def avadharana : Entity := ⟨"avadharaṇa", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.predication "anupakhyeya" pratyaya
    , Claim.relation "grahana-anuguna" (Node.ent pratyaya) (Node.ent grahana)
    , Claim.relation "terminates" (Node.ent pratyaya) (Node.ent avadharana)
    , Claim.relation "ascertains" (Node.ent avadharana) (Node.ent svarupa) ]
  , denials := [ Claim.relation "summation" (Node.ent avadharana) (Node.ent pratyaya) ] }

def accepted : Reading :=
  { claims := [ Claim.predication "anupakhyeya" pratyaya
    , Claim.relation "grahana-anuguna" (Node.ent pratyaya) (Node.ent grahana)
    , Claim.relation "ascertains" (Node.ent avadharana) (Node.ent svarupa) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- "The word's form is understood as a gradual accumulation of the meanings of its successive phonemes."
   Why rejected: Treats avadharana as a summation of individual pratyayas, which the commentary explicitly rejects. The unity of the object is surrendered, and the spontaneity of comprehension (the all-at-once click) is lost. -/
def composite_grasp : Reading :=
  { claims := [ Claim.relation "summation" (Node.ent avadharana) (Node.ent pratyaya) ] }
theorem composite_grasp_inadequate : ¬ contract.Adequate composite_grasp := by decide
#guard contract.contradicts composite_grasp = true

/- 'Each intermediate stage in learning the word can be separately named and reported.'
   Why rejected: Directly contradicts the commentary's characterization of intermediate cognitions as anupakhyeya. Sort error: treats pratyaya as explicitly reportable when the text insists they are not separately reportable. -/
def pratyaya_reportable : Entity := ⟨"pratyaya", Sorta.property⟩
def reportable_cognitions : Reading :=
  { claims := [ Claim.predication "pakhyeya" pratyaya_reportable ] }
theorem reportable_cognitions_inadequate : ¬ contract.Adequate reportable_cognitions := by decide
#guard contract.licenses reportable_cognitions = false
theorem reportable_cognitions_sort_error : pratyaya_reportable ≠ pratyaya := by decide

end Counterexamples

end VakyaVallari.Verses.V1_83
