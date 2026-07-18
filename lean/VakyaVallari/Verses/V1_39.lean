/- Verse 1.39 — generated from data/contracts/1.39.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_39

open VakyaVallari

def jnana : Entity := ⟨"jñāna", Sorta.cognition⟩
def pratyaksa : Entity := ⟨"pratyakṣa", Sorta.cognition⟩
def sanka : Entity := ⟨"śaṅka", Sorta.property⟩
def tarka : Entity := ⟨"tarka", Sorta.power⟩
def niscaya : Entity := ⟨"niśchaya", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asrita" (Node.ent jnana) (Node.ent pratyaksa)
    , Claim.predication "atyanta-nirvikalpa" jnana
    , Claim.relation "grahana-sthana" (Node.ent tarka) (Node.ent sanka)
    , Claim.identity niscaya jnana ]
  , denials := [ Claim.relation "nivartayet" (Node.ent tarka) (Node.ent jnana)
    , Claim.predication "sankamanvita" pratyaksa ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "asrita" (Node.ent jnana) (Node.ent pratyaksa)
    , Claim.predication "atyanta-nirvikalpa" jnana
    , Claim.identity niscaya jnana ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Rational argument has the power to overturn any cognition, whether it is grounded in perception or not.'
   Why rejected: Contradicts the core epistemological claim: argument only has grip where doubt already exists. A perceptually-grounded cognition offers no foothold for argument to work. -/
def argument_power_universality : Reading :=
  { claims := [ Claim.relation "nivartayet" (Node.ent tarka) (Node.ent jnana) ] }
theorem argument_power_universality_inadequate : ¬ contract.Adequate argument_power_universality := by decide
#guard contract.contradicts argument_power_universality = true

/- 'Perceptual knowledge is itself subject to doubt, so argument can still be used to overturn perceptually-grounded cognitions.'
   Why rejected: Denies the phenomenological fact the verse establishes: that a cognition standing on perception's side is presented without residual doubt. This misses the property atyanta-nirvikalpa essential to perceptual cognition. -/
def pratyaksa_dubitable : Entity := ⟨"pratyakṣa", Sorta.property⟩
def perception_as_doubt_source : Reading :=
  { claims := [ Claim.predication "sankamanvita" pratyaksa_dubitable ] }
theorem perception_as_doubt_source_inadequate : ¬ contract.Adequate perception_as_doubt_source := by decide
#guard contract.licenses perception_as_doubt_source = false
theorem perception_as_doubt_source_sort_error : pratyaksa_dubitable ≠ pratyaksa := by decide

end Counterexamples

end VakyaVallari.Verses.V1_39
