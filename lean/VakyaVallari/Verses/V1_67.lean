/- Verse 1.67 — generated from data/contracts/1.67.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_67

open VakyaVallari

def samjna_sabda : Entity := ⟨"saṃjñā-śabda", Sorta.linguisticItem⟩
def prathamaa : Entity := ⟨"prathamā", Sorta.property⟩
def genitive : Entity := ⟨"genitive case", Sorta.property⟩
def artha : Entity := ⟨"artha", Sorta.property⟩
def vyatireka : Entity := ⟨"vyatireka", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "has_meaning" samjna_sabda
    , Claim.relation "justified_by_meaning" (Node.ent prathamaa) (Node.ent samjna_sabda)
    , Claim.relation "arises_from_meaning" (Node.ent vyatireka) (Node.ent artha)
    , Claim.relation "expresses_moments" (Node.ent prathamaa) (Node.ent genitive) ]
  , denials := [ Claim.relation "separate_derivations" (Node.ent prathamaa) (Node.ent genitive) ] }

def accepted : Reading :=
  { claims := [ Claim.predication "has_meaning" samjna_sabda
    , Claim.relation "justified_by_meaning" (Node.ent prathamaa) (Node.ent samjna_sabda)
    , Claim.relation "arises_from_meaning" (Node.ent vyatireka) (Node.ent artha)
    , Claim.relation "expresses_moments" (Node.ent prathamaa) (Node.ent genitive) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The nominative and genitive case-endings are independently justified grammatical forms with no intrinsic connection to each other.'
   Why rejected: Treats the two cases as grammatically arbitrary rather than expressing two logical moments of a single naming act. The commentary explicitly states they express unified structure through the naming relation. -/
def unrelated_cases_error : Reading :=
  { claims := [ Claim.relation "separate_derivations" (Node.ent prathamaa) (Node.ent genitive) ] }
theorem unrelated_cases_error_inadequate : ¬ contract.Adequate unrelated_cases_error := by decide
#guard contract.contradicts unrelated_cases_error = true

/- "Only the nominative case-ending applies to the name-word; the genitive 'of this' is not a valid grammatical form."
   Why rejected: The verse explicitly states the differentiation arises from the meaning. Denying the genitive violates the unified structure of naming that both cases express. -/
def samjna_sabda_nom_only : Entity := ⟨"saṃjñā-śabda", Sorta.linguisticItem⟩
def genitive_denied : Reading :=
  { claims := [ Claim.predication "nominative_only" samjna_sabda_nom_only ] }
theorem genitive_denied_inadequate : ¬ contract.Adequate genitive_denied := by decide
#guard contract.licenses genitive_denied = false

end Counterexamples

end VakyaVallari.Verses.V1_67
