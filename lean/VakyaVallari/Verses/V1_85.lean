/- Verse 1.85 — generated from data/contracts/1.85.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_85

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def chandana : Entity := ⟨"chandanah", Sorta.linguisticItem⟩
def antarala : Entity := ⟨"antarāla", Sorta.property⟩
def asaktih : Entity := ⟨"aśaktiḥ", Sorta.property⟩
def grahanam : Entity := ⟨"grahaṇam", Sorta.cognition⟩
def pratipattar : Entity := ⟨"pratipattṛ", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.predication "asata" chandana
    , Claim.relation "vivartate" (Node.ent sabda) (Node.ent chandana)
    , Claim.identity asaktih grahanam
    , Claim.predication "na-siddha-bhava" chandana ]
  , denials := [ Claim.predication "pratibandha" asaktih ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "asata" chandana
    , Claim.relation "vivartate" (Node.ent sabda) (Node.ent chandana)
    , Claim.identity asaktih grahanam ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- "The apprehender's incapacity to perceive parts directly is an obstacle to grasping the word."
   Why rejected: Treats incapacity as a defect or barrier rather than as the productive mechanism itself. The commentary explicitly inverts this: the incapacity IS the means, not an impediment to it. This denial appears in the axioms. -/
def obstacle_model : Reading :=
  { claims := [ Claim.predication "pratibandha" asaktih ] }
theorem obstacle_model_inadequate : ¬ contract.Adequate obstacle_model := by decide
#guard contract.contradicts obstacle_model = true

/- 'The phonemic parts truly exist as distinct entities within the interval before final ascertainment.'
   Why rejected: Asserts the phonemic parts as real (sat), whereas the verse and commentary insist they are asata (non-existent) — a productive appearance, but not substantial reality. This reverses the sort: chandana would be an absolute rather than a manifestation. -/
def chandana_real : Entity := ⟨"chandanah", Sorta.absolute⟩
def real_parts : Reading :=
  { claims := [ Claim.predication "sat" chandana_real ] }
theorem real_parts_inadequate : ¬ contract.Adequate real_parts := by decide
#guard contract.licenses real_parts = false
theorem real_parts_sort_error : chandana_real ≠ chandana := by decide

end Counterexamples

end VakyaVallari.Verses.V1_85
