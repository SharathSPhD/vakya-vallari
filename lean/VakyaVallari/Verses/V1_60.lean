/- Verse 1.60 — generated from data/contracts/1.60.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_60

open VakyaVallari

def agni_sabda : Entity := ⟨"agni-śabda", Sorta.linguisticItem⟩
def agni_sruti : Entity := ⟨"agni-śruti", Sorta.linguisticItem⟩
def fire : Entity := ⟨"agni", Sorta.absolute⟩

def contract : Contract :=
  { axioms := [ Claim.relation "nibandhana" (Node.ent agni_sabda) (Node.ent agni_sabda)
    , Claim.relation "sambandha" (Node.ent agni_sabda) (Node.ent agni_sruti)
    , Claim.predication "atmadesananukulata" agni_sabda ]
  , denials := [ Claim.relation "abhidheya" (Node.ent agni_sabda) (Node.ent fire) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "nibandhana" (Node.ent agni_sabda) (Node.ent agni_sabda)
    , Claim.relation "sambandha" (Node.ent agni_sabda) (Node.ent agni_sruti) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- "The word 'agni' achieves self-reference by ultimately designating fire itself."
   Why rejected: The commentary explicitly states: 'the item the rule mentions is not fire and not any particular utterance—it is the word-form itself.' This reading inverts the designatum, placing fire where the word-form should be. -/
def fire_as_designatum : Reading :=
  { claims := [ Claim.relation "abhidheya" (Node.ent agni_sabda) (Node.ent fire) ] }
theorem fire_as_designatum_inadequate : ¬ contract.Adequate fire_as_designatum := by decide
#guard contract.contradicts fire_as_designatum = true

/- "A particular phonetic event 'agni' is self-grounded: this token refers to and depends upon itself."
   Why rejected: Confuses the linguistic word-form (a stable type recognized by grammar) with a particular utterance-token (an individual sound event). The verse's nibandhana applies to the word-form as a linguistic item, not to tokens. Treats a linguistic item as a mere phonetic property. -/
def agni_utterance : Entity := ⟨"agni-utterance", Sorta.property⟩
def utterance_token_circularity : Reading :=
  { claims := [ Claim.relation "nibandhana" (Node.ent agni_sabda) (Node.ent agni_utterance) ] }
theorem utterance_token_circularity_inadequate : ¬ contract.Adequate utterance_token_circularity := by decide
#guard contract.licenses utterance_token_circularity = false

end Counterexamples

end VakyaVallari.Verses.V1_60
