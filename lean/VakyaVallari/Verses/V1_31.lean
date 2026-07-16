/- Verse 1.31 — generated from data/contracts/1.31.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_31

open VakyaVallari

def dharma : Entity := ⟨"dharma", Sorta.manifestation⟩
def tarka : Entity := ⟨"tarka", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.predication "avyavacchinna" dharma
    , Claim.predication "lokaprasiddha" dharma ]
  , denials := [ Claim.relation "badhate" (Node.ent tarka) (Node.ent dharma) ] }

def accepted : Reading :=
  { claims := [ Claim.predication "avyavacchinna" dharma
    , Claim.predication "lokaprasiddha" dharma ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Reasoning can overturn the unbroken paths of dharma.'
   Why rejected: Directly contradicts the verse's denial that tarka badhate dharma. The verse explicitly says no one sets them aside by reasoning. -/
def tarka_overturns : Reading :=
  { claims := [ Claim.relation "badhate" (Node.ent tarka) (Node.ent dharma) ] }
theorem tarka_overturns_inadequate : ¬ contract.Adequate tarka_overturns := by decide
#guard contract.contradicts tarka_overturns = true

/- 'Reasoning is what establishes and grounds the dharmic paths in the world.'
   Why rejected: Inverts the epistemological priority. The verse insists that dharma's establishment in the world is prior and independent of reasoning; tarka arrives too late to judge. This reading incorrectly makes reasoning the ground of dharma's worldly establishment. -/
def tarka_ground_dharma : Reading :=
  { claims := [ Claim.relation "vyavasthapayate" (Node.ent tarka) (Node.ent dharma) ] }
theorem tarka_ground_dharma_inadequate : ¬ contract.Adequate tarka_ground_dharma := by decide
#guard contract.licenses tarka_ground_dharma = false

end Counterexamples

end VakyaVallari.Verses.V1_31
