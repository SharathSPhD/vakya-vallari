/- Verse 1.51 — generated from data/contracts/1.51.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_51

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def kratu : Entity := ⟨"kratu", Sorta.power⟩
def anda_bhava : Entity := ⟨"aṇḍabhāva", Sorta.manifestation⟩
def vrtti : Entity := ⟨"vṛtti", Sorta.property⟩
def kriya : Entity := ⟨"kriyā", Sorta.manifestation⟩
def kramam : Entity := ⟨"kramam", Sorta.property⟩
def bhaga : Entity := ⟨"bhāga", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.identity sabda kratu
    , Claim.relation "asraya" (Node.ent sabda) (Node.ent anda_bhava)
    , Claim.relation "vivartate" (Node.ent vrtti) (Node.ent kriya)
    , Claim.predication "kramam" bhaga
    , Claim.predication "sarva_atra" sabda ]
  , denials := [ Claim.predication "kramam" sabda ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.identity sabda kratu
    , Claim.relation "asraya" (Node.ent sabda) (Node.ent anda_bhava)
    , Claim.relation "vivartate" (Node.ent vrtti) (Node.ent kriya)
    , Claim.predication "kramam" bhaga ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The sacrificial ritual, having arrived at the condition of an unfolding process, performs its function through distinct sequential stages.'
   Why rejected: Treats kratu as literal sacrifice (a real transformation unfolding in ordered time) rather than power/energy (a latent capacity), which commits to parinamate (transformation) and denies the egg model's insight that parts exist all-at-once in the unmanifest whole. -/
def kratu_ritual : Entity := ⟨"kratu", Sorta.linguisticItem⟩
def sacrificial_ritual : Reading :=
  { claims := [ Claim.identity kratu_ritual sabda
    , Claim.predication "kramam" sabda ] }
theorem sacrificial_ritual_inadequate : ¬ contract.Adequate sacrificial_ritual := by decide
#guard contract.contradicts sacrificial_ritual = true
theorem sacrificial_ritual_sort_error : kratu_ritual ≠ kratu := by decide

/- 'The word unfolds its parts sequentially from the start, each part appearing only after the previous one is completed.'
   Why rejected: Denies the core egg-model insight: that all parts are 'there' in the unmanifest sphota, really recoverable, but not laid out in time until manifestation. This rendering treats the parts as genuinely absent until their moment, making them not pre-contained in the whole. -/
def sequential_manifestation : Reading :=
  { claims := [ Claim.predication "kramam" sabda ] }
theorem sequential_manifestation_inadequate : ¬ contract.Adequate sequential_manifestation := by decide
#guard contract.contradicts sequential_manifestation = true

/- "The word's parts exist as separate, independent entities that come into being one after another during manifestation."
   Why rejected: Misses the egg model's core insight: that all parts are 'there' in the sphota as the bird is in the egg, really recoverable yet not laid out in time. This reading treats parts as genuinely absent until manifestation, not pre-contained in the whole. -/
def bhaga_discrete : Entity := ⟨"bhāga", Sorta.absolute⟩
def discrete_parts : Reading :=
  { claims := [ Claim.predication "anirdhanya" bhaga_discrete ] }
theorem discrete_parts_inadequate : ¬ contract.Adequate discrete_parts := by decide
#guard contract.licenses discrete_parts = false
theorem discrete_parts_sort_error : bhaga_discrete ≠ bhaga := by decide

end Counterexamples

end VakyaVallari.Verses.V1_51
