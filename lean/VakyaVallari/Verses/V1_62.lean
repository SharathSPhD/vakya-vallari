/- Verse 1.62 — generated from data/contracts/1.62.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_62

open VakyaVallari

def guna : Entity := ⟨"guṇa", Sorta.linguisticItem⟩
def karya : Entity := ⟨"kārya", Sorta.power⟩
def artha : Entity := ⟨"artha", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "paratantra" guna
    , Claim.relation "na_yujyate" (Node.ent karya) (Node.ent guna)
    , Claim.relation "parikalpyate" (Node.ent karya) (Node.ent artha) ]
  , denials := []
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "paratantra" guna
    , Claim.relation "na_yujyate" (Node.ent karya) (Node.ent guna)
    , Claim.relation "parikalpyate" (Node.ent karya) (Node.ent artha) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Qualities, being dependent on substances, do not undergo grammatical operations directly.'
   Why rejected: Shifts guna from a grammatical category (constituent, stem in compound) to a metaphysical one (quality-substance relation). The sort error—guna as property rather than linguistic item—breaks the verse's argument about how grammar works with subordinate linguistic elements. -/
def guna_quality : Entity := ⟨"guṇa", Sorta.property⟩
def quality_not_element : Reading :=
  { claims := [ Claim.predication "paratantra" guna_quality ] }
theorem quality_not_element_inadequate : ¬ contract.Adequate quality_not_element := by decide
#guard contract.licenses quality_not_element = false
theorem quality_not_element_sort_error : guna_quality ≠ guna := by decide

/- 'Grammatical operations directly apply to dependent elements without semantic mediation.'
   Why rejected: Contradicts the verse's core claim by asserting that operations do join dependent elements directly. This ignores the parikalpyate (construing) that the verse establishes—the connection is preserved, not eliminated, but redirected through artha (meaning). -/
def direct_attachment : Reading :=
  { claims := [ Claim.relation "yujyate" (Node.ent karya) (Node.ent guna) ] }
theorem direct_attachment_inadequate : ¬ contract.Adequate direct_attachment := by decide
#guard contract.licenses direct_attachment = false

end Counterexamples

end VakyaVallari.Verses.V1_62
