/- Verse 1.143 — generated from data/contracts/1.143.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_143

open VakyaVallari

def param_padam : Entity := ⟨"param padam", Sorta.absolute⟩
def sabda_saktayah : Entity := ⟨"śabda-śaktayaḥ", Sorta.power⟩
def svabhava_jna : Entity := ⟨"svabhāva-jña", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.predication "avasthita" param_padam
    , Claim.predication "drsyante" sabda_saktayah
    , Claim.predication "saksad_drsya" sabda_saktayah ]
  , denials := [ Claim.predication "parinamate" param_padam
    , Claim.predication "anumita" sabda_saktayah ] }

def accepted : Reading :=
  { claims := [ Claim.predication "avasthita" param_padam
    , Claim.predication "drsyante" sabda_saktayah ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'As the supreme word-station manifests through utterance and returns to unity, it undergoes real change in substance.'
   Why rejected: Asserts parinamate (real transformation of substance), which the axiom and commentary explicitly deny. The param padam stands unaltered; the commentary invokes vivarta (appearance without loss of unity) precisely to rule out parinama. The hierarchy doctrine of 1.75-77 and 1.101 is lifted to the summit to demonstrate invariance through the entire emanation-return cycle. -/
def real_transformation : Reading :=
  { claims := [ Claim.predication "parinamate" param_padam ] }
theorem real_transformation_inadequate : ¬ contract.Adequate real_transformation := by decide
#guard contract.contradicts real_transformation = true

/- 'The powers of words are discovered by scholars through careful analysis of linguistic patterns and inference.'
   Why rejected: The commentary explicitly denies this: powers are directly seen/beheld (drsyante), not inferred from usage. This is vision-knowledge (rsi's mode), not inference. The rendering mistakes the epistemology: powers are not derived conclusions but immediate vision, visible only to those whose cognition has reached the level where they operate. -/
def inferential_access : Reading :=
  { claims := [ Claim.predication "anumita" sabda_saktayah ] }
theorem inferential_access_inadequate : ¬ contract.Adequate inferential_access := by decide
#guard contract.contradicts inferential_access = true

end Counterexamples

end VakyaVallari.Verses.V1_143
