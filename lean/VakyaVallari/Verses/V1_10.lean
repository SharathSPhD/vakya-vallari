/- Verse 1.10 — generated from data/contracts/1.10.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_10

open VakyaVallari

def vidya_bhedas : Entity := ⟨"vidyābhedāḥ", Sorta.linguisticItem⟩
def angas : Entity := ⟨"aṅgāḥ", Sorta.linguisticItem⟩
def upangas : Entity := ⟨"upāṅgāḥ", Sorta.linguisticItem⟩
def jnana : Entity := ⟨"jñāna", Sorta.cognition⟩
def samskara : Entity := ⟨"saṃskāra", Sorta.power⟩
def jnana_instrument : Entity := ⟨"instrument", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.predication "anga_upanga_nibandha" vidya_bhedas
    , Claim.relation "hetu" (Node.ent vidya_bhedas) (Node.ent samskara)
    , Claim.predication "anga_upanga_enumeration" angas
    , Claim.relation "instrument_conditioning" (Node.ent vidya_bhedas) (Node.ent jnana_instrument) ]
  , denials := [ Claim.predication "paramarthaprada" vidya_bhedas ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "anga_upanga_nibandha" vidya_bhedas
    , Claim.relation "hetu" (Node.ent vidya_bhedas) (Node.ent samskara) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The auxiliary disciplines are the primary divisions of knowledge causing the refinement of understanding.'
   Why rejected: Confuses the auxiliary framework (angas/upangas) with the primary category of vidya-bhedas. The verse indicates vidya-bhedas are bound WITH angas and upangas as a structural framework, not that angas/upangas constitute the primary divisions themselves. -/
def angas_primary : Entity := ⟨"aṅgāḥ", Sorta.linguisticItem⟩
def angas_as_primary : Reading :=
  { claims := [ Claim.relation "hetu" (Node.ent angas_primary) (Node.ent samskara) ] }
theorem angas_as_primary_inadequate : ¬ contract.Adequate angas_as_primary := by decide
#guard contract.licenses angas_as_primary = false

/- 'The divisions of knowledge deliver the ultimate fulfillment of understanding as their direct purpose.'
   Why rejected: Asserts that vidya-bhedas deliver the ultimate goal, directly contradicting the commentary's explicit statement: 'They do not deliver the goal; they condition the instrument that reaches it.' They are preparatory, not direct deliverers of the ultimate knowledge. -/
def direct_goal_delivery : Reading :=
  { claims := [ Claim.predication "paramarthaprada" vidya_bhedas ] }
theorem direct_goal_delivery_inadequate : ¬ contract.Adequate direct_goal_delivery := by decide
#guard contract.contradicts direct_goal_delivery = true

end Counterexamples

end VakyaVallari.Verses.V1_10
