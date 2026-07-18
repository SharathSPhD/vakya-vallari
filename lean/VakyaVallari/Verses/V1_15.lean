/- Verse 1.15 — generated from data/contracts/1.15.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_15

open VakyaVallari

def sabda_akrti : Entity := ⟨"śabdākṛti", Sorta.linguisticItem⟩
def artha_jati : Entity := ⟨"arthajāti", Sorta.property⟩
def vyakarana : Entity := ⟨"vyākaraṇa", Sorta.linguisticItem⟩
def vidya : Entity := ⟨"vidyā", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent sabda_akrti) (Node.ent artha_jati)
    , Claim.relation "parayana" (Node.ent vyakarana) (Node.ent vidya)
    , Claim.relation "asraya" (Node.ent sabda_akrti) (Node.ent artha_jati) ]
  , denials := []
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent sabda_akrti) (Node.ent artha_jati)
    , Claim.relation "parayana" (Node.ent vyakarana) (Node.ent vidya) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The forms of words rest upon the classes of objects.'
   Why rejected: Reverses the direction of the grounding relation: the commentary is explicit that object-classes are grounded in word-forms, not the reverse. This reversal undermines the entire argument for grammar's primacy among sciences. -/
def reversed_grounding : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent artha_jati) (Node.ent sabda_akrti) ] }
theorem reversed_grounding_inadequate : ¬ contract.Adequate reversed_grounding := by decide
#guard contract.licenses reversed_grounding = false

/- 'Word-forms and object-classes have a similar structure, just as grammar and other sciences are similarly structured.'
   Why rejected: Treats the 'just as...so' as mere surface analogy without causal force. The commentary insists the relation is 'stronger than analogy': the grounding of classes in words logically entails the priority of grammar among sciences. -/
def mere_analogy : Reading :=
  { claims := [ Claim.relation "sadrsya" (Node.ent sabda_akrti) (Node.ent artha_jati) ] }
theorem mere_analogy_inadequate : ¬ contract.Adequate mere_analogy := by decide
#guard contract.licenses mere_analogy = false

/- 'Objects possess their class-structure and generality intrinsically, independent of linguistic categorization; words merely reflect this natural structure.'
   Why rejected: Contradicts the commentary's core ontological claim: generality is not an intrinsic property of objects but is 'borrowed from language rather than found in things.' This reading treats language as derivative (reflecting nature) rather than constitutive (grounding categories). -/
def intrinsic_generality : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent artha_jati) (Node.ent sabda_akrti) ] }
theorem intrinsic_generality_inadequate : ¬ contract.Adequate intrinsic_generality := by decide
#guard contract.licenses intrinsic_generality = false

end Counterexamples

end VakyaVallari.Verses.V1_15
