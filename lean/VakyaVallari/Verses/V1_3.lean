/- Verse 1.3 — generated from data/contracts/1.3.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_3

open VakyaVallari

def brahman : Entity := ⟨"brahman", Sorta.absolute⟩
def kalasakti : Entity := ⟨"kālaśakti", Sorta.power⟩
def sad_bhava_vikara : Entity := ⟨"sad-bhava-vikāra", Sorta.manifestation⟩
def bhava_bheda : Entity := ⟨"bhāva-bheda", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent kalasakti) (Node.ent brahman)
    , Claim.relation "vivartate" (Node.ent kalasakti) (Node.ent sad_bhava_vikara)
    , Claim.relation "yoni" (Node.ent sad_bhava_vikara) (Node.ent bhava_bheda)
    , Claim.predication "adhyahita" kalasakti ]
  , denials := [ Claim.predication "independent_container" kalasakti
    , Claim.predication "intrinsically_divided" kalasakti ] }

def accepted : Reading :=
  { claims := [ Claim.relation "vivartate" (Node.ent kalasakti) (Node.ent sad_bhava_vikara)
    , Claim.relation "yoni" (Node.ent sad_bhava_vikara) (Node.ent bhava_bheda)
    , Claim.predication "adhyahita" kalasakti ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Time is an independent absolute power that directly generates the six modifications.'
   Why rejected: Treats time as an independent absolute rather than a power (sakti) of Brahman, contradicting the commentary's explicit teaching that time enters as a sakti of Brahman, not as an independent container. -/
def kalasakti_ind : Entity := ⟨"kālaśakti", Sorta.absolute⟩
def time_as_independent_absolute : Reading :=
  { claims := [ Claim.predication "independent_container" kalasakti_ind ] }
theorem time_as_independent_absolute_inadequate : ¬ contract.Adequate time_as_independent_absolute := by decide
#guard contract.licenses time_as_independent_absolute = false
theorem time_as_independent_absolute_sort_error : kalasakti_ind ≠ kalasakti := by decide

/- 'Time itself is inherently divided into moments, and these real moments generate the six modifications.'
   Why rejected: Treats time's divisions as intrinsic to its nature rather than superimposed upon it, reversing the commentary's core teaching about adhyahita-kala (divisions laid onto undivided time, not found in it). -/
def intrinsic_temporal_moments : Reading :=
  { claims := [ Claim.predication "intrinsically_divided" kalasakti ] }
theorem intrinsic_temporal_moments_inadequate : ¬ contract.Adequate intrinsic_temporal_moments := by decide
#guard contract.contradicts intrinsic_temporal_moments = true

/- 'Brahman transforms into the six modifications of being, which then become differentiated beings.'
   Why rejected: Asserts that Brahman undergoes real transformation (parinamate) into the six, bypassing the mediation of kalasakti and replacing vivarta (appearance without modification) with parinama (real change). This violates the structure established by the verse's explicit dependence on the power of Time. -/
def brahman_direct_transformation : Reading :=
  { claims := [ Claim.relation "parinamate" (Node.ent brahman) (Node.ent sad_bhava_vikara) ] }
theorem brahman_direct_transformation_inadequate : ¬ contract.Adequate brahman_direct_transformation := by decide
#guard contract.licenses brahman_direct_transformation = false

/- 'The six modifications ARE the differentiated beings themselves, not their sources.'
   Why rejected: Conflates the yoni (generative sources/wombs) with what is generated from them, eliminating the distinction the commentary carefully preserves between the six modifications (as generative sources) and the differentiated beings that issue from them. -/
def sad_bhava_vikara_conflated : Entity := ⟨"sad-bhava-vikāra", Sorta.manifestation⟩
def modifications_equal_beings : Reading :=
  { claims := [ Claim.identity sad_bhava_vikara_conflated bhava_bheda ] }
theorem modifications_equal_beings_inadequate : ¬ contract.Adequate modifications_equal_beings := by decide
#guard contract.licenses modifications_equal_beings = false

end Counterexamples

end VakyaVallari.Verses.V1_3
