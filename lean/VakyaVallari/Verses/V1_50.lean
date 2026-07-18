/- Verse 1.50 — generated from data/contracts/1.50.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_50

open VakyaVallari

def jnana : Entity := ⟨"jñāna", Sorta.cognition⟩
def jneya : Entity := ⟨"jñeya", Sorta.manifestation⟩
def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def artha : Entity := ⟨"artha", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.predication "sva-prakashate" jnana
    , Claim.predication "jneya-prakashate" jnana
    , Claim.predication "sva-prakashate" sabda
    , Claim.predication "artha-prakashate" sabda
    , Claim.relation "sadrsya" (Node.ent sabda) (Node.ent jnana) ]
  , denials := []
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "sva-prakashate" jnana
    , Claim.predication "jneya-prakashate" jnana
    , Claim.predication "sva-prakashate" sabda
    , Claim.predication "artha-prakashate" sabda ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The linguistic property of sound conveys meanings through its structured patterns.'
   Why rejected: Demotes śabda from linguisticItem to property. Properties lack ontological independence and cannot prakashate (shine forth) or reveal themselves. This sort error makes the self-luminosity claim unlicensed and severs the analogy with cognition. -/
def sabda_prop : Entity := ⟨"śabda", Sorta.property⟩
def sabda_as_property : Reading :=
  { claims := [ Claim.predication "sva-prakashate" sabda_prop ] }
theorem sabda_as_property_inadequate : ¬ contract.Adequate sabda_as_property := by decide
#guard contract.licenses sabda_as_property = false
theorem sabda_as_property_sort_error : sabda_prop ≠ sabda := by decide

/- 'The object of cognition is an unchanging absolute that reveals itself through awareness.'
   Why rejected: Promotes jñeya to absolute rather than manifestation. This contradicts the prakashate relation: absolutes are not manifested by other entities. The object must be a manifestation—something cognition reveals—not a co-equal absolute. -/
def jneya_abs : Entity := ⟨"jñeya", Sorta.absolute⟩
def jneya_as_absolute : Reading :=
  { claims := [ Claim.relation "prakashate" (Node.ent jnana) (Node.ent jneya_abs) ] }
theorem jneya_as_absolute_inadequate : ¬ contract.Adequate jneya_as_absolute := by decide
#guard contract.licenses jneya_as_absolute = false
theorem jneya_as_absolute_sort_error : jneya_abs ≠ jneya := by decide

end Counterexamples

end VakyaVallari.Verses.V1_50
