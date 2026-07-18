/- Verse 1.30 — generated from data/contracts/1.30.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_30

open VakyaVallari

def agama : Entity := ⟨"āgama", Sorta.power⟩
def tarka : Entity := ⟨"tarka", Sorta.power⟩
def dharma : Entity := ⟨"dharma", Sorta.manifestation⟩
def rsi : Entity := ⟨"ṛṣi", Sorta.absolute⟩
def jnana : Entity := ⟨"jñāna", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent dharma) (Node.ent agama)
    , Claim.relation "asraya" (Node.ent jnana) (Node.ent agama)
    , Claim.predication "samvit" rsi ]
  , denials := [ Claim.relation "svatantra" (Node.ent tarka) (Node.ent dharma)
    , Claim.predication "aparoksa" jnana ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent dharma) (Node.ent agama)
    , Claim.relation "asraya" (Node.ent jnana) (Node.ent agama) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Reasoning alone is sufficient to establish dharma.'
   Why rejected: The verse explicitly negates this: dharma is not established by reasoning apart from tradition. Tarka is not self-sufficient; it depends on agama. -/
def tarka_sufficient : Reading :=
  { claims := [ Claim.relation "svatantra" (Node.ent tarka) (Node.ent dharma) ] }
theorem tarka_sufficient_inadequate : ¬ contract.Adequate tarka_sufficient := by decide
#guard contract.contradicts tarka_sufficient = true

/- 'The seers possess direct, unmediated knowledge of truth.'
   Why rejected: The verse contradicts this in its second line: even rsi-jnana is agama-purvaka, preceded by tradition. The commentary emphasizes: 'There is no such unmediated layer.' -/
def rsi_unmediated_knowledge : Reading :=
  { claims := [ Claim.predication "aparoksa" jnana ] }
theorem rsi_unmediated_knowledge_inadequate : ¬ contract.Adequate rsi_unmediated_knowledge := by decide
#guard contract.contradicts rsi_unmediated_knowledge = true

end Counterexamples

end VakyaVallari.Verses.V1_30
