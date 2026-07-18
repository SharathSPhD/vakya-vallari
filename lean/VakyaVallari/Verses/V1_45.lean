/- Verse 1.45 — generated from data/contracts/1.45.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_45

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def sphota : Entity := ⟨"sphota", Sorta.linguisticItem⟩
def buddhi : Entity := ⟨"buddhi", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.predication "abhinna" sphota
    , Claim.relation "buddhibheda" (Node.ent sabda) (Node.ent sphota)
    , Claim.predication "vivarta_compatible" sphota ]
  , denials := [ Claim.relation "atmabheda" (Node.ent sabda) (Node.ent sphota) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "abhinna" sphota
    , Claim.relation "buddhibheda" (Node.ent sabda) (Node.ent sphota) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Sound and sphota are fundamentally different entities in essence.'
   Why rejected: The commentary attributes atmabheda to puranagas but the endorsed position (buddhibheda) contradicts this. The verse makes clear that sphota is abhinna with only cognitive difference, not essential difference. -/
def atmabheda_doctrine : Reading :=
  { claims := [ Claim.relation "atmabheda" (Node.ent sabda) (Node.ent sphota) ] }
theorem atmabheda_doctrine_inadequate : ¬ contract.Adequate atmabheda_doctrine := by decide
#guard contract.contradicts atmabheda_doctrine = true

/- 'Sphota is merely a manifestation or appearance of sound itself.'
   Why rejected: The commentary emphasizes sphota as abhinna (undivided/independent), suggesting it transcends or equals sound ontologically, not as a derivative manifestation. Treating it as a manifestation demotes its status incorrectly. -/
def sphota_wrong : Entity := ⟨"sphota", Sorta.manifestation⟩
def sphota_manifestation : Reading :=
  { claims := [ Claim.relation "vivartate" (Node.ent sabda) (Node.ent sphota_wrong) ] }
theorem sphota_manifestation_inadequate : ¬ contract.Adequate sphota_manifestation := by decide
#guard contract.licenses sphota_manifestation = false
theorem sphota_manifestation_sort_error : sphota_wrong ≠ sphota := by decide

/- 'Sound and sphota are identical without any cognitive difference whatsoever.'
   Why rejected: The verse explicitly states that difference arises from cognitive variation (buddhibheda). Asserting identity without cognitive differentiation contradicts the buddhibheda relation. -/
def no_cognitive_variation : Reading :=
  { claims := [ Claim.identity sabda sphota ] }
theorem no_cognitive_variation_inadequate : ¬ contract.Adequate no_cognitive_variation := by decide
#guard contract.licenses no_cognitive_variation = false

end Counterexamples

end VakyaVallari.Verses.V1_45
