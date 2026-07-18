/- Verse 1.89 — generated from data/contracts/1.89.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_89

open VakyaVallari

def darsana : Entity := ⟨"darśana", Sorta.cognition⟩
def visaya : Entity := ⟨"viṣaya", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "anyathakrtya" (Node.ent darsana) (Node.ent visaya)
    , Claim.relation "adhyavasyati" (Node.ent darsana) (Node.ent visaya)
    , Claim.predication "purva" darsana ]
  , denials := [ Claim.predication "avasthapayati" darsana ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "anyathakrtya" (Node.ent darsana) (Node.ent visaya)
    , Claim.relation "adhyavasyati" (Node.ent darsana) (Node.ent visaya)
    , Claim.predication "purva" darsana ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Sight, from a distance or in deep gloom, provisionally determines the object while reserving final judgment until closer inspection.'
   Why rejected: The rendering suggests epistemic caution — withholding confident judgment until conditions improve. But the commentary and axioms show the opposite: darsana delivers determinate, confident verdicts at each stage (adhyavasyati), which are wrong but asserted with full confidence. This contradicts the denial that darsana does NOT withhold judgment. -/
def epistemic_caution : Reading :=
  { claims := [ Claim.predication "avasthapayati" darsana ] }
theorem epistemic_caution_inadequate : ¬ contract.Adequate epistemic_caution := by decide
#guard contract.contradicts epistemic_caution = true

/- 'Sight perceives different objects when viewing from a distance versus close up, with the distant view showing one object and the close view revealing another.'
   Why rejected: Treats the staged misapprehension as evidence of multiple objects, when the commentary emphasizes there is one object throughout: 'The endpoint is veridical, and the errors were its road.' The axioms show darsana making a single viṣaya appear otherwise at each stage, not perceiving different objects. Multiple distinct objects would not illustrate the normal path to truth through committed error. -/
def visaya_distant : Entity := ⟨"viṣaya_distant", Sorta.manifestation⟩
def visaya_near : Entity := ⟨"viṣaya_near", Sorta.manifestation⟩
def object_multiplicity : Reading :=
  { claims := [ Claim.relation "anyathakrtya" (Node.ent darsana) (Node.ent visaya_distant)
    , Claim.relation "anyathakrtya" (Node.ent darsana) (Node.ent visaya_near) ] }
theorem object_multiplicity_inadequate : ¬ contract.Adequate object_multiplicity := by decide
#guard contract.licenses object_multiplicity = false

end Counterexamples

end VakyaVallari.Verses.V1_89
