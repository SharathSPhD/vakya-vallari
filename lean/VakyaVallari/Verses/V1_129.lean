/- Verse 1.129 — generated from data/contracts/1.129.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_129

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def nimitte : Entity := ⟨"nimitte", Sorta.property⟩
def alata : Entity := ⟨"alata", Sorta.manifestation⟩
def cakra : Entity := ⟨"cakra", Sorta.manifestation⟩
def vastvakara : Entity := ⟨"vastvākāra", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.predication "atyantam_atathabhute" nimitte
    , Claim.predication "drsyate" vastvakara
    , Claim.relation "nirupayati" (Node.ent sabda) (Node.ent vastvakara) ]
  , denials := [ Claim.relation "parinama" (Node.ent alata) (Node.ent cakra) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "atyantam_atathabhute" nimitte
    , Claim.relation "nirupayati" (Node.ent sabda) (Node.ent vastvakara) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The whirling torch through perceptual contact naturally produces the circular form.'
   Why rejected: Attributes form-production to perception (the alata/torch), contradicting the verse's explicit point that it is the word which supplies the cakra. Reverses the locus of determination from utterance to perceptual sensation. -/
def perception_produces_circle : Reading :=
  { claims := [ Claim.relation "parinama" (Node.ent alata) (Node.ent cakra) ] }
theorem perception_produces_circle_inadequate : ¬ contract.Adequate perception_produces_circle := by decide
#guard contract.contradicts perception_produces_circle = true

/- 'When a real and adequate ground exists, language determines how we apprehend the resulting object.'
   Why rejected: Misses the verse's core teaching: it is precisely where the ground is NOT adequate (utterly otherwise) that language's independent form-giving power is most evident. This reading makes the word merely descriptive rather than constitutive of form. -/
def nimitte_yathartha : Entity := ⟨"nimitte", Sorta.property⟩
def ground_sufficient_for_reality : Reading :=
  { claims := [ Claim.predication "yatharthabhute" nimitte_yathartha ] }
theorem ground_sufficient_for_reality_inadequate : ¬ contract.Adequate ground_sufficient_for_reality := by decide
#guard contract.licenses ground_sufficient_for_reality = false

/- 'Perception of the moving light directly enables or constitutes the manifestation of the circular form-determination.'
   Why rejected: Misattributes to perception the form-constitutive function that the verse assigns to the word. The verse's structure (Perception supplies moving light; the word supplies the cakra) establishes that perception and word supply different aspects—perception does not supply the vastvakara, which is what the word alone accomplishes. -/
def perception_mediates_form_manifestation : Reading :=
  { claims := [ Claim.relation "nimitta_drsyata" (Node.ent alata) (Node.ent vastvakara) ] }
theorem perception_mediates_form_manifestation_inadequate : ¬ contract.Adequate perception_mediates_form_manifestation := by decide
#guard contract.licenses perception_mediates_form_manifestation = false

end Counterexamples

end VakyaVallari.Verses.V1_129
