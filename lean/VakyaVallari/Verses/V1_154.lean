/- Verse 1.154 — generated from data/contracts/1.154.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_154

open VakyaVallari

def daivi_vag : Entity := ⟨"daivī vāg", Sorta.linguisticItem⟩
def aksakta_abhidhatri : Entity := ⟨"aśaktair abhidhātṛbhiḥ", Sorta.cognition⟩
def vyatikirana : Entity := ⟨"vyatikīrṇā", Sorta.manifestation⟩
def anitya_darsin : Entity := ⟨"anityadarśin", Sorta.cognition⟩
def buddhi_viparyaya : Entity := ⟨"buddhiviparyayaḥ", Sorta.cognition⟩
def vada : Entity := ⟨"vāda", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.predication "vyatikirana" daivi_vag
    , Claim.relation "pratikula_buddhi" (Node.ent anitya_darsin) (Node.ent vada)
    , Claim.predication "viparyaya" anitya_darsin
    , Claim.predication "anisthaniya" aksakta_abhidhatri ]
  , denials := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "vyatikirana" daivi_vag
    , Claim.predication "viparyaya" anitya_darsin
    , Claim.relation "pratikula_buddhi" (Node.ent anitya_darsin) (Node.ent vada) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The seers of non-eternality have a reversed and therefore false judgement about language.'
   Why rejected: Projects refutation onto the text when the commentary explicitly states Bhartṛhari does not refute the opposite view. This violates the neutrality and structural honesty the verse embodies. -/
def anitya_darsin_false : Entity := ⟨"anityadarśin", Sorta.cognition⟩
def refutation_reading : Reading :=
  { claims := [ Claim.predication "asatya" anitya_darsin_false ] }
theorem refutation_reading_inadequate : ¬ contract.Adequate refutation_reading := by decide
#guard contract.licenses refutation_reading = false

/- 'Incapable speakers caused the corruption of what was originally one unified language.'
   Why rejected: Treats speakers as active agents responsible for corruption rather than simply operating within corrupted speech. The verse says the divine speech HAS BEEN overspread (passive voice), not that speakers actively corrupted it. -/
def corruption_causation : Reading :=
  { claims := [ Claim.relation "karana" (Node.ent aksakta_abhidhatri) (Node.ent vyatikirana) ] }
theorem corruption_causation_inadequate : ¬ contract.Adequate corruption_causation := by decide
#guard contract.licenses corruption_causation = false

/- 'The seers of non-eternality are correct that modern speech is the natural source from which Sanskrit is derived.'
   Why rejected: Treats the anti-eternalist position as epistemically privileged, when Bhartṛhari's insight is that both views flow from incompatible metaphysical commitments (eternality vs. impermanence), not from evidence alone. -/
def modern_sabda : Entity := ⟨"adhunika-sabda", Sorta.linguisticItem⟩
def modern_priority : Reading :=
  { claims := [ Claim.relation "mula" (Node.ent modern_sabda) (Node.ent daivi_vag) ] }
theorem modern_priority_inadequate : ¬ contract.Adequate modern_priority := by decide
#guard contract.licenses modern_priority = false

end Counterexamples

end VakyaVallari.Verses.V1_154
