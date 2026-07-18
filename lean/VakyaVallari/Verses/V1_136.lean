/- Verse 1.136 — generated from data/contracts/1.136.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_136

open VakyaVallari

def vivaksa : Entity := ⟨"vivakṣā", Sorta.cognition⟩
def pararthya : Entity := ⟨"pārārthya", Sorta.property⟩
def linga : Entity := ⟨"linga", Sorta.linguisticItem⟩
def artha : Entity := ⟨"artha", Sorta.manifestation⟩
def tarka : Entity := ⟨"tarka", Sorta.power⟩
def nyaya : Entity := ⟨"nyāya", Sorta.linguisticItem⟩
def form : Entity := ⟨"rūpa", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.predication "vivaksite" vivaksa
    , Claim.relation "asraya" (Node.ent pararthya) (Node.ent nyaya)
    , Claim.relation "vyanjaka" (Node.ent linga) (Node.ent artha)
    , Claim.predication "bahuvidha" nyaya
    , Claim.relation "vibhajyate" (Node.ent tarka) (Node.ent nyaya) ]
  , denials := [ Claim.relation "samarpita" (Node.ent form) (Node.ent artha) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "vivaksite" vivaksa
    , Claim.relation "asraya" (Node.ent pararthya) (Node.ent nyaya)
    , Claim.relation "vyanjaka" (Node.ent linga) (Node.ent artha)
    , Claim.predication "bahuvidha" nyaya
    , Claim.relation "vibhajyate" (Node.ent tarka) (Node.ent nyaya) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Form alone exhaustively determines meaning through intention, subordination, and marking.'
   Why rejected: Asserts that form can directly establish artha without judgment, contradicting the verse's core point that gap between form and meaning requires tarka (reasoning) to bridge it. Denies the necessity of interpretive principles. -/
def form_complete_meaning : Reading :=
  { claims := [ Claim.relation "samarpita" (Node.ent form) (Node.ent artha) ] }
theorem form_complete_meaning_inadequate : ¬ contract.Adequate form_complete_meaning := by decide
#guard contract.contradicts form_complete_meaning = true

/- 'The meaning through its mark delivers an indicatory mark, reversing the relation.'
   Why rejected: Reverses the direction: linga does not derive from artha but rather artha is only reached through linga. This inverts the foundational hermeneutical relation the verse establishes. -/
def reversed_linga : Reading :=
  { claims := [ Claim.relation "vyanjaka" (Node.ent artha) (Node.ent linga) ] }
theorem reversed_linga_inadequate : ¬ contract.Adequate reversed_linga := by decide
#guard contract.licenses reversed_linga = false

/- 'The interpretive principles are self-evident and require no reasoning to apply.'
   Why rejected: Denies that tarka (reasoning/judgment) articulates and applies the nyaya (maxims), contradicting the explicit statement that tarkena pravibhajyate — reasoning articulates them. Makes tarka superfluous. -/
def vivaksa_selfevident : Entity := ⟨"vivakṣā", Sorta.power⟩
def tarka_unnecessary : Reading :=
  { claims := [ Claim.predication "svatahpp" vivaksa_selfevident ] }
theorem tarka_unnecessary_inadequate : ¬ contract.Adequate tarka_unnecessary := by decide
#guard contract.licenses tarka_unnecessary = false
theorem tarka_unnecessary_sort_error : vivaksa_selfevident ≠ vivaksa := by decide

end Counterexamples

end VakyaVallari.Verses.V1_136
