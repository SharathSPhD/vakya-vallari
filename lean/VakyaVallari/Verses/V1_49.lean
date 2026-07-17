/- Verse 1.49 — generated from data/contracts/1.49.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_49

open VakyaVallari

def sphota : Entity := ⟨"sphota", Sorta.linguisticItem⟩
def dhvani : Entity := ⟨"dhvani", Sorta.linguisticItem⟩
def pratibimba : Entity := ⟨"pratibimbam", Sorta.manifestation⟩
def jala : Entity := ⟨"jala", Sorta.absolute⟩
def jalakriya : Entity := ⟨"jalakriyā", Sorta.property⟩
def dharma : Entity := ⟨"dharma", Sorta.property⟩
def anyatra : Entity := ⟨"anyatra", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "sthitam" sphota
    , Claim.relation "vivartate" (Node.ent sphota) (Node.ent dhvani)
    , Claim.predication "gunagraham" dhvani
    , Claim.relation "upalakshyate" (Node.ent dhvani) (Node.ent sphota)
    , Claim.relation "anueti" (Node.ent pratibimba) (Node.ent jalakriya) ]
  , denials := [ Claim.predication "parinamate" sphota
    , Claim.relation "hetutva" (Node.ent sphota) (Node.ent jalakriya)
    , Claim.relation "vivartate" (Node.ent dhvani) (Node.ent sphota) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "anueti" (Node.ent pratibimba) (Node.ent jalakriya)
    , Claim.predication "sthitam" sphota
    , Claim.relation "vivartate" (Node.ent sphota) (Node.ent dhvani) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The word is intrinsically extended in time, with distinct temporal phases of length, speed, and accent.'
   Why rejected: This reading treats sphota as having the temporal properties intrinsic to it, when the verse and commentary insist these are properties of dhvani only, transferred in appearance. The sort error (treating absolute sphota as having temporal properties of a linguistic item) makes the gunagraham-claim unlicensed. -/
def sphota_sequenced : Entity := ⟨"sphoṭa", Sorta.linguisticItem⟩
def intrinsic_sequentiality : Reading :=
  { claims := [ Claim.predication "gunagraham" sphota_sequenced ] }
theorem intrinsic_sequentiality_inadequate : ¬ contract.Adequate intrinsic_sequentiality := by decide
#guard contract.licenses intrinsic_sequentiality = false

/- 'The appearance of the word in speech becomes the true basis for understanding what the word essentially is.'
   Why rejected: This reverses the direction of the manifestation relation: it treats dhvani as the ground of which sphota is the manifestation, when the verse and commentary establish sphota as the sequenceless ground and dhvani as its manifestation. The reversed direction contradicts the denial that vivartate does NOT go from dhvani to sphota. -/
def manifest_becomes_ground : Reading :=
  { claims := [ Claim.relation "vivartate" (Node.ent dhvani) (Node.ent sphota) ] }
theorem manifest_becomes_ground_inadequate : ¬ contract.Adequate manifest_becomes_ground := by decide
#guard contract.contradicts manifest_becomes_ground = true

/- 'The properties of sound actually belong to the word itself, not merely in appearance.'
   Why rejected: This denies the crucial distinction between the appearance of shared properties (upalakshya) and actual possession. The commentary is explicit: 'the trembling belongs to the water, but presents itself as belonging to the reflected moon.' This reading misses the subtle point of the reflection metaphor entirely. -/
def property_transfer_is_real : Reading :=
  { claims := [ Claim.predication "gunagraham" sphota ] }
theorem property_transfer_is_real_inadequate : ¬ contract.Adequate property_transfer_is_real := by decide
#guard contract.licenses property_transfer_is_real = false

end Counterexamples

end VakyaVallari.Verses.V1_49
