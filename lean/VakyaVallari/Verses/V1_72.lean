/- Verse 1.72 — generated from data/contracts/1.72.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_72

open VakyaVallari

def varna : Entity := ⟨"varṇa", Sorta.linguisticItem⟩
def pada : Entity := ⟨"pada", Sorta.linguisticItem⟩
def vakya : Entity := ⟨"vākyaṃ", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.relation "nasti-atiriktam" (Node.ent pada) (Node.ent varna)
    , Claim.relation "nasti-atiriktam" (Node.ent vakya) (Node.ent varna)
    , Claim.relation "nasti-atiriktam" (Node.ent vakya) (Node.ent pada) ]
  , denials := [ Claim.relation "asti-atiriktam" (Node.ent pada) (Node.ent varna)
    , Claim.relation "asti-atiriktam" (Node.ent vakya) (Node.ent varna)
    , Claim.relation "asti-atiriktam" (Node.ent vakya) (Node.ent pada) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "nasti-atiriktam" (Node.ent pada) (Node.ent varna)
    , Claim.relation "nasti-atiriktam" (Node.ent vakya) (Node.ent varna)
    , Claim.relation "nasti-atiriktam" (Node.ent vakya) (Node.ent pada) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Words emerge as novel linguistic entities with meaning-bearing properties distinct from their component phonemes.'
   Why rejected: Asserts pada asti-atiriktam varna (words exist as independent entities over and above phonemes), directly contradicting the verse's first claim na varṇavyatirekeṇa padamanyacca vidyate. This grants words a separate ontological status where the verse denies it. -/
def emergent_word_properties : Reading :=
  { claims := [ Claim.relation "asti-atiriktam" (Node.ent pada) (Node.ent varna) ] }
theorem emergent_word_properties_inadequate : ¬ contract.Adequate emergent_word_properties := by decide
#guard contract.contradicts emergent_word_properties = true

/- 'Sentences form holistic semantic wholes that cannot be decomposed back to individual words without loss of meaning.'
   Why rejected: Posits vakya asti-atiriktam pada (sentences as independent wholes over and above their word-components), contradicting the verse's second claim vākyaṃ varṇapadābhyāṃ ca vyatiriktaṃ na kiścana. The holistic unity it claims is exactly what the verse denies. -/
def holistic_sentence_structure : Reading :=
  { claims := [ Claim.relation "asti-atiriktam" (Node.ent vakya) (Node.ent pada) ] }
theorem holistic_sentence_structure_inadequate : ¬ contract.Adequate holistic_sentence_structure := by decide
#guard contract.contradicts holistic_sentence_structure = true

end Counterexamples

end VakyaVallari.Verses.V1_72
