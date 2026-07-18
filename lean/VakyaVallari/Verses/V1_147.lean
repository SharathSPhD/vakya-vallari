/- Verse 1.147 — generated from data/contracts/1.147.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_147

open VakyaVallari

def apabhramsa : Entity := ⟨"apabhramśa", Sorta.linguisticItem⟩
def samskara : Entity := ⟨"saṃskāra", Sorta.power⟩
def visistartha : Entity := ⟨"viśiṣṭārtha", Sorta.property⟩
def intention : Entity := ⟨"prayukti", Sorta.cognition⟩
def sadhu : Entity := ⟨"sadhu", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.predication "samskara-hina" apabhramsa
    , Claim.relation "nivesinam" (Node.ent apabhramsa) (Node.ent visistartha)
    , Claim.predication "intention-relative" apabhramsa
    , Claim.relation "asrita" (Node.ent apabhramsa) (Node.ent sadhu) ]
  , denials := [ Claim.predication "determined-by-success" apabhramsa ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "samskara-hina" apabhramsa
    , Claim.relation "nivesinam" (Node.ent apabhramsa) (Node.ent visistartha)
    , Claim.predication "intention-relative" apabhramsa ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Since corrupt forms successfully communicate meaning, there is no difference between them and correct forms.'
   Why rejected: Ignores the explicit doctrine: corruption is defined by norm and intention, not by communicative success. The axioms establish that apabhramsa both lacks samskara AND settles on meaning as independent features. Success does not erase the norm-violation. -/
def ignore_norm_criterion : Reading :=
  { claims := [ Claim.identity apabhramsa sadhu ] }
theorem ignore_norm_criterion_inadequate : ¬ contract.Adequate ignore_norm_criterion := by decide
#guard contract.licenses ignore_norm_criterion = false

/- "The form 'gavi' is simply a variant pronunciation of 'gauh', with neither more correct than the other."
   Why rejected: Erases the intention-relative definition captured in the axioms. The contested point makes explicit: the same phonetic form is apabhramsa only against a meant sadhu target. This reading treats gavi and gauh as symmetric variants, missing that apabhramsa-status depends on what the speaker intends to say. -/
def gavi : Entity := ⟨"gavi", Sorta.linguisticItem⟩
def elide_intention_dependence : Reading :=
  { claims := [ Claim.identity gavi sadhu ] }
theorem elide_intention_dependence_inadequate : ¬ contract.Adequate elide_intention_dependence := by decide
#guard contract.licenses elide_intention_dependence = false

/- "Corrupted utterances like 'gavi' fail to reach their hearers or leave them confused about the meaning."
   Why rejected: Contradicts the nivesinam axiom: the fallen form settles on the distinguished meaning perfectly well; the hearer gets the meaning. Apabhramsa is communicatively successful by definition, even while being corrupt (norm-violating). These are independent properties in the Bhartṛhari framework. -/
def deny_communicative_power : Reading :=
  { claims := [ Claim.predication "asamveditartha" apabhramsa ] }
theorem deny_communicative_power_inadequate : ¬ contract.Adequate deny_communicative_power := by decide
#guard contract.licenses deny_communicative_power = false

end Counterexamples

end VakyaVallari.Verses.V1_147
