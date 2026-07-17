/- Verse 1.105 — generated from data/contracts/1.105.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_105

open VakyaVallari

def dravya : Entity := ⟨"dravya", Sorta.absolute⟩
def pracaya : Entity := ⟨"pracaya", Sorta.manifestation⟩
def dirgha : Entity := ⟨"dīrgha", Sorta.property⟩
def pluta : Entity := ⟨"pluta", Sorta.property⟩
def nada : Entity := ⟨"nāda", Sorta.linguisticItem⟩
def vrittera : Entity := ⟨"vṛttera", Sorta.linguisticItem⟩
def vibration : Entity := ⟨"kampana", Sorta.power⟩
def contrast : Entity := ⟨"viśeṣa", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "arise_distinct" dirgha
    , Claim.predication "arise_distinct" pluta
    , Claim.relation "asraya" (Node.ent contrast) (Node.ent pracaya)
    , Claim.relation "vivartate" (Node.ent vibration) (Node.ent nada)
    , Claim.relation "visesakah" (Node.ent nada) (Node.ent vrittera) ]
  , denials := [ Claim.relation "asraya" (Node.ent contrast) (Node.ent nada) ] }

def accepted : Reading :=
  { claims := [ Claim.predication "arise_distinct" dirgha
    , Claim.predication "arise_distinct" pluta
    , Claim.relation "visesakah" (Node.ent nada) (Node.ent vrittera) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The sounds that remain after vibration ceases carry the long and prolated vowel distinctions that identify words.'
   Why rejected: Reverses the acoustic division the commentary insists on: contrastive properties (vowel length) belong to the driven phase, not the free decay. The decay phase marks only stylistic delivery, never contrastive identity. This inverts the relation's direction. -/
def contrast_after_decay : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent contrast) (Node.ent nada) ] }
theorem contrast_after_decay_inadequate : ¬ contract.Adequate contrast_after_decay := by decide
#guard contract.contradicts contrast_after_decay = true

/- 'The long and prolated vowel distinctions belong to the post-vibration resonances that differentiate utterance styles.'
   Why rejected: Assigns contrastive vowel properties to the decay phase, when the commentary explicitly locates them in the amplified driven phase. This demotes a contrastive property to a stylistic one (sort error), making the axiom unlicensed. -/
def contrast_style : Entity := ⟨"viśeṣa-śaili", Sorta.property⟩
def decay_phase_contrast : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent contrast_style) (Node.ent nada) ] }
theorem decay_phase_contrast_inadequate : ¬ contract.Adequate decay_phase_contrast := by decide
#guard contract.licenses decay_phase_contrast = false

end Counterexamples

end VakyaVallari.Verses.V1_105
