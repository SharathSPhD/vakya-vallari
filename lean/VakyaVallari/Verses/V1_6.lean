/- Verse 1.6 — generated from data/contracts/1.6.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_6

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def sakti : Entity := ⟨"śakti", Sorta.power⟩
def yatasakti : Entity := ⟨"yataśakti", Sorta.power⟩
def bheda : Entity := ⟨"bheda", Sorta.manifestation⟩
def karma : Entity := ⟨"karma", Sorta.absolute⟩
def saakha : Entity := ⟨"śākhā", Sorta.linguisticItem⟩
def angata : Entity := ⟨"āṅgatā", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "asti_sakti" sabda
    , Claim.identity sakti yatasakti
    , Claim.predication "drsyate_in_saakha" yatasakti ]
  , denials := [ Claim.predication "aniyata" sakti ] }

def accepted : Reading :=
  { claims := [ Claim.predication "asti_sakti" sabda
    , Claim.identity sakti yatasakti
    , Claim.predication "drsyate_in_saakha" yatasakti ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Words possess an indeterminate and variable power that manifests differently across ritual traditions.'
   Why rejected: The verse and commentary emphasize yata-saktitvam as determinate and fixed, not variable. This reading contradicts the core assertion that power is restrained and fixed. -/
def indeterminate_power : Reading :=
  { claims := [ Claim.predication "aniyata" sakti ] }
theorem indeterminate_power_inadequate : ¬ contract.Adequate indeterminate_power := by decide
#guard contract.contradicts indeterminate_power = true

/- 'Words have a variable property that depends on context rather than an intrinsic determinate power.'
   Why rejected: Demotes the power of words to a contextual property. The axiom licenses sakti (sort=power) as identical with yatasakti, but this mistaken reading treats sakti as a mere property, creating a sort mismatch that leaves the identity unlicensed. -/
def sakti_property : Entity := ⟨"śakti", Sorta.property⟩
def power_as_property : Reading :=
  { claims := [ Claim.identity sakti_property yatasakti ] }
theorem power_as_property_inadequate : ¬ contract.Adequate power_as_property := by decide
#guard contract.licenses power_as_property = false
theorem power_as_property_sort_error : sakti_property ≠ sakti := by decide

end Counterexamples

end VakyaVallari.Verses.V1_6
