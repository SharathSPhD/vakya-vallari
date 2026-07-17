/- Verse 1.112-113 — generated from data/contracts/1.112-113.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_112_113

open VakyaVallari

def antara_jnata : Entity := ⟨"antara-jñātā", Sorta.cognition⟩
def vag_atman : Entity := ⟨"vāg-ātman", Sorta.absolute⟩
def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def manobhava : Entity := ⟨"mano-bhāva", Sorta.manifestation⟩
def tejas : Entity := ⟨"tejas", Sorta.power⟩
def prana : Entity := ⟨"prāṇa", Sorta.manifestation⟩
def utterance : Entity := ⟨"samudīraṇa", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent antara_jnata) (Node.ent vag_atman)
    , Claim.relation "vivartate" (Node.ent antara_jnata) (Node.ent sabda)
    , Claim.relation "apadyate" (Node.ent sabda) (Node.ent manobhava)
    , Claim.relation "paka" (Node.ent tejas) (Node.ent manobhava)
    , Claim.relation "avisat" (Node.ent manobhava) (Node.ent prana)
    , Claim.predication "samudirya" prana ]
  , denials := [ Claim.relation "parinamate" (Node.ent antara_jnata) (Node.ent sabda) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent antara_jnata) (Node.ent vag_atman)
    , Claim.relation "vivartate" (Node.ent antara_jnata) (Node.ent sabda)
    , Claim.relation "apadyate" (Node.ent sabda) (Node.ent manobhava)
    , Claim.relation "avisat" (Node.ent manobhava) (Node.ent prana)
    , Claim.predication "samudirya" prana ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The inner knower actually transforms into wordhood as a real alteration of substance.'
   Why rejected: Asserts parinamate (real transformation) rather than vivarta (appearance-without-transformation), which the commentary explicitly contrasts with the vivarta doctrine of 1.1 and 1.48. -/
def actual_transformation : Reading :=
  { claims := [ Claim.relation "parinamate" (Node.ent antara_jnata) (Node.ent sabda) ] }
theorem actual_transformation_inadequate : ¬ contract.Adequate actual_transformation := by decide
#guard contract.contradicts actual_transformation = true

/- 'The knower produces wordhood as an external tool for communication.'
   Why rejected: Treats speech as something the knower makes rather than a dimension it inhabits. The commentary is explicit: 'language is not something the knower produces but a dimension it inhabits', making this a fundamental ontological category error. -/
def speech_as_instrument : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent vag_atman) (Node.ent antara_jnata) ] }
theorem speech_as_instrument_inadequate : ¬ contract.Adequate speech_as_instrument := by decide
#guard contract.licenses speech_as_instrument = false

/- 'The knower-as-wordhood directly becomes utterance without intermediate mental or physiological stages.'
   Why rejected: Omits the mandatory three-stage descent — knower's subtle speech → mental word → breath-borne utterance — which the verse explicitly elaborates. The commentary identifies this as 'the embryo of the pasyanti/madhyama/vaikhari hierarchy made explicit at 1.142'. -/
def direct_utterance : Reading :=
  { claims := [ Claim.relation "avisat" (Node.ent sabda) (Node.ent utterance) ] }
theorem direct_utterance_inadequate : ¬ contract.Adequate direct_utterance := by decide
#guard contract.licenses direct_utterance = false

end Counterexamples

end VakyaVallari.Verses.V1_112_113
