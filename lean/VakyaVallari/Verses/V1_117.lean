/- Verse 1.117 — generated from data/contracts/1.117.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_117

open VakyaVallari

def sakti : Entity := ⟨"śakti", Sorta.power⟩
def prana : Entity := ⟨"prāṇa", Sorta.manifestation⟩
def buddhi : Entity := ⟨"buddhi", Sorta.manifestation⟩
def sthanas : Entity := ⟨"sthānāḥ", Sorta.manifestation⟩
def bheda : Entity := ⟨"bheda", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent sakti) (Node.ent prana)
    , Claim.relation "asraya" (Node.ent sakti) (Node.ent buddhi)
    , Claim.predication "eka" sakti
    , Claim.relation "vivartate" (Node.ent sakti) (Node.ent bheda) ]
  , denials := [ Claim.relation "parinamate" (Node.ent sakti) (Node.ent bheda) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "eka" sakti
    , Claim.relation "asraya" (Node.ent sakti) (Node.ent prana)
    , Claim.relation "asraya" (Node.ent sakti) (Node.ent buddhi)
    , Claim.relation "vivartate" (Node.ent sakti) (Node.ent bheda) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The vital power in the breath and the intellectual power in the intellect are two distinct forces that successively coordinate in producing differentiated speech.'
   Why rejected: Treats the two stations as separate powers rather than expressions of one sakti. The commentary explicitly forecloses this dualist misreading: 'mind-word and breath-word are not successive entities handed a baton but one power viewed at two stations.' -/
def sakti_prana : Entity := ⟨"prāṇa-śakti", Sorta.power⟩
def sakti_buddhi : Entity := ⟨"buddhi-śakti", Sorta.power⟩
def dualist_hand_off : Reading :=
  { claims := [ Claim.relation "kramena" (Node.ent sakti_prana) (Node.ent sakti_buddhi) ] }
theorem dualist_hand_off_inadequate : ¬ contract.Adequate dualist_hand_off := by decide
#guard contract.licenses dualist_hand_off = false

/- 'The power actually transforms and modifies as it moves from the intellect to the breath to the articulation places, producing real changes in its own substance.'
   Why rejected: Asserts parinama (real transformation) rather than vivarta (appearance without change). The commentary rules this out explicitly: 'its motion from one to the other being appearance, not transit.' -/
def real_transformation : Reading :=
  { claims := [ Claim.relation "parinamate" (Node.ent sakti) (Node.ent bheda) ] }
theorem real_transformation_inadequate : ¬ contract.Adequate real_transformation := by decide
#guard contract.contradicts real_transformation = true

/- 'Differentiation is something that happens to the power as it moves through the articulation places, an inevitable process the power undergoes passively.'
   Why rejected: Reverses the agency relation: treats the power as passively suffering differentiation rather than actively presenting it. The commentary insists: 'it is something the power *presents*, not something it suffers.' The power has agency, not passivity. -/
def passive_production : Reading :=
  { claims := [ Claim.predication "bhunjate" sakti ] }
theorem passive_production_inadequate : ¬ contract.Adequate passive_production := by decide
#guard contract.licenses passive_production = false

end Counterexamples

end VakyaVallari.Verses.V1_117
