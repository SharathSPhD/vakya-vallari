/- Verse 1.140 — generated from data/contracts/1.140.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_140

open VakyaVallari

def agama : Entity := ⟨"āgama", Sorta.absolute⟩
def artha : Entity := ⟨"artha", Sorta.manifestation⟩
def adrstaphala : Entity := ⟨"adṛṣṭa-phala", Sorta.property⟩
def viparita : Entity := ⟨"viparīta", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.predication "adrstaphala" artha
    , Claim.relation "asraya" (Node.ent agama) (Node.ent artha)
    , Claim.predication "sakyate" viparita
    , Claim.relation "virodha" (Node.ent viparita) (Node.ent agama) ]
  , denials := [ Claim.predication "niscaya" agama ] }

def accepted : Reading :=
  { claims := [ Claim.predication "adrstaphala" artha
    , Claim.relation "asraya" (Node.ent agama) (Node.ent artha)
    , Claim.predication "sakyate" viparita ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Tradition provides certain and conclusive knowledge of unseen objects, and no opposing view can be validly stated.'
   Why rejected: Directly contradicts the niscaya denial and the virodha axiom. The verse explicitly acknowledges that for any agama, an opposite can be alleged, making tradition necessarily contested and indemonstrable. -/
def agama_certain : Reading :=
  { claims := [ Claim.predication "niscaya" agama ] }
theorem agama_certain_inadequate : ¬ contract.Adequate agama_certain := by decide
#guard contract.contradicts agama_certain = true

/- 'Unseen objects are primarily known through direct perception; tradition is secondary.'
   Why rejected: The verse emphasizes sarva (everyone, universal scope) arrives at these objects through agama, treating tradition as the universal and primary means. The commentary stresses there is no other road. Reversing this hierarchy contradicts the core asraya axiom. -/
def pratyaksa : Entity := ⟨"pratyakṣa", Sorta.power⟩
def perception_primary : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent pratyaksa) (Node.ent artha) ] }
theorem perception_primary_inadequate : ¬ contract.Adequate perception_primary := by decide
#guard contract.licenses perception_primary = false

end Counterexamples

end VakyaVallari.Verses.V1_140
