/- Verse 1.128 — generated from data/contracts/1.128.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_128

open VakyaVallari

def vak : Entity := ⟨"vāk", Sorta.manifestation⟩
def artha : Entity := ⟨"artha", Sorta.manifestation⟩
def rudhi : Entity := ⟨"rudhi", Sorta.power⟩
def matra : Entity := ⟨"mātrā", Sorta.property⟩
def svamatra : Entity := ⟨"sva-mātrā", Sorta.property⟩
def paramatra : Entity := ⟨"para-mātrā", Sorta.property⟩
def vikara : Entity := ⟨"vikarā", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.relation "prakramyate" (Node.ent vak) (Node.ent artha)
    , Claim.predication "rudhatameti" artha
    , Claim.relation "vidhiyate" (Node.ent vak) (Node.ent artha)
    , Claim.predication "characterizes" matra ]
  , denials := [ Claim.predication "nitya_akara" artha
    , Claim.relation "paurvapya" (Node.ent artha) (Node.ent vak) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "prakramyate" (Node.ent vak) (Node.ent artha)
    , Claim.predication "rudhatameti" artha
    , Claim.relation "vidhiyate" (Node.ent vak) (Node.ent artha) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Objects possess determinate contours before being reported by speech, which merely describes existing objective realities.'
   Why rejected: Directly contradicts the commentary's explicit statement that objects do not pre-exist with determinate form; speech does not report pre-existing contours but creates them through utterance. -/
def object_preexistence : Reading :=
  { claims := [ Claim.predication "nitya_akara" artha ] }
theorem object_preexistence_inadequate : ¬ contract.Adequate object_preexistence := by decide
#guard contract.contradicts object_preexistence = true

/- 'The utterance merely reflects or passively conveys objects that are independently established through other means.'
   Why rejected: Treats vak as a passive mirror rather than the active determinant (vidhiyate) that the verse emphasizes. The verb vidhiyate is explicitly described as 'strong and chosen: the verb of injunction and ordination', making speech the generative principle, not a passive report. -/
def vak_passive : Entity := ⟨"vāk", Sorta.property⟩
def speech_as_passive : Reading :=
  { claims := [ Claim.relation "paurvapya" (Node.ent artha) (Node.ent vak) ] }
theorem speech_as_passive_inadequate : ¬ contract.Adequate speech_as_passive := by decide
#guard contract.contradicts speech_as_passive = true
theorem speech_as_passive_sort_error : vak_passive ≠ vak := by decide

/- "The object's essence is determined by whether the utterance uses its own measure or another's measure; different measures yield different objects."
   Why rejected: The verse explicitly uses a disjunctive (vā) to show that measure (own or another's) does not matter to the establishment: 'Whether as its own measure or as the measure of another... just so does it become established.' The establishment (rudhi) follows regardless of which measure is adopted. -/
def measure_determines_essence : Reading :=
  { claims := [ Claim.relation "samadhibheda" (Node.ent matra) (Node.ent artha) ] }
theorem measure_determines_essence_inadequate : ¬ contract.Adequate measure_determines_essence := by decide
#guard contract.licenses measure_determines_essence = false

end Counterexamples

end VakyaVallari.Verses.V1_128
