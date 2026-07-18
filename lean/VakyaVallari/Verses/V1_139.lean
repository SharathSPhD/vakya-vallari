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
def drsta : Entity := ⟨"drṣṭa", Sorta.manifestation⟩
def adrsta : Entity := ⟨"adrṣṭa", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent samarthya) (Node.ent sabda)
    , Claim.relation "extends" (Node.ent samarthya) (Node.ent dharma)
    , Claim.predication "sadhu" sabda
    , Claim.relation "enables" (Node.ent sadhu) (Node.ent abhyudaya) ]
  , denials := []
  , reported := [] }

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

/- 'Word-forms have demonstrable causal efficacy in the visible domain (poison cures illness), but dharmic effects operate through different metaphysical principles; the form-bound power of language cannot be transferred to the unseen realm.'
   Why rejected: The verse's foundational inference extends samarthya from the visible domain (drṣṭa, with perceptible poison-cure effects) to the unseen domain (adrṣṭa, dharma with invisible fruits). The commentary explicitly identifies this as 'the standard extension from drṣṭa to adrṣṭa efficacy that ritual reasoning always makes.' This reading denies that extension, treating samarthya as domain-specific to visible phenomena. It fails because it rejects the cross-domain transferability that grounds the entire ethical doctrine. -/
def domain_restrict_drsta : Entity := ⟨"drṣṭa", Sorta.manifestation⟩
def domain_restrict_adrsta : Entity := ⟨"adrṣṭa", Sorta.manifestation⟩
def domain_restriction : Reading :=
  { claims := [ Claim.relation "restricted" (Node.ent samarthya) (Node.ent domain_restrict_drsta) ] }
theorem domain_restriction_inadequate : ¬ contract.Adequate domain_restriction := by decide
#guard contract.licenses domain_restriction = false

end Counterexamples

end VakyaVallari.Verses.V1_139
