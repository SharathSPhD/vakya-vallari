/- Verse 1.82 — generated from data/contracts/1.82.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_82

open VakyaVallari

def anuvaka : Entity := ⟨"anuvāka", Sorta.linguisticItem⟩
def shloka : Entity := ⟨"śloka", Sorta.linguisticItem⟩
def grantha : Entity := ⟨"grantha", Sorta.linguisticItem⟩
def sodhatva : Entity := ⟨"soḍhatva", Sorta.property⟩
def adhyayana : Entity := ⟨"adhyayana", Sorta.power⟩
def avabodha : Entity := ⟨"avabodha", Sorta.cognition⟩
def sphota : Entity := ⟨"sphota", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.relation "janayati" (Node.ent adhyayana) (Node.ent sodhatva)
    , Claim.predication "anavartya" grantha
    , Claim.relation "asraya" (Node.ent sphota) (Node.ent avabodha)
    , Claim.predication "avikriya" grantha ]
  , denials := [ Claim.predication "pratyavrtti" grantha ] }

def accepted : Reading :=
  { claims := [ Claim.relation "janayati" (Node.ent adhyayana) (Node.ent sodhatva)
    , Claim.predication "anavartya" grantha ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Each act of recitation produces a new text instance, so the tenth recitation presents a tenth distinct text.'
   Why rejected: Directly contradicts the verse's core claim that the same text (anavartya) is possessed across repetitions. The commentary explicitly rejects the idea that pratyavrtti (new discernment) applies to the text itself—mastery multiplies but the text does not. This error confuses the property (sodhatva) that grows with the object (grantha) that remains. -/
def text_multiplied_by_repetition : Reading :=
  { claims := [ Claim.predication "pratyavrtti" grantha ] }
theorem text_multiplied_by_repetition_inadequate : ¬ contract.Adequate text_multiplied_by_repetition := by decide
#guard contract.contradicts text_multiplied_by_repetition = true

/- 'The being-mastered (sodhatva) is itself a new linguistic item generated at each repetition.'
   Why rejected: Renders sodhatva as a linguistic item rather than a property of cognition. The verse sets up a contrast: while sodhatva changes and accumulates across repetitions, the text (grantha) remains fixed—exactly parallel to how sphota's apprehension ripens while the sphota itself stays unchanged. Confusing sodhatva's sort breaks this parallel structure. -/
def sodhatva_item : Entity := ⟨"soḍhatva", Sorta.linguisticItem⟩
def mastery_is_new_object : Reading :=
  { claims := [ Claim.identity sodhatva_item grantha ] }
theorem mastery_is_new_object_inadequate : ¬ contract.Adequate mastery_is_new_object := by decide
#guard contract.licenses mastery_is_new_object = false
theorem mastery_is_new_object_sort_error : sodhatva_item ≠ sodhatva := by decide

/- 'The repeated sounds themselves create or generate the sphota, rather than ripening apprehension of it.'
   Why rejected: The verse and commentary explicitly state that the sounds' strokes ripen (paripakva-like) the apprehension of one unchanging sphota—sphota is not generated but better grasped. This misreading attributes a causal-generative power to the sounds that the manifestation theory explicitly denies: the sphota is absolute, the sounds are its vehicles of audition, and repetition matures understanding, not the object. -/
def sound_strokes_create_sphota : Reading :=
  { claims := [ Claim.relation "janayati" (Node.ent adhyayana) (Node.ent sphota) ] }
theorem sound_strokes_create_sphota_inadequate : ¬ contract.Adequate sound_strokes_create_sphota := by decide
#guard contract.licenses sound_strokes_create_sphota = false

end Counterexamples

end VakyaVallari.Verses.V1_82
