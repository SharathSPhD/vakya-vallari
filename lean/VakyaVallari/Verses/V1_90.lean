/- Verse 1.90 — generated from data/contracts/1.90.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_90

open VakyaVallari

def vakya : Entity := ⟨"vākya", Sorta.linguisticItem⟩
def buddhi : Entity := ⟨"buddhi", Sorta.cognition⟩
def bhagavagraha : Entity := ⟨"bhāgāvagraha", Sorta.power⟩
def sphota : Entity := ⟨"sphota", Sorta.linguisticItem⟩
def bhaga : Entity := ⟨"bhāga", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "pravartate" (Node.ent buddhi) (Node.ent bhagavagraha)
    , Claim.predication "anyatha" bhaga
    , Claim.relation "vivartate" (Node.ent bhagavagraha) (Node.ent sphota) ]
  , denials := [ Claim.predication "nitya" bhaga ] }

def accepted : Reading :=
  { claims := [ Claim.relation "pravartate" (Node.ent buddhi) (Node.ent bhagavagraha)
    , Claim.relation "vivartate" (Node.ent bhagavagraha) (Node.ent sphota) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Cognition directly grasps the undivided whole meaning without intermediate part-seizure.'
   Why rejected: Bypasses the necessary intermediate stage of bhāgāvagraha (part-seizure) that the commentary emphasizes. This reverses the directional flow and violates the explicit sequence of the verse. -/
def direct_whole_grasp : Reading :=
  { claims := [ Claim.relation "vivartate" (Node.ent buddhi) (Node.ent sphota) ] }
theorem direct_whole_grasp_inadequate : ¬ contract.Adequate direct_whole_grasp := by decide
#guard contract.licenses direct_whole_grasp = false

/- 'The part-seizures constitute the final and permanent grasp of meaning.'
   Why rejected: Directly contradicts the commentary's explicit statement that part-graspings are 'destined to be superseded when the vakya-sphota is seized whole'. Part-grasps are provisional scaffolding, not endpoint. -/
def permanent_parts : Reading :=
  { claims := [ Claim.predication "nitya" bhaga ] }
theorem permanent_parts_inadequate : ¬ contract.Adequate permanent_parts := by decide
#guard contract.contradicts permanent_parts = true

/- 'The sentence (vākya) is the final object of comprehension rather than the sphota.'
   Why rejected: Confuses the manifestation (vākya) with its ontological ground. The commentary establishes that part-grasps are transcended by sphota seizure, making sphota the true endpoint. -/
def vakya_absolute : Entity := ⟨"vākya", Sorta.absolute⟩
def sentence_as_final : Reading :=
  { claims := [ Claim.relation "vivartate" (Node.ent bhagavagraha) (Node.ent vakya_absolute) ] }
theorem sentence_as_final_inadequate : ¬ contract.Adequate sentence_as_final := by decide
#guard contract.licenses sentence_as_final = false
theorem sentence_as_final_sort_error : vakya_absolute ≠ vakya := by decide

end Counterexamples

end VakyaVallari.Verses.V1_90
