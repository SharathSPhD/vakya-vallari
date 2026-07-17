/- Verse 1.76 — generated from data/contracts/1.76.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_76

open VakyaVallari

def sphota : Entity := ⟨"sphota", Sorta.linguisticItem⟩
def prakrta_dhvani : Entity := ⟨"prākṛta-dhvani", Sorta.manifestation⟩
def kala : Entity := ⟨"kāla", Sorta.property⟩
def vowel_quantity : Entity := ⟨"vowel quantity", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "nityatva" sphota
    , Claim.relation "asraya" (Node.ent prakrta_dhvani) (Node.ent kala)
    , Claim.relation "asraya" (Node.ent prakrta_dhvani) (Node.ent vowel_quantity)
    , Claim.relation "upacaryate" (Node.ent kala) (Node.ent sphota)
    , Claim.predication "contrastive" vowel_quantity ]
  , denials := [ Claim.relation "asraya" (Node.ent sphota) (Node.ent vowel_quantity)
    , Claim.relation "asraya" (Node.ent sphota) (Node.ent kala) ] }

def accepted : Reading :=
  { claims := [ Claim.predication "nityatva" sphota
    , Claim.relation "upacaryate" (Node.ent kala) (Node.ent sphota)
    , Claim.predication "contrastive" vowel_quantity ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The eternal word itself has real short, long, and prolated forms due to natural phonetic variations.'
   Why rejected: Wrongly attributes temporal properties to the sphota itself. The commentary is explicit: vowel-quantity resides in the prakrta-dhvani (manifesting sound), not the eternal sphota. This reading commits a sort error by treating the manifestation's properties as properties of the absolute. -/
def temporal_sphota : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent sphota) (Node.ent vowel_quantity) ] }
theorem temporal_sphota_inadequate : ¬ contract.Adequate temporal_sphota := by decide
#guard contract.contradicts temporal_sphota = true

/- 'Time belongs equally to both the eternal word and its manifesting sound, with no figurative relation between them.'
   Why rejected: Misses the technical point of upacaryate: the kala belongs to prakrta-dhvani literally, but only figuratively to sphota. This reading denies the figuration that rescues eternalism, collapsing the distinction between the manifested word and its eternal essence. -/
def no_figuration : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent sphota) (Node.ent kala) ] }
theorem no_figuration_inadequate : ¬ contract.Adequate no_figuration := by decide
#guard contract.contradicts no_figuration = true

end Counterexamples

end VakyaVallari.Verses.V1_76
