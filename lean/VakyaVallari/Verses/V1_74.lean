/- Verse 1.74 — generated from data/contracts/1.74.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_74

open VakyaVallari

def vyavahara : Entity := ⟨"vyavahāra", Sorta.manifestation⟩
def darsana : Entity := ⟨"darśana", Sorta.cognition⟩
def amsa : Entity := ⟨"aṃśa", Sorta.linguisticItem⟩
def avayavi : Entity := ⟨"avayavī", Sorta.linguisticItem⟩
def artha : Entity := ⟨"artha", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent vyavahara) (Node.ent darsana)
    , Claim.predication "mukhya" amsa
    , Claim.predication "mukhya" avayavi
    , Claim.predication "vyavahara_siddhi" darsana
    , Claim.predication "viparyaya" amsa
    , Claim.predication "viparyaya" avayavi ]
  , denials := [ Claim.predication "vikranta" amsa
    , Claim.relation "nirnayaka" (Node.ent vyavahara) (Node.ent darsana)
    , Claim.identity vyavahara darsana ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent vyavahara) (Node.ent darsana)
    , Claim.predication "mukhya" amsa
    , Claim.predication "mukhya" avayavi
    , Claim.predication "viparyaya" amsa ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The part-primary school is definitively refuted by Bhartrhari; only the whole-primary view stands as valid metaphysics.'
   Why rejected: The verse presents both views symmetrically and the commentary explicitly states the part-primary view is 'not refuted, only outweighed.' The preference for the whole-primary view comes from a higher philosophical criterion (how the view coheres with meaning-conveyance), not from refutation of the part-view itself. This reading collapses outweighing into refutation, contradicting the commentary's careful distinction. -/
def refutation_of_parts_view : Reading :=
  { claims := [ Claim.predication "vikranta" amsa ] }
theorem refutation_of_parts_view_inadequate : ¬ contract.Adequate refutation_of_parts_view := by decide
#guard contract.contradicts refutation_of_parts_view = true

/- 'The choice between part-primary and whole-primary metaphysics is settled by grammatical evidence; whichever better fits the phenomena is the true metaphysical framework.'
   Why rejected: The commentary explicitly denies this: 'the choice between part-primacy and whole-primacy will not be settled by grammatical data, which both fit.' Both views equally satisfy the grammatical phenomena; the deciding criterion is meaning-conveyance, which operates at a higher level of analysis than grammatical fit. A reading that asserts grammatical data determines the metaphysical choice contradicts the commentary's methodological hierarchy. -/
def grammatical_determinism : Reading :=
  { claims := [ Claim.relation "nirnayaka" (Node.ent vyavahara) (Node.ent darsana) ] }
theorem grammatical_determinism_inadequate : ¬ contract.Adequate grammatical_determinism := by decide
#guard contract.contradicts grammatical_determinism = true

/- 'Bhartrhari remains indifferent between the two views and assigns no philosophical weight to either; both are equally valid and equally unimportant.'
   Why rejected: The commentary explicitly characterizes Bhartrhari's position as 'methodological, not indifferent' and states 'On that criterion the whole wins.' While both views work equally for linguistic practice, the commentary identifies a criterion (meaning-conveyance) that privileges the whole-primary view. A reading of complete indifference contradicts the commentary's assertion that there is a principled hierarchy among the views. -/
def indifference : Reading :=
  { claims := [ Claim.predication "sama_pratiṣṭha" darsana ] }
theorem indifference_inadequate : ¬ contract.Adequate indifference := by decide
#guard contract.licenses indifference = false

end Counterexamples

end VakyaVallari.Verses.V1_74
