/- Verse 1.115 — generated from data/contracts/1.115.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_115

open VakyaVallari

def prana : Entity := ⟨"prāṇa", Sorta.power⟩
def sabda : Entity := ⟨"śabda", Sorta.absolute⟩
def granthi : Entity := ⟨"granthi", Sorta.manifestation⟩
def varna : Entity := ⟨"varṇa", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.relation "vahati" (Node.ent prana) (Node.ent sabda)
    , Claim.relation "vibhajati" (Node.ent prana) (Node.ent granthi)
    , Claim.relation "abhivyajati" (Node.ent prana) (Node.ent varna)
    , Claim.relation "upaliyate" (Node.ent prana) (Node.ent varna)
    , Claim.predication "prthagvidha" varna ]
  , denials := [ Claim.predication "guhyavastha" prana ] }

def accepted : Reading :=
  { claims := [ Claim.relation "abhivyajati" (Node.ent prana) (Node.ent varna)
    , Claim.relation "upaliyate" (Node.ent prana) (Node.ent varna)
    , Claim.predication "prthagvidha" varna ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The breath, having manifested the phonemes, remains concealed within those very phonemes.'
   Why rejected: Contradicts the commentary's core assertion that the carrier does not survive delivery. The verse emphasizes total consumption (upaliyate as 'dissolves into'), not latent persistence ('merges/hides within'), which the contested note identifies as the less supported reading. -/
def prana_persists_hidden : Reading :=
  { claims := [ Claim.predication "guhyavastha" prana ] }
theorem prana_persists_hidden_inadequate : ¬ contract.Adequate prana_persists_hidden := by decide
#guard contract.contradicts prana_persists_hidden = true

/- 'The breath divides itself into the knots of audible sound, which then dissolve into the phonemes.'
   Why rejected: Mistakes granthi (the word's condensed form as lodged in prana) for an intermediate product. Granthi is not a separate phonetic entity but the unified form before articulation; the phonemes (varna) are the sole final product of manifestation. This reverses the ontological structure: granthi is predicate to vibhajati, not object. -/
def granthi_final : Entity := ⟨"granthi", Sorta.linguisticItem⟩
def granthi_as_final_product : Reading :=
  { claims := [ Claim.relation "upaliyate" (Node.ent granthi) (Node.ent varna) ] }
theorem granthi_as_final_product_inadequate : ¬ contract.Adequate granthi_as_final_product := by decide
#guard contract.licenses granthi_as_final_product = false
theorem granthi_as_final_product_sort_error : granthi_final ≠ granthi := by decide

end Counterexamples

end VakyaVallari.Verses.V1_115
