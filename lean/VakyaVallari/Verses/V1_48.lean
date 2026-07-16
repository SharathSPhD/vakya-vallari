/- Verse 1.48 — generated from data/contracts/1.48.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_48

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def nada : Entity := ⟨"nāda", Sorta.manifestation⟩
def krama : Entity := ⟨"krama", Sorta.property⟩
def brahman : Entity := ⟨"brahman", Sorta.absolute⟩
def jagat : Entity := ⟨"jagat", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.predication "akrama" sabda
    , Claim.predication "krama-janman" nada
    , Claim.relation "vivartate" (Node.ent sabda) (Node.ent nada)
    , Claim.relation "vivartate" (Node.ent brahman) (Node.ent jagat) ]
  , denials := [ Claim.relation "parinamate" (Node.ent sabda) (Node.ent nada) ] }

def accepted : Reading :=
  { claims := [ Claim.predication "krama-janman" nada
    , Claim.predication "akrama" sabda
    , Claim.relation "vivartate" (Node.ent sabda) (Node.ent nada) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The word transforms into audible sound in sequence.'
   Why rejected: Asserts parinamate (real transformation) where the verse uses vivarta (apparent division). The iva (as if) marks this as appearing divided without actual transformation. -/
def real_transformation : Reading :=
  { claims := [ Claim.relation "parinamate" (Node.ent sabda) (Node.ent nada) ] }
theorem real_transformation_inadequate : ¬ contract.Adequate real_transformation := by decide
#guard contract.contradicts real_transformation = true

/- 'The word is made up of sequential phonemes that together form meaning.'
   Why rejected: Denies akrama by treating sabda as having temporal parts (earlier and later). The commentary insists the meaning-bearer must be present whole, not composed of sequential parts. -/
def sabda_parts : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def sequential_word : Reading :=
  { claims := [ Claim.predication "krama-janman" sabda_parts ] }
theorem sequential_word_inadequate : ¬ contract.Adequate sequential_word := by decide
#guard contract.licenses sequential_word = false

end Counterexamples

end VakyaVallari.Verses.V1_48
