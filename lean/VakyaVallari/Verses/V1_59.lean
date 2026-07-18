/- Verse 1.59 — generated from data/contracts/1.59.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_59

open VakyaVallari

def vrddhi : Entity := ⟨"vṛddhi", Sorta.linguisticItem⟩
def svarupa : Entity := ⟨"svarūpa", Sorta.property⟩
def adaic : Entity := ⟨"ādaic", Sorta.linguisticItem⟩
def vowels : Entity := ⟨"the vowels (a, ai, au)", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.relation "upanibandhana" (Node.ent vrddhi) (Node.ent svarupa)
    , Claim.relation "samjna" (Node.ent vrddhi) (Node.ent vowels)
    , Claim.relation "pratyayita" (Node.ent adaic) (Node.ent vowels) ]
  , denials := [ Claim.relation "samjna" (Node.ent vowels) (Node.ent vrddhi) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "upanibandhana" (Node.ent vrddhi) (Node.ent svarupa)
    , Claim.relation "samjna" (Node.ent vrddhi) (Node.ent vowels) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- "The term 'vrddhi' in Pāṇini's grammar denotes the process of vowel-lengthening itself, not the vowels a, ai, au."
   Why rejected: This misidentifies what vrddhi refers to. The commentary makes clear that vrddhi is the saṃjñā (name) for the vowels themselves: 'the vowels a, ai, au — given in the rule by the pratyahara adaic'. Vrddhi relates as a name to the named vowels, not to the process of lengthening. -/
def lengthening_process : Entity := ⟨"vowel lengthening", Sorta.power⟩
def process_referent : Reading :=
  { claims := [ Claim.relation "samjna" (Node.ent vrddhi) (Node.ent lengthening_process) ] }
theorem process_referent_inadequate : ¬ contract.Adequate process_referent := by decide
#guard contract.licenses process_referent = false

/- 'The vowels a, ai, and au are the names that denote the technical term vrddhi.'
   Why rejected: This reverses the saṃjñā (naming) relation. The commentary explicitly states 'it relates as samjna, name, to the samjnins, the named items' — vrddhi is the name (saṃjñā) and the vowels are what is named (saṃjñins). This reversed direction contradicts the verse's claim. -/
def reversed_naming : Reading :=
  { claims := [ Claim.relation "samjna" (Node.ent vowels) (Node.ent vrddhi) ] }
theorem reversed_naming_inadequate : ¬ contract.Adequate reversed_naming := by decide
#guard contract.contradicts reversed_naming = true

/- "The term 'vrddhi' is simply another name for the pratyāhāra 'ādaic', both referring identically to the designation of vowels."
   Why rejected: This conflates two distinct linguistic roles. Vrddhi is the technical NAME (saṃjñā) that designates the vowels, while ādaic is the ABBREVIATION (pratyāhāra) mechanism that conveys them. The commentary distinguishes them: 'it relates as samjna, name, to the samjnins, the named items that adaic conveys.' They are related but not identical. -/
def merged_terms : Reading :=
  { claims := [ Claim.identity vrddhi adaic ] }
theorem merged_terms_inadequate : ¬ contract.Adequate merged_terms := by decide
#guard contract.licenses merged_terms = false

end Counterexamples

end VakyaVallari.Verses.V1_59
