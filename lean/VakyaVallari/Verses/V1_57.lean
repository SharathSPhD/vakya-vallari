/- Verse 1.57 — generated from data/contracts/1.57.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_57

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def sabdarupa : Entity := ⟨"śabdarūpa", Sorta.property⟩
def artha : Entity := ⟨"artha", Sorta.manifestation⟩
def indriya : Entity := ⟨"indriya", Sorta.power⟩
def visaya : Entity := ⟨"viṣaya", Sorta.manifestation⟩
def pratyaya : Entity := ⟨"pratyaya", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.predication "pratyayaka" sabda
    , Claim.predication "pratyayya" sabda
    , Claim.relation "apeksa" (Node.ent artha) (Node.ent sabda)
    , Claim.relation "prakasayati" (Node.ent indriya) (Node.ent visaya) ]
  , denials := [ Claim.relation "prakasayati" (Node.ent sabda) (Node.ent artha) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "prakasayati" (Node.ent indriya) (Node.ent visaya) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The word conveys meaning through illumination, like a sense organ - it need not itself be apprehended for its meaning to be determined.'
   Why rejected: The verse explicitly establishes a disanalogy: sense organs illuminate their objects without themselves being grasped, while words require their own apprehension to convey meaning. The word is unique precisely in being both conveyor and conveyed. -/
def word_as_sense_organ : Reading :=
  { claims := [ Claim.relation "prakasayati" (Node.ent sabda) (Node.ent artha) ] }
theorem word_as_sense_organ_inadequate : ¬ contract.Adequate word_as_sense_organ := by decide
#guard contract.contradicts word_as_sense_organ = true

/- 'Both words and sense organs must be apprehended by consciousness to convey their meanings - they share the same structure as pratyayaka and pratyayya.'
   Why rejected: The verse emphasizes through 'one does not see one's seeing' that sense organs illuminate without themselves being grasped, precisely what makes words different. Words are unique in being both conveyor and conveyed, whereas sense organs are merely pratyayaka. -/
def sense_organs_also_pratyayya : Reading :=
  { claims := [ Claim.predication "pratyayya" indriya ] }
theorem sense_organs_also_pratyayya_inadequate : ¬ contract.Adequate sense_organs_also_pratyayya := by decide
#guard contract.licenses sense_organs_also_pratyayya = false

end Counterexamples

end VakyaVallari.Verses.V1_57
