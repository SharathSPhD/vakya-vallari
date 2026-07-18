/- Verse 1.12 — generated from data/contracts/1.12.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_12

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def rasa : Entity := ⟨"rasa", Sorta.absolute⟩
def jyotis : Entity := ⟨"jyotis", Sorta.absolute⟩
def vyakarana : Entity := ⟨"vyākaraṇa", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent sabda) (Node.ent rasa)
    , Claim.identity rasa jyotis
    , Claim.relation "adhigama" (Node.ent vyakarana) (Node.ent rasa) ]
  , denials := []
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent sabda) (Node.ent rasa)
    , Claim.identity rasa jyotis
    , Claim.relation "adhigama" (Node.ent vyakarana) (Node.ent rasa) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Grammar is one indirect approach among many possible paths to the highest essence.'
   Why rejected: The commentary is precise about grammar's uniqueness: 'other approaches may reach the light, but they go around. Grammar goes at it.' This rendering denies the directness (anjasa marga) that is the verse's defining claim, incorrectly demoting grammar to merely one option among many. -/
def grammar_as_indirect : Reading :=
  { claims := [ Claim.predication "paroksa" vyakarana ] }
theorem grammar_as_indirect_inadequate : ¬ contract.Adequate grammar_as_indirect := by decide
#guard contract.licenses grammar_as_indirect = false

/- 'The highest essence is merely a conventional appearance arising from conceptualization.'
   Why rejected: This reading projects a maya-theory onto the verse that the commentary explicitly rejects. The commentary states: 'Note that the verse does not say ordinary differentiated speech is false; it says it has an essence.' The essence (rasa) is identified with a 'light' (jyotis)—a real, intrinsic principle—not a conceptual construct. To treat rasa itself as mere appearance inverts the verse's teaching about reality and manifestation. -/
def rasa_as_appearance : Reading :=
  { claims := [ Claim.predication "maya" rasa ] }
theorem rasa_as_appearance_inadequate : ¬ contract.Adequate rasa_as_appearance := by decide
#guard contract.licenses rasa_as_appearance = false

end Counterexamples

end VakyaVallari.Verses.V1_12
