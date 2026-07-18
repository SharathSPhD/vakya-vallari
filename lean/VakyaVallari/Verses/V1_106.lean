/- Verse 1.106 — generated from data/contracts/1.106.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_106

open VakyaVallari

def karana : Entity := ⟨"karaṇa", Sorta.linguisticItem⟩
def sphota : Entity := ⟨"sphoṭa", Sorta.manifestation⟩
def dhvani : Entity := ⟨"dhvani", Sorta.linguisticItem⟩
def regeneration : Entity := ⟨"punarjanana", Sorta.power⟩
def flame : Entity := ⟨"jvālā", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := []
  , denials := [ Claim.relation "utpadyate" (Node.ent karana) (Node.ent dhvani) ]
  , reported := [ Claim.relation "utpadyate" (Node.ent sphota) (Node.ent dhvani)
    , Claim.relation "anugatam" (Node.ent dhvani) (Node.ent dhvani)
    , Claim.predication "anavasthita" karana ] }

-- pūrvapakṣa: this contract carries reported (non-endorsed) claims
#guard contract.doxographic = true

def accepted : Reading :=
  { claims := [ Claim.relation "utpadyate" (Node.ent sphota) (Node.ent dhvani)
    , Claim.relation "anugatam" (Node.ent dhvani) (Node.ent dhvani)
    , Claim.predication "anavasthita" karana ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Further sounds are continuously produced by the unsettled vibration of the organ itself.'
   Why rejected: Misreads the negation 'not from fresh strokes of the organ' and treats karana as the ongoing source of all sounds. The commentary explicitly states sounds arise from sphota, not from karana's continued motion. The verse's point is precisely that the initial sounding source (karana) is needed only to seed the process; subsequent sounds regenerate without it. -/
def continued_organ_motion : Reading :=
  { claims := [ Claim.relation "utpadyate" (Node.ent karana) (Node.ent dhvani) ] }
theorem continued_organ_motion_inadequate : ¬ contract.Adequate continued_organ_motion := by decide
#guard contract.contradicts continued_organ_motion = true

/- "All sounds, both initial and distant, must originate directly from the organ's articulation."
   Why rejected: Denies the serial regeneration model (Each dhvani generating the next). This misses the verse's core mechanism: sounds propagate by local self-replication in the medium, not by transmission of force from the original source. The flame simile explicitly encodes this—fire kindles fire without the original torch reaching across. -/
def dhvani_static : Entity := ⟨"dhvani", Sorta.property⟩
def no_self_replication : Reading :=
  { claims := [ Claim.predication "anavayava" dhvani_static ] }
theorem no_self_replication_inadequate : ¬ contract.Adequate no_self_replication := by decide
#guard contract.licenses no_self_replication = false
theorem no_self_replication_sort_error : dhvani_static ≠ dhvani := by decide

end Counterexamples

end VakyaVallari.Verses.V1_106
