/- Verse 1.151 — generated from data/contracts/1.151.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_151

open VakyaVallari

def bala : Entity := ⟨"bāla", Sorta.cognition⟩
def avyakta : Entity := ⟨"avyaktaṃ", Sorta.linguisticItem⟩
def vyakta : Entity := ⟨"vyakte", Sorta.linguisticItem⟩
def amba : Entity := ⟨"amba", Sorta.linguisticItem⟩
def tad_vida : Entity := ⟨"tad-vidām", Sorta.property⟩
def niscaya : Entity := ⟨"niścayaḥ", Sorta.cognition⟩
def mediation : Entity := ⟨"antarala", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "utter_indistinctly" bala
    , Claim.relation "mediated_inference" (Node.ent avyakta) (Node.ent vyakta)
    , Claim.predication "niscaya_arising" niscaya
    , Claim.relation "knower_cognition" (Node.ent tad_vida) (Node.ent vyakta) ]
  , denials := [ Claim.predication "direct_signification" avyakta ] }

def accepted : Reading :=
  { claims := [ Claim.predication "utter_indistinctly" bala
    , Claim.relation "mediated_inference" (Node.ent avyakta) (Node.ent vyakta) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- "The child's indistinct utterance directly and independently signifies the distinct form, without requiring the hearer's inference."
   Why rejected: Violates the commentary's explicit teaching that 'no one thinks the infant's syllables signify in their own right'. The mediation through inference is constitutive, not incidental. Confusing it treats the avyakta as an autonomous signifier rather than a gateway. -/
def direct_signification_error : Reading :=
  { claims := [ Claim.predication "direct_signification" avyakta ] }
theorem direct_signification_error_inadequate : ¬ contract.Adequate direct_signification_error := by decide
#guard contract.contradicts direct_signification_error = true

/- 'The hearers become certain about the indistinct utterance itself, as if the blurred syllables were the target of knowledge.'
   Why rejected: The commentary insists 'certainty arises *about the distinct form*; the hearers pass through the blur to the word the child is reaching for, and understanding happens there, at the vyakta, not at the noise.' Placing certainty at the avyakta inverts the epistemic structure. -/
def certainty_at_utterance : Reading :=
  { claims := [ Claim.predication "niscaya_about_utterance" avyakta ] }
theorem certainty_at_utterance_inadequate : ¬ contract.Adequate certainty_at_utterance := by decide
#guard contract.licenses certainty_at_utterance = false

end Counterexamples

end VakyaVallari.Verses.V1_151
