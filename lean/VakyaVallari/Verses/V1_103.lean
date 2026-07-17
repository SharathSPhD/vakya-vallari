/- Verse 1.103 — generated from data/contracts/1.103.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_103

open VakyaVallari

def sphota_kala : Entity := ⟨"sphoṭakāla", Sorta.linguisticItem⟩
def sabda_santana : Entity := ⟨"śabdasantāna", Sorta.manifestation⟩
def prakrta : Entity := ⟨"prakṛta", Sorta.power⟩
def vaikrta : Entity := ⟨"vaikṛta", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.predication "na_bhidyate" sphota_kala
    , Claim.predication "pracaya_apacaya_atmaka" sabda_santana
    , Claim.identity sphota_kala prakrta
    , Claim.identity sabda_santana vaikrta ]
  , denials := [ Claim.predication "pracaya_apacaya_atmaka" sphota_kala
    , Claim.predication "na_bhidyate" sabda_santana ] }

def accepted : Reading :=
  { claims := [ Claim.predication "na_bhidyate" sphota_kala
    , Claim.predication "pracaya_apacaya_atmaka" sabda_santana ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The time of the sphota increases and decreases with the loudness of the utterance, while the after-train remains constant.'
   Why rejected: Reverses the verse's explicit assertion: the sphota-kala does not differ (is invariant), while the sabda-santana varies. This misreads which acoustic phenomenon carries the invariance structure. -/
def reversed_invariance : Reading :=
  { claims := [ Claim.predication "pracaya_apacaya_atmaka" sphota_kala ] }
theorem reversed_invariance_inadequate : ¬ contract.Adequate reversed_invariance := by decide
#guard contract.contradicts reversed_invariance = true

/- 'The sphota and the subsequent train of sounds are the same acoustic phenomenon, subject to the same variation.'
   Why rejected: Ignores the critical distinction between the invariant first-produced sphota (prakrta) and the variable propagated train (vaikrta). The verse carefully separates what does and does not differ with loudness. -/
def collapse_distinction : Reading :=
  { claims := [ Claim.identity sphota_kala sabda_santana ] }
theorem collapse_distinction_inadequate : ¬ contract.Adequate collapse_distinction := by decide
#guard contract.licenses collapse_distinction = false

/- 'Both the sphota-kala and the subsequent train are invariant because both derive from the same articulation.'
   Why rejected: Incorrectly generalizes the sphota-kala's invariance to the sabda-santana. The commentary is explicit: loudness is a property of propagation, not articulation. The after-train must vary with utterance force. -/
def propagation_invariant : Reading :=
  { claims := [ Claim.predication "na_bhidyate" sabda_santana ] }
theorem propagation_invariant_inadequate : ¬ contract.Adequate propagation_invariant := by decide
#guard contract.contradicts propagation_invariant = true

end Counterexamples

end VakyaVallari.Verses.V1_103
