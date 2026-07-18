/- Verse 1.16-17 — generated from data/contracts/1.16-17.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_16_17

open VakyaVallari

def pada : Entity := ⟨"pada", Sorta.linguisticItem⟩
def siddhi : Entity := ⟨"siddhi", Sorta.manifestation⟩
def marga : Entity := ⟨"mārga", Sorta.manifestation⟩
def moksa : Entity := ⟨"mokṣa", Sorta.absolute⟩
def viparyasa : Entity := ⟨"viparyāsa", Sorta.cognition⟩
def vedajna : Entity := ⟨"vedajña", Sorta.cognition⟩
def chandomayi_tanu : Entity := ⟨"chandomayī tanū", Sorta.manifestation⟩
def chandas_yoni : Entity := ⟨"chandas yoni", Sorta.absolute⟩
def atman : Entity := ⟨"ātman", Sorta.absolute⟩

def contract : Contract :=
  { axioms := [ Claim.identity chandomayi_tanu chandas_yoni
    , Claim.identity chandomayi_tanu atman
    , Claim.predication "pada_sabda" pada
    , Claim.predication "ajihma" marga
    , Claim.relation "asraya" (Node.ent pada) (Node.ent siddhi)
    , Claim.relation "niyati" (Node.ent marga) (Node.ent moksa) ]
  , denials := [ Claim.predication "viparyasta" vedajna
    , Claim.relation "bhinna" (Node.ent chandomayi_tanu) (Node.ent atman) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent pada) (Node.ent siddhi)
    , Claim.relation "niyati" (Node.ent marga) (Node.ent moksa)
    , Claim.identity chandomayi_tanu atman
    , Claim.predication "ajihma" marga ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Words are merely linguistic tools for communicating about reality.'
   Why rejected: Demotes pada to a linguistic property, erasing the double sense (foothold-and-word) that makes it both a means and the metaphysical foundation of realization. The sort error breaks the pun and the claim that grammar is the direct path. -/
def pada_property : Entity := ⟨"pada", Sorta.property⟩
def pada_as_property : Reading :=
  { claims := [ Claim.predication "avedaka" pada_property ] }
theorem pada_as_property_inadequate : ¬ contract.Adequate pada_as_property := by decide
#guard contract.licenses pada_as_property = false
theorem pada_as_property_sort_error : pada_property ≠ pada := by decide

/- 'The Veda-knower perceives the body made of Veda as something other than the Self.'
   Why rejected: Introduces dualism between chandomayi_tanu and atman, contradicting the axiom of their identity. The non-dual recognition is the entire force of the vision. -/
def dual_self_and_veda : Reading :=
  { claims := [ Claim.relation "bhinna" (Node.ent chandomayi_tanu) (Node.ent atman) ] }
theorem dual_self_and_veda_inadequate : ¬ contract.Adequate dual_self_and_veda := by decide
#guard contract.contradicts dual_self_and_veda = true

/- 'Ritual practice and meditation provide equally direct paths to liberation.'
   Why rejected: Contradicts the commentary's claim that 'grammar's superiority lies in going directly' — the uniqueness of directness is central, not plurality of equivalent paths. -/
def yajna : Entity := ⟨"yajña", Sorta.manifestation⟩
def plural_equal_paths : Reading :=
  { claims := [ Claim.relation "niyati" (Node.ent yajna) (Node.ent moksa) ] }
theorem plural_equal_paths_inadequate : ¬ contract.Adequate plural_equal_paths := by decide
#guard contract.licenses plural_equal_paths = false

end Counterexamples

end VakyaVallari.Verses.V1_16_17
