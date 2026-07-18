/- Verse 1.84 — generated from data/contracts/1.84.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_84

open VakyaVallari

def dhvani : Entity := ⟨"dhvani", Sorta.linguisticItem⟩
def bija : Entity := ⟨"bija", Sorta.manifestation⟩
def buddhi : Entity := ⟨"buddhi", Sorta.cognition⟩
def sphota : Entity := ⟨"sphota", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.relation "ahita" (Node.ent dhvani) (Node.ent bija)
    , Claim.predication "paripaka" buddhi
    , Claim.relation "avadharyate" (Node.ent buddhi) (Node.ent sphota)
    , Claim.predication "nimitta" dhvani
    , Claim.predication "yogyata" buddhi
    , Claim.predication "samanya" sphota ]
  , denials := [ Claim.predication "samavayavata" sphota ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "ahita" (Node.ent dhvani) (Node.ent bija)
    , Claim.predication "paripaka" buddhi
    , Claim.relation "avadharyate" (Node.ent buddhi) (Node.ent sphota)
    , Claim.predication "nimitta" dhvani
    , Claim.predication "samanya" sphota ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The word-meaning is conveyed by the last phoneme working together with memory-traces of preceding phonemes to form a connected series of meanings.'
   Why rejected: This is the Mimamsa rival account that the verse and commentary explicitly contrast with sphota doctrine. The commentary states: 'the argument between the two schools turns on whether the object of the final cognition is a mere phoneme-series remembered, or a unity over and above it'. Asserting sphota as a phoneme-series contradicts the axiom that sphota has samanya (unified whole), and contradicts the denial of samavayavata (composition from parts). -/
def mimamsa_phoneme_series : Reading :=
  { claims := [ Claim.predication "samavayavata" sphota ] }
theorem mimamsa_phoneme_series_inadequate : ¬ contract.Adequate mimamsa_phoneme_series := by decide
#guard contract.contradicts mimamsa_phoneme_series = true

/- 'The word is progressively built up by adding the contributions of each successive sound, until the final sound completes the whole.'
   Why rejected: This misses the central distinction the verse makes: 'The final phoneme is not a final part completing a sum'. The commentary emphasizes: 'what accumulates is a readiness in the cognizer, not an assembly of the object'. The whole word (sphota) is ascertained as a unity when the final sound occurs, not constructed from accumulated parts. The reading denies that sphota is samanya (a non-composite unity). -/
def piecemeal_construction : Reading :=
  { claims := [ Claim.predication "samavayavata" sphota ] }
theorem piecemeal_construction_inadequate : ¬ contract.Adequate piecemeal_construction := by decide
#guard contract.contradicts piecemeal_construction = true

/- "The final sound is the last phonetic part of the word, and its utterance completes the audible sequence in which the word's meaning is conveyed."
   Why rejected: Treats the final dhvani as a constitutive part (samavayavata) of the word, when the verse insists it is merely the occasion (nimitta) for grasping. The commentary is explicit: 'The final phoneme is not a final part completing a sum'. This reading fails to distinguish the final sound's role (occasion for ascertainment) from the constitution of the object (which remains whole and unassembled). -/
def final_phoneme_as_part : Reading :=
  { claims := [ Claim.predication "bhaga" dhvani ] }
theorem final_phoneme_as_part_inadequate : ¬ contract.Adequate final_phoneme_as_part := by decide
#guard contract.licenses final_phoneme_as_part = false

end Counterexamples

end VakyaVallari.Verses.V1_84
