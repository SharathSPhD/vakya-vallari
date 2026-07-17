/- Verse 1.139 — generated from data/contracts/1.139.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_139

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def samarthya : Entity := ⟨"sāmarthya", Sorta.power⟩
def dharma : Entity := ⟨"dharma", Sorta.absolute⟩
def sadhu : Entity := ⟨"sādhu", Sorta.property⟩
def abhyudaya : Entity := ⟨"abhyudaya", Sorta.absolute⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent samarthya) (Node.ent sabda)
    , Claim.relation "extends" (Node.ent samarthya) (Node.ent dharma)
    , Claim.predication "sadhu" sabda ]
  , denials := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent samarthya) (Node.ent sabda)
    , Claim.relation "extends" (Node.ent samarthya) (Node.ent dharma)
    , Claim.predication "sadhu" sabda ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Correct and incorrect word-forms are equally efficacious in pursuing dharma.'
   Why rejected: Denies that samarthya (capacity/power) is form-bound. The verse's doctrine holds that power resides specifically in sadhu (correct) forms. Incorrect forms (asadhu) lack this power and cannot efficaciously support dharmic aims. -/
def asadhu : Entity := ⟨"asādhu", Sorta.property⟩
def form_indifference : Reading :=
  { claims := [ Claim.predication "sadhu" asadhu ] }
theorem form_indifference_inadequate : ¬ contract.Adequate form_indifference := by decide
#guard contract.licenses form_indifference = false

end Counterexamples

end VakyaVallari.Verses.V1_139
