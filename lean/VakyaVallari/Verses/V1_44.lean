/- Verse 1.44 — generated from data/contracts/1.44.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_44

open VakyaVallari

def dhvani : Entity := ⟨"dhvani", Sorta.linguisticItem⟩
def sphota : Entity := ⟨"sphota", Sorta.linguisticItem⟩
def artha : Entity := ⟨"artha", Sorta.property⟩
def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.relation "bhidyate" (Node.ent dhvani) (Node.ent sphota)
    , Claim.predication "nimitta" dhvani
    , Claim.predication "prayujyate" sphota
    , Claim.relation "asraya" (Node.ent sphota) (Node.ent artha) ]
  , denials := [ Claim.predication "nimitta" sphota ] }

def accepted : Reading :=
  { claims := [ Claim.relation "bhidyate" (Node.ent dhvani) (Node.ent sphota)
    , Claim.predication "nimitta" dhvani
    , Claim.predication "prayujyate" sphota ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The word is a single undifferentiated entity that somehow functions both as the audible sound and as the bearer of meaning.'
   Why rejected: Erases the verse's central distinction of two words. The verse explicitly states those who know words discern two, and the commentary explains that failure to distinguish nimitta (sound-cause) from sphota (meaning-bearer) leaves unexplained how a never-wholly-present sound-series can convey whole meaning. -/
def single_undifferentiated_word : Reading :=
  { claims := [ Claim.identity dhvani sphota ] }
theorem single_undifferentiated_word_inadequate : ¬ contract.Adequate single_undifferentiated_word := by decide
#guard contract.licenses single_undifferentiated_word = false

/- 'The meaning-bearing word is the cause of the audible sound, which is merely its effect.'
   Why rejected: Reverses the verse's primary assignment. Though the contested note acknowledges some read the inner word as causing utterance, the encoded reading makes the sound-complex (dhvani) the nimitta-cause, and the other word (sphota) what is deployed toward meaning. Asserting sphota as nimitta contradicts the distinction the commentary draws between what is expressed and what expresses. -/
def causality_inverted : Reading :=
  { claims := [ Claim.predication "nimitta" sphota ] }
theorem causality_inverted_inadequate : ¬ contract.Adequate causality_inverted := by decide
#guard contract.contradicts causality_inverted = true

end Counterexamples

end VakyaVallari.Verses.V1_44
