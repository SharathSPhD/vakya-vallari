/- Verse 1.127 — generated from data/contracts/1.127.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_127

open VakyaVallari

def karta : Entity := ⟨"kartā", Sorta.manifestation⟩
def karya : Entity := ⟨"kārya", Sorta.manifestation⟩
def sabda_sakti : Entity := ⟨"śabda-śakti", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.relation "sadhana_divided" (Node.ent sabda_sakti) (Node.ent karya)
    , Claim.identity sabda_sakti karya
    , Claim.relation "gati" (Node.ent karta) (Node.ent karya) ]
  , denials := [ Claim.relation "sadhana" (Node.ent sabda_sakti) (Node.ent karya) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.identity sabda_sakti karya
    , Claim.relation "gati" (Node.ent karta) (Node.ent karya) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Word-power serves as a mediating instrument between agent and deed in both the divided and undivided states.'
   Why rejected: Asserts that the sadhana (mediation) relation persists universally, but the verse teaches a shift: in differentiation it mediates, in non-differentiation it IS the deed (no mediation). The commentary explicitly denies this: 'the word-power does not mediate the deed; it is it.' -/
def persistent_mediation : Reading :=
  { claims := [ Claim.relation "sadhana" (Node.ent sabda_sakti) (Node.ent karya) ] }
theorem persistent_mediation_inadequate : ¬ contract.Adequate persistent_mediation := by decide
#guard contract.contradicts persistent_mediation = true

/- 'Word-power is merely a useful property or tool that agents employ to accomplish their deeds.'
   Why rejected: Treats śabda-śakti as a dependent property rather than a fundamental power. This inverts the ontology: the identity axiom (sabda-sakti = karya) reveals word-power as the ultimate substance of action itself, not a tool. The sort error (property vs power) exposes the misreading. -/
def sabda_sakti_property : Entity := ⟨"śabda-śakti", Sorta.property⟩
def demote_power : Reading :=
  { claims := [ Claim.predication "dependent_instrument" sabda_sakti_property ] }
theorem demote_power_inadequate : ¬ contract.Adequate demote_power := by decide
#guard contract.licenses demote_power = false
theorem demote_power_sort_error : sabda_sakti_property ≠ sabda_sakti := by decide

end Counterexamples

end VakyaVallari.Verses.V1_127
