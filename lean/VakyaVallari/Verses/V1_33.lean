/- Verse 1.33 — generated from data/contracts/1.33.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_33

open VakyaVallari

def dravya : Entity := ⟨"dravya", Sorta.absolute⟩
def sakti : Entity := ⟨"śakti", Sorta.power⟩
def arthakriya : Entity := ⟨"arthakriya", Sorta.property⟩
def visesha : Entity := ⟨"viśeṣa", Sorta.absolute⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent sakti) (Node.ent dravya)
    , Claim.relation "prati" (Node.ent sakti) (Node.ent arthakriya)
    , Claim.relation "pratibadhyate" (Node.ent visesha) (Node.ent sakti) ]
  , denials := [ Claim.relation "niyata" (Node.ent sakti) (Node.ent arthakriya) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent sakti) (Node.ent dravya)
    , Claim.relation "prati" (Node.ent sakti) (Node.ent arthakriya)
    , Claim.relation "pratibadhyate" (Node.ent visesha) (Node.ent sakti) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'A well-known power of a substance will reliably produce its effect.'
   Why rejected: The verse's central thesis is defeasibility: powers can be defeated by unseen particulars, making reliable inference from power to effect impossible. This reading assumes the opposite—that power guarantees effect. -/
def guaranteed_effect : Reading :=
  { claims := [ Claim.relation "niyata" (Node.ent sakti) (Node.ent arthakriya) ] }
theorem guaranteed_effect_inadequate : ¬ contract.Adequate guaranteed_effect := by decide
#guard contract.contradicts guaranteed_effect = true

/- 'When a substance enters connection with a particular, the substance itself is obstructed, not its power.'
   Why rejected: The verse explicitly states that the power is obstructed (sā śaktiḥ pratibadhyate), not the substance. This misreading reverses the object of obstruction. -/
def substance_obstructed : Reading :=
  { claims := [ Claim.relation "pratibadhyate" (Node.ent visesha) (Node.ent dravya) ] }
theorem substance_obstructed_inadequate : ¬ contract.Adequate substance_obstructed := by decide
#guard contract.licenses substance_obstructed = false

end Counterexamples

end VakyaVallari.Verses.V1_33
