/- Verse 1.81 — generated from data/contracts/1.81.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_81

open VakyaVallari

def dhvani : Entity := ⟨"dhvani", Sorta.linguisticItem⟩
def sphota : Entity := ⟨"sphota", Sorta.linguisticItem⟩
def grahana : Entity := ⟨"grahana", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.relation "avibhagena" (Node.ent grahana) (Node.ent sphota)
    , Claim.predication "asamvedya" dhvani
    , Claim.predication "svatantra" dhvani ]
  , denials := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "avibhagena" (Node.ent grahana) (Node.ent sphota)
    , Claim.predication "asamvedya" dhvani
    , Claim.predication "svatantra" dhvani ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Sound is a primary and independently perceivable physical sensation, not necessarily connected to word-meaning or manifestation.'
   Why rejected: This ignores that all three positions in the verse presuppose sound's manifestive function. The phenomenological dispute concerns how manifestation structures experience, not whether manifestation occurs. Treating sound as a simple sensory datum misses the theoretical frame Bhartrhari establishes. -/
def dhvani_naive : Entity := ⟨"dhvani", Sorta.property⟩
def sound_as_primary : Reading :=
  { claims := [ Claim.predication "svatantra" dhvani_naive ] }
theorem sound_as_primary_inadequate : ¬ contract.Adequate sound_as_primary := by decide
#guard contract.licenses sound_as_primary = false
theorem sound_as_primary_sort_error : dhvani_naive ≠ dhvani := by decide

end Counterexamples

end VakyaVallari.Verses.V1_81
