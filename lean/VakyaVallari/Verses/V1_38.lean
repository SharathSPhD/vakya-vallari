/- Verse 1.38 — generated from data/contracts/1.38.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_38

open VakyaVallari

def rsi : Entity := ⟨"ṛṣi", Sorta.absolute⟩
def arsa_caksu : Entity := ⟨"ārṣa-cakṣus", Sorta.power⟩
def bhava : Entity := ⟨"bhāva", Sorta.manifestation⟩
def atindriya : Entity := ⟨"atīndriya", Sorta.property⟩
def vacana : Entity := ⟨"vacana", Sorta.linguisticItem⟩
def anumana : Entity := ⟨"anumāna", Sorta.power⟩
def pramana : Entity := ⟨"pramāṇa", Sorta.power⟩
def direct_seeing : Entity := ⟨"direct seeing", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.predication "arsa_caksu" rsi
    , Claim.relation "perceives" (Node.ent arsa_caksu) (Node.ent atindriya)
    , Claim.identity anumana pramana
    , Claim.predication "vacana" rsi
    , Claim.relation "not_overturned_by" (Node.ent vacana) (Node.ent anumana)
    , Claim.predication "defeasible" anumana
    , Claim.relation "stronger_than" (Node.ent direct_seeing) (Node.ent anumana) ]
  , denials := [ Claim.relation "can_overrule" (Node.ent anumana) (Node.ent vacana)
    , Claim.relation "can_overrule" (Node.ent anumana) (Node.ent direct_seeing) ] }

def accepted : Reading :=
  { claims := [ Claim.predication "arsa_caksu" rsi
    , Claim.relation "perceives" (Node.ent arsa_caksu) (Node.ent atindriya)
    , Claim.predication "vacana" rsi
    , Claim.relation "not_overturned_by" (Node.ent vacana) (Node.ent anumana) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The inference of ordinary reasoners can overturn the testimony of the seers.'
   Why rejected: Directly contradicts the verse's core claim that the rsis' word cannot be overturned by inference. The commentary explicitly denies that the weaker instrument (inference) can overrule the stronger (direct seeing). -/
def inference_overrules_testimony : Reading :=
  { claims := [ Claim.relation "can_overrule" (Node.ent anumana) (Node.ent vacana) ] }
theorem inference_overrules_testimony_inadequate : ¬ contract.Adequate inference_overrules_testimony := by decide
#guard contract.contradicts inference_overrules_testimony = true

/- 'The seers have no special perceptual faculty; their knowledge comes only from ordinary inference like everyone else.'
   Why rejected: Denies the ārṣa-cakṣus (seer's eye) as a distinct power, which is central to the verse's claim that they see what lies beyond the senses. This demotes the seer's faculty from a unique power to ordinary cognition. -/
def arsa_caksu_ordinary : Entity := ⟨"ārṣa-cakṣus", Sorta.cognition⟩
def no_seer_eye_distinction : Reading :=
  { claims := [ Claim.predication "arsa_caksu_ordinary" rsi ] }
theorem no_seer_eye_distinction_inadequate : ¬ contract.Adequate no_seer_eye_distinction := by decide
#guard contract.licenses no_seer_eye_distinction = false
theorem no_seer_eye_distinction_sort_error : arsa_caksu_ordinary ≠ arsa_caksu := by decide

/- 'Inference and direct perception have equal epistemic status in the domain of dharma.'
   Why rejected: Reverses the hierarchy established by the verse and commentary. The commentary is explicit that the weaker instrument (inference) does not override the stronger (direct seeing), and that direct seeing is available to seers but inference to all. -/
def inference_equals_direct_seeing : Reading :=
  { claims := [ Claim.relation "equal_status" (Node.ent anumana) (Node.ent direct_seeing) ] }
theorem inference_equals_direct_seeing_inadequate : ¬ contract.Adequate inference_equals_direct_seeing := by decide
#guard contract.licenses inference_equals_direct_seeing = false

end Counterexamples

end VakyaVallari.Verses.V1_38
