/- Verse 1.87 — generated from data/contracts/1.87.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_87

open VakyaVallari

def adya_samkhya_grahanam : Entity := ⟨"ādya-saṃkhyā-grahaṇam", Sorta.cognition⟩
def samkhya_antara_pratipatti : Entity := ⟨"saṃkhyāntara-pratipatti", Sorta.cognition⟩
def sabdantara_sruti : Entity := ⟨"śabdāntara-śruti", Sorta.power⟩
def sabda_antara_pratipatti : Entity := ⟨"śabda-antara-pratipatti", Sorta.cognition⟩
def upaya : Entity := ⟨"upāya", Sorta.power⟩
def sabda_tattva : Entity := ⟨"śabda-tattva", Sorta.absolute⟩
def samskara : Entity := ⟨"saṃskāra", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.relation "upaya" (Node.ent adya_samkhya_grahanam) (Node.ent samkhya_antara_pratipatti)
    , Claim.relation "upaya" (Node.ent sabdantara_sruti) (Node.ent sabda_antara_pratipatti)
    , Claim.relation "hetu" (Node.ent sabdantara_sruti) (Node.ent samskara)
    , Claim.predication "vivartamana" sabda_tattva ]
  , denials := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "upaya" (Node.ent adya_samkhya_grahanam) (Node.ent samkhya_antara_pratipatti)
    , Claim.relation "upaya" (Node.ent sabdantara_sruti) (Node.ent sabda_antara_pratipatti) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The means by which one grasps numbers operates only in arithmetic, not in linguistic learning.'
   Why rejected: Contradicts the verse's explicit parallelism. The verse states 'so too' (tathā) for words, establishing that the systematic means applies equally to linguistic and numerical domains. Reading it as number-exclusive denies the verse's central argumentative structure. -/
def exclusive_arithmetic : Reading :=
  { claims := [ Claim.predication "arithmetic_only" upaya ] }
theorem exclusive_arithmetic_inadequate : ¬ contract.Adequate exclusive_arithmetic := by decide
#guard contract.licenses exclusive_arithmetic = false

/- 'Word-learning and number-learning are completely independent intellectual capacities with no systematic connection.'
   Why rejected: Contradicts the verse's yathā-tathā (as...so) structure, which establishes an explicit systematic analogy. The commentary emphasizes that 'mastering some words confers a capacity for the rest, as mastering early numbers confers the number-series,' showing they share a unified structure of acquisition. Treating them as isolated denies this systematic unity. -/
def independent_competences : Reading :=
  { claims := [ Claim.predication "systematically_isolated" upaya ] }
theorem independent_competences_inadequate : ¬ contract.Adequate independent_competences := by decide
#guard contract.licenses independent_competences = false

end Counterexamples

end VakyaVallari.Verses.V1_87
