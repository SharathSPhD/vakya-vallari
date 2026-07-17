/- Verse 1.134 — generated from data/contracts/1.134.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_134

open VakyaVallari

def jnana : Entity := ⟨"jñāna", Sorta.cognition⟩
def svabhavika : Entity := ⟨"svābhāvika", Sorta.property⟩
def sastras : Entity := ⟨"śāstras", Sorta.linguisticItem⟩
def dharma : Entity := ⟨"dharma", Sorta.manifestation⟩
def amnaya : Entity := ⟨"amnāya", Sorta.linguisticItem⟩
def artha : Entity := ⟨"artha", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.relation "hetutvam" (Node.ent dharma) (Node.ent jnana)
    , Claim.relation "asraya" (Node.ent amnaya) (Node.ent jnana)
    , Claim.predication "qualifies_knower" dharma ]
  , denials := [ Claim.predication "svabhavika" jnana
    , Claim.relation "artha_rahita" (Node.ent sastras) (Node.ent artha) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "hetutvam" (Node.ent dharma) (Node.ent jnana)
    , Claim.relation "asraya" (Node.ent amnaya) (Node.ent jnana) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Knowledge is innate and arises naturally without instruction or tradition.'
   Why rejected: Asserts that jñāna is svābhāvika (naturally given), which leads to the false consequence that śāstras are purposeless. The commentary uses this as a reductio: no one, especially not rationalist philosophers, actually treats scriptures as useless. -/
def innate_knowledge : Reading :=
  { claims := [ Claim.predication "svabhavika" jnana ] }
theorem innate_knowledge_inadequate : ¬ contract.Adequate innate_knowledge := by decide
#guard contract.contradicts innate_knowledge = true

/- 'Knowledge can be established by reason alone, without the need for moral-ritual formation.'
   Why rejected: Denies that dharma is causally necessary for knowledge. It treats jñāna as self-standing, independent of the knower's moral-ritual preparation. The commentary explicitly rejects this: 'the knower's moral-ritual formation is causally upstream of his cognitive reach'. -/
def jnana_rational : Entity := ⟨"jñāna-rational", Sorta.cognition⟩
def rational_sufficiency : Reading :=
  { claims := [ Claim.identity jnana jnana_rational ] }
theorem rational_sufficiency_inadequate : ¬ contract.Adequate rational_sufficiency := by decide
#guard contract.licenses rational_sufficiency = false

/- 'The scriptures serve only to describe knowledge that is already established by reason, not to ground it.'
   Why rejected: Denies that amnāya is the ground (nibandhanam) of jñāna, treating it as merely descriptive rather than foundational. The commentary is explicit: 'since dharma is not established by unaided reason, amnayo nibandhanam: tradition is knowledge's ground'. -/
def sastre_prasanskrit : Entity := ⟨"śāstra-descriptive", Sorta.linguisticItem⟩
def scriptures_descriptive_only : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent sastre_prasanskrit) (Node.ent jnana) ] }
theorem scriptures_descriptive_only_inadequate : ¬ contract.Adequate scriptures_descriptive_only := by decide
#guard contract.licenses scriptures_descriptive_only = false

end Counterexamples

end VakyaVallari.Verses.V1_134
