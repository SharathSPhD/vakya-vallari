/- Verse 1.41 — generated from data/contracts/1.41.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_41

open VakyaVallari

def agama : Entity := ⟨"āgama", Sorta.absolute⟩
def caitanya : Entity := ⟨"caitanya", Sorta.absolute⟩
def hetuvada : Entity := ⟨"hetuvāda", Sorta.power⟩
def upasina : Entity := ⟨"upāsīna", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.predication "avicchedena_vartate" agama
    , Claim.predication "avicchedena_vartate" caitanya
    , Claim.relation "na_badhyate" (Node.ent hetuvada) (Node.ent agama) ]
  , denials := [ Claim.relation "badhyate" (Node.ent hetuvada) (Node.ent agama) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "avicchedena_vartate" agama
    , Claim.relation "na_badhyate" (Node.ent hetuvada) (Node.ent agama) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'This conventional teaching, which is transmitted without interruption, cannot be questioned by those who practice it.'
   Why rejected: Demotes agama from an absolute standing condition to a mere property or convention. Loses the transcendental status the commentary attributes to it: agama is not a body of claims but a condition that every argument presupposes, like consciousness itself. Renders the analogy vacuous. -/
def agama_prop : Entity := ⟨"āgama", Sorta.property⟩
def conventional_property : Reading :=
  { claims := [ Claim.predication "avicchedena_vartate" agama_prop ] }
theorem conventional_property_inadequate : ¬ contract.Adequate conventional_property := by decide
#guard contract.licenses conventional_property = false
theorem conventional_property_sort_error : agama_prop ≠ agama := by decide

/- 'This tradition, which persists like consciousness, can still be refuted by logical arguments for those who do not subscribe to it.'
   Why rejected: Reverses the core claim: asserts hetuvada CAN badhyate (overturn) agama under certain conditions. Contradicts the commentary's structural claim that hetuvada arrives 'inside' the condition and thus cannot escape or refute it. The impossibility is not contingent but transcendental. -/
def context_dependent_refutation : Reading :=
  { claims := [ Claim.relation "badhyate" (Node.ent hetuvada) (Node.ent agama) ] }
theorem context_dependent_refutation_inadequate : ¬ contract.Adequate context_dependent_refutation := by decide
#guard contract.contradicts context_dependent_refutation = true

end Counterexamples

end VakyaVallari.Verses.V1_41
