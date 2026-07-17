/- Verse 1.65 — generated from data/contracts/1.65.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_65

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def abhidheya : Entity := ⟨"abhidheya", Sorta.property⟩
def vacanarupa : Entity := ⟨"vacanarūpa", Sorta.manifestation⟩
def uccara : Entity := ⟨"ucāraṇa", Sorta.cognition⟩
def sabdatatva : Entity := ⟨"śabdatattva", Sorta.absolute⟩

def contract : Contract :=
  { axioms := [ Claim.predication "abhidheya" sabda
    , Claim.relation "vivichyate" (Node.ent uccara) (Node.ent vacanarupa)
    , Claim.relation "anya" (Node.ent vacanarupa) (Node.ent sabda)
    , Claim.predication "dvaita" sabdatatva ]
  , denials := [ Claim.identity sabda vacanarupa ] }

def accepted : Reading :=
  { claims := [ Claim.predication "abhidheya" sabda
    , Claim.relation "vivichyate" (Node.ent uccara) (Node.ent vacanarupa)
    , Claim.relation "anya" (Node.ent vacanarupa) (Node.ent sabda) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'When we mention a word, the distinction between sound and word disappears; in citation, sound and word are simply identical.'
   Why rejected: The verse explicitly discerns a form distinct from the word in utterance. Treating sound and word as identical violates the core relation (anya) that the verse establishes. The commentary rejects this naive picture. -/
def citation_collapse : Reading :=
  { claims := [ Claim.identity sabda vacanarupa ] }
theorem citation_collapse_inadequate : ¬ contract.Adequate citation_collapse := by decide
#guard contract.contradicts citation_collapse = true

/- 'The utterance-form is merely an accidental property of the word, not fundamentally distinct from it.'
   Why rejected: The verse's vivichyate (discerned apart) and anya (distinct) establish a necessary relation between word and utterance-form. Treating the form as an accidental property rather than a distinct manifestation demotes the duality below the essential level that the commentary emphasizes: 'the duality belongs to the word's essence'. -/
def vacanarupa_prop : Entity := ⟨"vacanarūpa", Sorta.property⟩
def form_as_accident : Reading :=
  { claims := [ Claim.predication "accidental_modification" vacanarupa_prop ] }
theorem form_as_accident_inadequate : ¬ contract.Adequate form_as_accident := by decide
#guard contract.licenses form_as_accident = false
theorem form_as_accident_sort_error : vacanarupa_prop ≠ vacanarupa := by decide

end Counterexamples

end VakyaVallari.Verses.V1_65
