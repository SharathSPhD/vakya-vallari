/- Verse 1.23 — generated from data/contracts/1.23.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_23

open VakyaVallari

def sambandha : Entity := ⟨"śabdārthasaṃbandha", Sorta.power⟩
def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def artha : Entity := ⟨"artha", Sorta.power⟩
def nityatva : Entity := ⟨"nityatva", Sorta.property⟩
def samaya : Entity := ⟨"samaya", Sorta.power⟩
def veda : Entity := ⟨"veda", Sorta.linguisticItem⟩
def apaurusheya : Entity := ⟨"apauruṣheya", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "nityah" sambandha
    , Claim.predication "transmitted" sambandha
    , Claim.predication "parampara_siddhah" nityatva
    , Claim.relation "bhavya" (Node.ent nityatva) (Node.ent apaurusheya)
    , Claim.relation "samaya_bhavya_krita" (Node.ent samaya) (Node.ent apaurusheya) ]
  , denials := [ Claim.predication "samaya" sambandha
    , Claim.predication "krita" sambandha ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "nityah" sambandha
    , Claim.predication "transmitted" sambandha ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The relation between words and their meanings is established by convention or agreement.'
   Why rejected: Directly asserts sambandha is samaya, which the commentary explicitly identifies as the Naiyayika position. This contradicts both the verse's claim of nityatva and Bhartrhari's position. Conventional relations have authors and beginnings, undermining Vedic authorilessness. -/
def conventional_relation : Reading :=
  { claims := [ Claim.predication "samaya" sambandha ] }
theorem conventional_relation_inadequate : ¬ contract.Adequate conventional_relation := by decide
#guard contract.contradicts conventional_relation = true

/- 'The word-meaning relations were established by the great seers as an authoritative innovation.'
   Why rejected: Claims sambandha is krita (made/authored), which the commentary explicitly denies: 'the bond between a word and what it means is not made.' This contradicts the core doctrine that the relations are eternal and uncreated. -/
def authored_relations : Reading :=
  { claims := [ Claim.predication "krita" sambandha ] }
theorem authored_relations_inadequate : ¬ contract.Adequate authored_relations := by decide
#guard contract.contradicts authored_relations = true

end Counterexamples

end VakyaVallari.Verses.V1_23
