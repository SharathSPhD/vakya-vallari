/- Verse 1.35 — generated from data/contracts/1.35.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_35

open VakyaVallari

def vijnana : Entity := ⟨"vijñāna", Sorta.cognition⟩
def abhyasa : Entity := ⟨"abhyāsa", Sorta.power⟩
def mani : Entity := ⟨"maṇi", Sorta.manifestation⟩
def rupya : Entity := ⟨"rūpya", Sorta.manifestation⟩
def anumana : Entity := ⟨"anumāna", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.relation "jayate" (Node.ent abhyasa) (Node.ent vijnana)
    , Claim.predication "asamakhyeyatva" vijnana
    , Claim.predication "ananumanika" vijnana ]
  , denials := [ Claim.predication "anumanikat" vijnana
    , Claim.predication "samakhyeyatva" vijnana ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "jayate" (Node.ent abhyasa) (Node.ent vijnana)
    , Claim.predication "asamakhyeyatva" vijnana
    , Claim.predication "ananumanika" vijnana ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- "The connoisseur's knowledge of gems is derived from inference based on marks or signs."
   Why rejected: Claims the knowledge is inferential (anumanikat), which the verse explicitly denies and the commentary emphasizes by noting the connoisseur cannot articulate the inferential mark (linga). -/
def inferential_connoisseurship : Reading :=
  { claims := [ Claim.predication "anumanikat" vijnana ] }
theorem inferential_connoisseurship_inadequate : ¬ contract.Adequate inferential_connoisseurship := by decide
#guard contract.contradicts inferential_connoisseurship = true

/- 'The expert can communicate their knowledge of gems to others through explicit principles or reasoning.'
   Why rejected: Claims the knowledge is communicable (samakhyeyatva), contradicting the verse's explicit statement asamakhyeyam and the commentary's emphasis on tacit knowledge that outruns articulation. -/
def communicable_connoisseurship : Reading :=
  { claims := [ Claim.predication "samakhyeyatva" vijnana ] }
theorem communicable_connoisseurship_inadequate : ¬ contract.Adequate communicable_connoisseurship := by decide
#guard contract.contradicts communicable_connoisseurship = true

end Counterexamples

end VakyaVallari.Verses.V1_35
