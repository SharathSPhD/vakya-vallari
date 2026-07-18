/- Verse 1.71 — generated from data/contracts/1.71.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_71

open VakyaVallari

def phoneme : Entity := ⟨"varṇa", Sorta.linguisticItem⟩
def word : Entity := ⟨"pada", Sorta.linguisticItem⟩
def ekatva : Entity := ⟨"ekatva", Sorta.property⟩
def sound_event : Entity := ⟨"dhvani", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.predication "ekatva" phoneme
    , Claim.predication "ekatva" word
    , Claim.relation "vivartate" (Node.ent phoneme) (Node.ent sound_event) ]
  , denials := [ Claim.identity phoneme sound_event ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "ekatva" phoneme
    , Claim.predication "ekatva" word ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Acoustic events are the true phonemes and words; different utterances produce different phonemic and word units.'
   Why rejected: Commits to crude token-physicalism, which the verse rejects. Phonemes and words are types (repeatables), not acoustic tokens. The numerical distinctness of acoustic events does not entail phonemic distinctness. -/
def token_physicalism : Reading :=
  { claims := [ Claim.identity phoneme sound_event ] }
theorem token_physicalism_inadequate : ¬ contract.Adequate token_physicalism := by decide
#guard contract.contradicts token_physicalism = true

/- 'Phonemes in different words are merely similar to one another; words in different sentences are merely similar.'
   Why rejected: Reduces the verse's core claim—identity recognized by competent speakers—to mere similarity. The entire doctrine depends on the 'a' being the same phoneme across contexts, not different-but-similar ones. -/
def similarity_not_sameness : Reading :=
  { claims := [ Claim.predication "sadṛśa" phoneme ] }
theorem similarity_not_sameness_inadequate : ¬ contract.Adequate similarity_not_sameness := by decide
#guard contract.licenses similarity_not_sameness = false

end Counterexamples

end VakyaVallari.Verses.V1_71
