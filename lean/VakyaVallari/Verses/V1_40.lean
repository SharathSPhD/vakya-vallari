/- Verse 1.40 — generated from data/contracts/1.40.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_40

open VakyaVallari

def punya : Entity := ⟨"puṇya", Sorta.property⟩
def papa : Entity := ⟨"pāpa", Sorta.property⟩
def manusya : Entity := ⟨"manuṣya", Sorta.manifestation⟩
def sastra : Entity := ⟨"śāstra", Sorta.linguisticItem⟩
def jnana : Entity := ⟨"jñāna", Sorta.cognition⟩
def prayojana : Entity := ⟨"prayojana", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "sarvagata" jnana
    , Claim.predication "alpa" prayojana
    , Claim.predication "anapeksita" jnana ]
  , denials := [ Claim.predication "apeksa" jnana ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "alpa" prayojana
    , Claim.predication "sarvagata" jnana ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The treatise is essential for understanding the moral distinction between merit and sin.'
   Why rejected: Asserts that sastra is necessary for basic moral knowledge, contradicting the verse's claim that all people already know punya and papa without formal instruction. -/
def sastra_foundational : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent jnana) (Node.ent sastra) ] }
theorem sastra_foundational_inadequate : ¬ contract.Adequate sastra_foundational := by decide
#guard contract.licenses sastra_foundational = false

/- 'Moral knowledge requires formal instruction; the common person cannot grasp the distinction between merit and sin without studying the treatise.'
   Why rejected: Claims that jnana is dependent on formal learning (apeksa); contradicts the explicit denial established by the commentary that 'Ordinary moral competence does not wait upon learning,' which asserts moral knowledge's independence (anapeksita) from textual instruction. -/
def learning_dependent_ethics : Reading :=
  { claims := [ Claim.predication "apeksa" jnana ] }
theorem learning_dependent_ethics_inadequate : ¬ contract.Adequate learning_dependent_ethics := by decide
#guard contract.contradicts learning_dependent_ethics = true

end Counterexamples

end VakyaVallari.Verses.V1_40
