/- Verse 1.116 — generated from data/contracts/1.116.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_116

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.absolute⟩
def sabda_suksma : Entity := ⟨"śabda (subtle form)", Sorta.absolute⟩
def vyajana : Entity := ⟨"vyajana", Sorta.linguisticItem⟩
def abhivyakti : Entity := ⟨"abhivyakti", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.predication "ajasra_vrtti" sabda
    , Claim.predication "anupalabdha" sabda
    , Claim.identity sabda sabda_suksma
    , Claim.relation "sva_nimitta" (Node.ent vyajana) (Node.ent abhivyakti)
    , Claim.relation "abhivyakti" (Node.ent vyajana) (Node.ent sabda)
    , Claim.predication "satya_anupalabdhi_anutthita" sabda_suksma ]
  , denials := [ Claim.relation "utpatti" (Node.ent vyajana) (Node.ent sabda) ] }

def accepted : Reading :=
  { claims := [ Claim.predication "ajasra_vrtti" sabda
    , Claim.predication "anupalabdha" sabda
    , Claim.relation "abhivyakti" (Node.ent vyajana) (Node.ent sabda) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The utterance produces the word from nothing.'
   Why rejected: Asserts production (utpatti) of sabda by vyajana. The commentary explicitly denies this: 'one does not produce what never pauses; one occasions its detection.' The correct category is manifestation (abhivyakti), not creation. -/
def productive_utterance : Reading :=
  { claims := [ Claim.relation "utpatti" (Node.ent vyajana) (Node.ent sabda) ] }
theorem productive_utterance_inadequate : ¬ contract.Adequate productive_utterance := by decide
#guard contract.contradicts productive_utterance = true

/- 'The word ceases to exist when not articulated, only coming into being through utterance.'
   Why rejected: Treats unmanifested sabda as ontologically non-existent (asat) rather than epistemically imperceptible. The commentary explicitly rules this out: 'Its non-appearance is thus an epistemic fact, not an ontological absence.' Sabda eternally operates; non-apprehension reflects limitation of perception, not lack of being. -/
def sabda_asat : Entity := ⟨"śabda (non-existent)", Sorta.property⟩
def episodic_word_nature : Reading :=
  { claims := [ Claim.predication "asat" sabda_asat ] }
theorem episodic_word_nature_inadequate : ¬ contract.Adequate episodic_word_nature := by decide
#guard contract.licenses episodic_word_nature = false

/- 'The word pauses or ceases entirely when not being articulated.'
   Why rejected: Denies the axiom of ajasra-vrtti (unceasing functioning). The verse and commentary insist: 'sabda meant here is ajasra-vrtti, of unceasing operation' and 'one does not produce what never pauses.' This contradicts the foundational claim of eternal subtle operation. -/
def no_perpetual_subtle_operation : Reading :=
  { claims := [ Claim.predication "intermittent_vrtti" sabda ] }
theorem no_perpetual_subtle_operation_inadequate : ¬ contract.Adequate no_perpetual_subtle_operation := by decide
#guard contract.licenses no_perpetual_subtle_operation = false

end Counterexamples

end VakyaVallari.Verses.V1_116
