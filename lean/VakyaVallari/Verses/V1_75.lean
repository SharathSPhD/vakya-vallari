/- Verse 1.75 — generated from data/contracts/1.75.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_75

open VakyaVallari

def sphota : Entity := ⟨"sphota", Sorta.linguisticItem⟩
def dhvani : Entity := ⟨"dhvani", Sorta.linguisticItem⟩
def vrtti : Entity := ⟨"vṛtti", Sorta.property⟩
def grahana_upadhi : Entity := ⟨"grahaṇopādhi", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "abhinna-kala" sphota
    , Claim.predication "dhvani-kala-anupatin" sphota
    , Claim.relation "vivartate" (Node.ent sphota) (Node.ent dhvani)
    , Claim.relation "asraya" (Node.ent vrtti) (Node.ent grahana_upadhi) ]
  , denials := [ Claim.predication "binna-kala" sphota
    , Claim.predication "bheda" sphota ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "abhinna-kala" sphota
    , Claim.predication "dhvani-kala-anupatin" sphota ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The sphota is temporally divisible and takes time like the sounds.'
   Why rejected: The verse explicitly establishes the sphota is abhinna-kala (timeless). Only the sounds (dhvani) that manifest it have temporal extension. The appearance of temporality is mediated through manifestation, not intrinsic to the sphota. -/
def sphota_temporal : Reading :=
  { claims := [ Claim.predication "binna-kala" sphota ] }
theorem sphota_temporal_inadequate : ¬ contract.Adequate sphota_temporal := by decide
#guard contract.contradicts sphota_temporal = true

/- 'The substance of the sphota itself varies according to different utterances and contexts.'
   Why rejected: The commentary explicitly denies this: 'what differs is not the sphota but its vrtti'. The sphota's substance is invariant; only its mode of functioning (vrtti) differs according to conditions of apprehension. -/
def sphota_mutable : Reading :=
  { claims := [ Claim.predication "bheda" sphota ] }
theorem sphota_mutable_inadequate : ¬ contract.Adequate sphota_mutable := by decide
#guard contract.contradicts sphota_mutable = true

/- 'The sounds (dhvani) determine the word-essence (sphota); they are the source from which it arises.'
   Why rejected: The relationship is reversed. The sphota is the timeless word-essence that manifests through sounds. The sounds are the manifestation (vivartate from sphota), not the source. Sphota is ontologically primary. -/
def sounds_determine : Reading :=
  { claims := [ Claim.relation "vivartate" (Node.ent dhvani) (Node.ent sphota) ] }
theorem sounds_determine_inadequate : ¬ contract.Adequate sounds_determine := by decide
#guard contract.licenses sounds_determine = false

end Counterexamples

end VakyaVallari.Verses.V1_75
