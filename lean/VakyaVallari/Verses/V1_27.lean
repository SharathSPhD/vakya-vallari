/- Verse 1.27 — generated from data/contracts/1.27.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_27

open VakyaVallari

def sadhu : Entity := ⟨"sādhu", Sorta.linguisticItem⟩
def asadhu : Entity := ⟨"asādhu", Sorta.linguisticItem⟩
def sistha : Entity := ⟨"śiṣṭa", Sorta.power⟩
def agama : Entity := ⟨"āgama", Sorta.power⟩
def artha : Entity := ⟨"artha", Sorta.property⟩
def pratyayana : Entity := ⟨"pratyāyana", Sorta.cognition⟩
def dharma : Entity := ⟨"dharma", Sorta.absolute⟩
def dharmasadhana : Entity := ⟨"dharmasādhana", Sorta.power⟩
def viparita : Entity := ⟨"viparīta", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.relation "pratyayana" (Node.ent sadhu) (Node.ent artha)
    , Claim.relation "pratyayana" (Node.ent asadhu) (Node.ent artha)
    , Claim.relation "asraya" (Node.ent sadhu) (Node.ent sistha)
    , Claim.relation "sadhana" (Node.ent sadhu) (Node.ent dharma)
    , Claim.predication "viparita" asadhu ]
  , denials := [ Claim.predication "fails_to_signify" asadhu ] }

def accepted : Reading :=
  { claims := [ Claim.relation "pratyayana" (Node.ent sadhu) (Node.ent artha)
    , Claim.relation "pratyayana" (Node.ent asadhu) (Node.ent artha)
    , Claim.relation "sadhana" (Node.ent sadhu) (Node.ent dharma)
    , Claim.predication "viparita" asadhu ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Correct words communicate meaning better than incorrect ones.'
   Why rejected: Treats sadhu and asadhu as semantically distinguished in their capacity to convey meaning. But the commentary explicitly states 'artha-pratyayana-abhede' — in conveying meaning there is no difference. This misreading collapses the core concession that both words succeed equally in signification. -/
def semantic_distinction : Reading :=
  { claims := [ Claim.relation "pratyayana" (Node.ent sadhu) (Node.ent artha)
    , Claim.predication "superior" sadhu ] }
theorem semantic_distinction_inadequate : ¬ contract.Adequate semantic_distinction := by decide
#guard contract.licenses semantic_distinction = false

/- 'Incorrect word-forms fail to convey their meanings.'
   Why rejected: Denies that asadhu forms communicate, contradicting the explicit denial that Bhartrhari rejects: 'Bhartrhari does not try to argue that solecisms fail to signify — he grants that they succeed.' This reading reverses the verse's most crucial premise. -/
def solecism_fails : Reading :=
  { claims := [ Claim.predication "fails_to_signify" asadhu ] }
theorem solecism_fails_inadequate : ¬ contract.Adequate solecism_fails := by decide
#guard contract.contradicts solecism_fails = true

end Counterexamples

end VakyaVallari.Verses.V1_27
