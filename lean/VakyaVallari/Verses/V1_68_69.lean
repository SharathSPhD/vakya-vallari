/- Verse 1.68-69 — generated from data/contracts/1.68-69.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_68_69

open VakyaVallari

def vyakti : Entity := ⟨"vyakti", Sorta.manifestation⟩
def jati : Entity := ⟨"jāti", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.predication "apparatus_component" vyakti
    , Claim.predication "apparatus_component" jati ]
  , denials := []
  , reported := [ Claim.relation "samsrsta" (Node.ent jati) (Node.ent vyakti)
    , Claim.relation "jati_pratyayita" (Node.ent jati) (Node.ent vyakti) ] }

-- pūrvapakṣa: this contract carries reported (non-endorsed) claims
#guard contract.doxographic = true

def accepted : Reading :=
  { claims := [ Claim.predication "apparatus_component" vyakti
    , Claim.predication "apparatus_component" jati
    , Claim.relation "samsrsta" (Node.ent jati) (Node.ent vyakti) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The form-universal (jāti) is the sole and sufficient basis for grammatical reference, with the individual form (vyakti) playing no essential role.'
   Why rejected: Directly contradicts the commentary's assertion that 'rule-stated language requires an apparatus of types and tokens' — an irreducible coordination. Denying vyakti's role violates the apparatus structure both reported positions affirm. -/
def jati_monopoly : Reading :=
  { claims := [ Claim.predication "sufficient_alone" jati ] }
theorem jati_monopoly_inadequate : ¬ contract.Adequate jati_monopoly := by decide
#guard contract.licenses jati_monopoly = false

/- 'The individual form (vyakti) and the class (jāti) play interchangeable roles in grammatical reference, or are functionally equivalent.'
   Why rejected: The verse's force rests on distinguishing two positions: position 1 assigns vyakti and jāti different roles (vyakti as name, jāti as connected operator), while position 2 assigns them mediated roles (vyakti as named-through-jāti). Conflating them erases the reported distinction, which the commentary emphasizes as the 'akrti/vyakti controversy'. -/
def conflated_positions : Reading :=
  { claims := [ Claim.identity vyakti jati ] }
theorem conflated_positions_inadequate : ¬ contract.Adequate conflated_positions := by decide
#guard contract.licenses conflated_positions = false

end Counterexamples

end VakyaVallari.Verses.V1_68_69
