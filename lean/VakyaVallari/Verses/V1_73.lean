/- Verse 1.73 — generated from data/contracts/1.73.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_73

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def varna : Entity := ⟨"varṇa", Sorta.linguisticItem⟩
def vakya : Entity := ⟨"vākya", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.predication "avidyante" varna
    , Claim.predication "niravayava" varna
    , Claim.relation "apraviveka" (Node.ent sabda) (Node.ent vakya)
    , Claim.predication "mukhya" vakya
    , Claim.relation "apoddhara" (Node.ent sabda) (Node.ent vakya) ]
  , denials := [ Claim.predication "vidyante" varna
    , Claim.relation "praviveka" (Node.ent sabda) (Node.ent vakya) ] }

def accepted : Reading :=
  { claims := [ Claim.predication "avidyante" varna
    , Claim.predication "niravayava" varna
    , Claim.relation "apraviveka" (Node.ent sabda) (Node.ent vakya) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Phonemes are the ultimate units of speech and are directly found in words.'
   Why rejected: Asserts that phonemes exist in words as foundational units, directly contradicting the verse's claim that phonemes are not found in the functioning word. The verse explicitly denies this via the doctrine of sphota—meaning is conveyed without phonemic grain. -/
def phonemes_foundational : Reading :=
  { claims := [ Claim.predication "vidyante" varna ] }
theorem phonemes_foundational_inadequate : ¬ contract.Adequate phonemes_foundational := by decide
#guard contract.contradicts phonemes_foundational = true

/- 'Words are absolutely distinct and independent units, wholly separate from sentences.'
   Why rejected: Asserts absolute separation (praviveka) between words and sentences, which the verse explicitly rejects. The commentary establishes that words are apoddhara (extracts) from the sentence and have no absolute separation from it. -/
def word_independence : Reading :=
  { claims := [ Claim.relation "praviveka" (Node.ent sabda) (Node.ent vakya) ] }
theorem word_independence_inadequate : ¬ contract.Adequate word_independence := by decide
#guard contract.contradicts word_independence = true

/- 'Phonemes themselves can be endlessly subdivided into smaller and smaller parts.'
   Why rejected: Asserts that phonemes have parts (savayava), contradicting the verse's explicit claim that phonemes have no parts (niravayava). The commentary blocks infinite regress by denying sub-parts at the phonemic level. -/
def varna_decomposable : Entity := ⟨"varṇa", Sorta.linguisticItem⟩
def infinite_partitivity : Reading :=
  { claims := [ Claim.predication "savayava" varna_decomposable ] }
theorem infinite_partitivity_inadequate : ¬ contract.Adequate infinite_partitivity := by decide
#guard contract.licenses infinite_partitivity = false

end Counterexamples

end VakyaVallari.Verses.V1_73
