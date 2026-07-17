/- Verse 1.122 — generated from data/contracts/1.122.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_122

open VakyaVallari

def sabda_bhavana : Entity := ⟨"śabda-bhāvanā", Sorta.cognition⟩
def karana_vinyasa : Entity := ⟨"karaṇa-vinyāsa", Sorta.property⟩
def samirana : Entity := ⟨"samīraṇa", Sorta.property⟩
def abhighata : Entity := ⟨"abhighāta", Sorta.property⟩
def sthana : Entity := ⟨"sthāna", Sorta.property⟩
def ajasra_vrtti : Entity := ⟨"ajasra-vṛtti", Sorta.power⟩
def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def vak : Entity := ⟨"vāk", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent sabda_bhavana) (Node.ent karana_vinyasa)
    , Claim.relation "asraya" (Node.ent sabda_bhavana) (Node.ent samirana)
    , Claim.relation "asraya" (Node.ent sabda_bhavana) (Node.ent abhighata)
    , Claim.relation "asraya" (Node.ent ajasra_vrtti) (Node.ent sabda_bhavana)
    , Claim.relation "vivartate" (Node.ent ajasra_vrtti) (Node.ent vak) ]
  , denials := [ Claim.predication "originates_from_silence" vak ] }

def accepted : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent sabda_bhavana) (Node.ent karana_vinyasa)
    , Claim.relation "asraya" (Node.ent sabda_bhavana) (Node.ent samirana)
    , Claim.relation "asraya" (Node.ent sabda_bhavana) (Node.ent abhighata) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Conceiving in word is a purely private mental act isolated from the motor acts of speech production.'
   Why rejected: Misconstrues sabda-bhavana as an autonomous inner state divorced from the utterance machinery it grounds. The axioms establish that word-conceiving is the asraya (ground) of all three motor acts; treating it as independent breaks the unified model of speech the commentary enforces. -/
def sabda_bhavana_private : Entity := ⟨"śabda-bhāvanā (private)", Sorta.property⟩
def silent_private_act : Reading :=
  { claims := [ Claim.predication "isolated_from_utterance" sabda_bhavana_private ] }
theorem silent_private_act_inadequate : ¬ contract.Adequate silent_private_act := by decide
#guard contract.licenses silent_private_act = false

/- 'Speech originates from an initial silence and then becomes activated into word-forming.'
   Why rejected: Asserts that utterance emerges from a pre-linguistic void, contradicting the cardinal denial: 'Speech does not start from silence.' The commentary insists audible speaking is a 'local intensification' of a wording 'always already under way', grounded eternally in ajasra-vrtti. -/
def origin_from_silence : Reading :=
  { claims := [ Claim.predication "originates_from_silence" vak ] }
theorem origin_from_silence_inadequate : ¬ contract.Adequate origin_from_silence := by decide
#guard contract.contradicts origin_from_silence = true

/- 'The motor acts of speech (positioning, breathing, striking) happen independently and then sabda-bhavana coordinates them afterward.'
   Why rejected: Reverses the dependence: makes motor acts autonomous and word-conceiving their post-hoc orchestrator. The axioms invert this—sabda-bhavana is the asraya (ground/support) of the motor acts, not their consequence. Motor acts occur *only* because they are grounded in word-conceiving. -/
def sequential_motor_autonomy : Reading :=
  { claims := [ Claim.predication "autonomous_motor_action" karana_vinyasa ] }
theorem sequential_motor_autonomy_inadequate : ¬ contract.Adequate sequential_motor_autonomy := by decide
#guard contract.licenses sequential_motor_autonomy = false

end Counterexamples

end VakyaVallari.Verses.V1_122
