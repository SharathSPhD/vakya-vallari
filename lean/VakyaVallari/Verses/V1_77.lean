/- Verse 1.77 — generated from data/contracts/1.77.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_77

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def sphota : Entity := ⟨"sphota", Sorta.linguisticItem⟩
def prakrta_dhvani : Entity := ⟨"prakṛta-dhvani", Sorta.linguisticItem⟩
def vaikrta_dhvani : Entity := ⟨"vaikṛta-dhvani", Sorta.linguisticItem⟩
def vrtti_bheda : Entity := ⟨"vṛtti-bheda", Sorta.property⟩
def manifestation_timing : Entity := ⟨"manifestation-duration", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.relation "vahate" (Node.ent vaikrta_dhvani) (Node.ent vrtti_bheda)
    , Claim.relation "samarthayate" (Node.ent prakrta_dhvani) (Node.ent sphota)
    , Claim.predication "avisambhedya" sphota
    , Claim.predication "avaisambhadika" vrtti_bheda ]
  , denials := [ Claim.relation "bhidyate" (Node.ent sphota) (Node.ent vaikrta_dhvani) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "vahate" (Node.ent vaikrta_dhvani) (Node.ent vrtti_bheda)
    , Claim.predication "avisambhedya" sphota ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The modified sounds divide or differentiate the sphota into distinct essences.'
   Why rejected: The commentary explicitly denies this: the sphota is not divided by the vaikrta dhvani. The non-contrastive sounds only affect the duration of manifestation, not the underlying essence. -/
def sphota_divided_by_vaikrta : Reading :=
  { claims := [ Claim.relation "bhidyate" (Node.ent sphota) (Node.ent vaikrta_dhvani) ] }
theorem sphota_divided_by_vaikrta_inadequate : ¬ contract.Adequate sphota_divided_by_vaikrta := by decide
#guard contract.contradicts sphota_divided_by_vaikrta = true

/- 'The differences in speed of delivery determine which word (sphota) is manifested.'
   Why rejected: The commentary establishes a clear division of labor: the contrastive properties (prakrta dhvani—quantity, phonemic pattern) determine which sphota manifests, while the tempo differences (vrtti-bheda) only affect the duration of manifestation, not which word is produced. -/
def tempo_determines_sphota : Reading :=
  { claims := [ Claim.relation "samarthayate" (Node.ent vrtti_bheda) (Node.ent sphota) ] }
theorem tempo_determines_sphota_inadequate : ¬ contract.Adequate tempo_determines_sphota := by decide
#guard contract.licenses tempo_determines_sphota = false

/- 'All sound differences, whether related to quantity or tempo, work together uniformly to determine and manifest the sphota.'
   Why rejected: The entire explanatory power of the commentary depends on distinguishing prakrta (contrastive: quantity, phonemic pattern) from vaikrta (non-contrastive: tempo, voice) dhvani. Prakrta determines WHICH sphota; vaikrta determines only HOW LONG manifestation takes. This reading collapses that critical distinction and loses the phonemic/phonetic insight. -/
def prakrta_vaikrta_equivalence : Reading :=
  { claims := [ Claim.identity prakrta_dhvani vaikrta_dhvani ] }
theorem prakrta_vaikrta_equivalence_inadequate : ¬ contract.Adequate prakrta_vaikrta_equivalence := by decide
#guard contract.licenses prakrta_vaikrta_equivalence = false

end Counterexamples

end VakyaVallari.Verses.V1_77
