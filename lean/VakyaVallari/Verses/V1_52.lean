/- Verse 1.52 — generated from data/contracts/1.52.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_52

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def vaktr : Entity := ⟨"vaktṛ", Sorta.absolute⟩
def buddhivisaya : Entity := ⟨"buddhivisaya", Sorta.cognition⟩
def tritaya : Entity := ⟨"tritaya", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "ekacaitanya" sabda
    , Claim.relation "utpadyate" (Node.ent tritaya) (Node.ent sabda)
    , Claim.predication "vivartate" sabda
    , Claim.predication "kriya" vaktr ]
  , denials := [ Claim.predication "natural" sabda ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "ekacaitanya" sabda
    , Claim.relation "utpadyate" (Node.ent tritaya) (Node.ent sabda) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- "The word is either unified in the speaker's mind or sequential in articulation, but not both simultaneously."
   Why rejected: The verse's central teaching is that the word is permanently dual-natured: unified (ekacaitanya) in cognition yet realized through the three-stage procedure (tritaya utpadyate). The commentary emphasizes 'the word's permanent oscillation between unity and sequence', demonstrating they coexist. Denying this simultaneity violates the vivartate axiom. -/
def sabda_unity_only : Entity := ⟨"śabda", Sorta.property⟩
def mutual_exclusivity : Reading :=
  { claims := [ Claim.relation "utpadyate" (Node.ent tritaya) (Node.ent sabda_unity_only) ] }
theorem mutual_exclusivity_inadequate : ¬ contract.Adequate mutual_exclusivity := by decide
#guard contract.licenses mutual_exclusivity = false
theorem mutual_exclusivity_sort_error : sabda_unity_only ≠ sabda := by decide

/- "The word is produced spontaneously like natural processes (fire, reflection, eggs), without the speaker's deliberate crafting."
   Why rejected: The verse's choice of painting (not natural phenomena) emphasizes deliberate craft and speaker agency. The commentary explicitly contrasts: 'Fire, reflection and egg are natural processes, but painting is deliberate craft, and it models the *speaker's* situation'. Denying the speaker's intentional kriya (agency) contradicts both the kriya axiom and the denial that sabda is natural. -/
def natural_process : Reading :=
  { claims := [ Claim.predication "natural" sabda ] }
theorem natural_process_inadequate : ¬ contract.Adequate natural_process := by decide
#guard contract.contradicts natural_process = true

end Counterexamples

end VakyaVallari.Verses.V1_52
