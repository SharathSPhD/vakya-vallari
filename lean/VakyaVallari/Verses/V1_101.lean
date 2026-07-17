/- Verse 1.101 — generated from data/contracts/1.101.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_101

open VakyaVallari

def varna : Entity := ⟨"varṇa", Sorta.linguisticItem⟩
def vakya : Entity := ⟨"vākya", Sorta.linguisticItem⟩
def pada : Entity := ⟨"pada", Sorta.linguisticItem⟩
def nada : Entity := ⟨"nāda", Sorta.manifestation⟩
def abhinna_kala : Entity := ⟨"abhinna-kāla", Sorta.property⟩
def vrtti_kala : Entity := ⟨"vṛtti-kāla", Sorta.power⟩
def sva_kala : Entity := ⟨"sva-kāla", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "abhinna_kala" varna
    , Claim.predication "abhinna_kala" vakya
    , Claim.predication "abhinna_kala" pada
    , Claim.predication "asraya" nada
    , Claim.relation "vibhajyate" (Node.ent vrtti_kala) (Node.ent sva_kala) ]
  , denials := [ Claim.predication "actual_duration" varna
    , Claim.predication "actual_duration" pada ] }

def accepted : Reading :=
  { claims := [ Claim.predication "abhinna_kala" varna
    , Claim.predication "abhinna_kala" pada
    , Claim.predication "asraya" nada
    , Claim.relation "vibhajyate" (Node.ent vrtti_kala) (Node.ent sva_kala) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Linguistic units (phonemes and words) themselves possess distinct time-properties that differ according to length and speed of utterance.'
   Why rejected: Assigns actual duration to linguistic units, but the commentary insists linguistic units have only figurative time (sva-kala) — the real duration is a property of nada. This reverses the ontological priority: units are temporally undivided in themselves. -/
def varna_dur : Entity := ⟨"varṇa", Sorta.property⟩
def linguistic_units_temporal : Reading :=
  { claims := [ Claim.predication "actual_duration" varna_dur ] }
theorem linguistic_units_temporal_inadequate : ¬ contract.Adequate linguistic_units_temporal := by decide
#guard contract.licenses linguistic_units_temporal = false
theorem linguistic_units_temporal_sort_error : varna_dur ≠ varna := by decide

/- 'Each linguistic unit has its own intrinsic time-measure, distinct from the time of utterance.'
   Why rejected: Treats sva-kala as a real property of linguistic units themselves, but the commentary explicitly states it 'exists only as the figurative shadow the vrtti casts' — it is upacara (metaphorical), not a real property. The sort error (property vs manifestation of units themselves) makes this contradicted by the denial. -/
def sva_kala_real : Reading :=
  { claims := [ Claim.predication "actual_duration" pada ] }
theorem sva_kala_real_inadequate : ¬ contract.Adequate sva_kala_real := by decide
#guard contract.contradicts sva_kala_real = true

/- 'There is no meaningful distinction between the time-measurements of sound and the time-measurements of linguistic units — they are the same property.'
   Why rejected: Collapses the central distinction the verse establishes: vrtti-kala (real, of sound) vs sva-kala (figurative, of units). The commentary insists on the separation: 'vrtti-kala, the time of functioning — a real property of the sound-process — versus sva-kala... which exists only as figurative'. -/
def no_distinction_time : Reading :=
  { claims := [ Claim.identity vrtti_kala sva_kala ] }
theorem no_distinction_time_inadequate : ¬ contract.Adequate no_distinction_time := by decide
#guard contract.licenses no_distinction_time = false

end Counterexamples

end VakyaVallari.Verses.V1_101
