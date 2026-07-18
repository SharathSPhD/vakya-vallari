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
  { axioms := []
  , denials := []
  , reported := [ Claim.relation "avibhagena" (Node.ent grahana) (Node.ent sphota)
    , Claim.predication "asamvedya" dhvani
    , Claim.predication "svatantra" dhvani ] }

-- pūrvapakṣa: this contract carries reported (non-endorsed) claims
#guard contract.doxographic = true

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

/- 'Sphota (meaning) manifests independently of sound; sound is dispensable to the cognition of word-meaning.'
   Why rejected: All three positions presuppose that sound (dhvani) plays a constitutive role in the grahana (apprehension-and-manifestation process), whether inseparable from, inferred from, or independently of sphota. Eliminating sound's role abandons the phenomenological problem the verse addresses: what is the relationship between sound and word-form in linguistic experience? -/
def sphota_autonomous : Entity := ⟨"sphota", Sorta.linguisticItem⟩
def meaning_without_sound : Reading :=
  { claims := [ Claim.relation "independent_manifestation" (Node.ent grahana) (Node.ent sphota_autonomous) ] }
theorem meaning_without_sound_inadequate : ¬ contract.Adequate meaning_without_sound := by decide
#guard contract.licenses meaning_without_sound = false

/- 'In the asamvedya view, sound is non-existent or not real; meaning manifests entirely without any acoustic substrate or vehicle.'
   Why rejected: Asamvedya means 'never itself an object of awareness'—an epistemic claim about perception—not an ontological assertion that sound is non-existent. The commentary clarifies: sound is 'a pure vehicle, doing its manifesting work entirely offstage, inferred by theorists but absent from experience.' Sound still functions and exists; it simply escapes perceptual grasp. Confusing the epistemic claim with ontological negation severs the acoustic substrate that all three positions presuppose to play a constitutive role in manifestation. -/
def dhvani_nonexistent : Entity := ⟨"dhvani", Sorta.property⟩
def asamvedya_as_nonexistence : Reading :=
  { claims := [ Claim.predication "asamvedya" dhvani_nonexistent ] }
theorem asamvedya_as_nonexistence_inadequate : ¬ contract.Adequate asamvedya_as_nonexistence := by decide
#guard contract.licenses asamvedya_as_nonexistence = false
theorem asamvedya_as_nonexistence_sort_error : dhvani_nonexistent ≠ dhvani := by decide

end Counterexamples

end VakyaVallari.Verses.V1_81
