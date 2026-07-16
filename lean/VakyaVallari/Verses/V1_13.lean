/- Verse 1.13 — generated from data/contracts/1.13.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_13

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def arthapravritattva : Entity := ⟨"arthapravṛttitattvā", Sorta.absolute⟩
def vyakaran : Entity := ⟨"vyākaraṇa", Sorta.linguisticItem⟩
def tattvavabodh : Entity := ⟨"tattvāvabodhaḥ", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.relation "nibandhanam" (Node.ent sabda) (Node.ent arthapravritattva)
    , Claim.relation "asraya" (Node.ent vyakaran) (Node.ent tattvavabodh) ]
  , denials := [ Claim.relation "asraya" (Node.ent sabda) (Node.ent tattvavabodh) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "nibandhanam" (Node.ent sabda) (Node.ent arthapravritattva)
    , Claim.relation "asraya" (Node.ent vyakaran) (Node.ent tattvavabodh) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The realities of activity provide the foundation for words; language is a consequence of objective structures.'
   Why rejected: Reverses the priority. The verse insists that words alone (sabda eva) are the nibandhanam of the realities underlying activity, not the reverse. -/
def reversed_grounding : Reading :=
  { claims := [ Claim.relation "nibandhanam" (Node.ent arthapravritattva) (Node.ent sabda) ] }
theorem reversed_grounding_inadequate : ¬ contract.Adequate reversed_grounding := by decide
#guard contract.licenses reversed_grounding = false

/- 'Words can be understood independently of grammar; their essence is directly accessible without linguistic analysis.'
   Why rejected: Directly contradicts the second premise. The commentary explicitly states there is no grasp (nasti) of word-essence apart from grammar, making vyakaran the essential support (asraya). -/
def grammar_optional : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent sabda) (Node.ent tattvavabodh) ] }
theorem grammar_optional_inadequate : ¬ contract.Adequate grammar_optional := by decide
#guard contract.contradicts grammar_optional = true

end Counterexamples

end VakyaVallari.Verses.V1_13
