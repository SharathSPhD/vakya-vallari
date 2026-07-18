/- Verse 1.78 — generated from data/contracts/1.78.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_78

open VakyaVallari

def dhvani : Entity := ⟨"dhvani", Sorta.linguisticItem⟩
def indriya : Entity := ⟨"indriya", Sorta.power⟩
def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def samskara : Entity := ⟨"saṃskāra", Sorta.power⟩
def abhivyakti : Entity := ⟨"abhivyakti", Sorta.power⟩
def sphota : Entity := ⟨"sphota", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.relation "kriyate" (Node.ent dhvani) (Node.ent indriya)
    , Claim.relation "kriyate" (Node.ent dhvani) (Node.ent sabda)
    , Claim.relation "kriyate" (Node.ent dhvani) (Node.ent samskara)
    , Claim.predication "asraya" abhivyakti
    , Claim.predication "samuccaya" sphota ]
  , denials := [ Claim.predication "utpatti" sabda ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "kriyate" (Node.ent dhvani) (Node.ent indriya)
    , Claim.predication "asraya" abhivyakti ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The sounds produce the word itself through their phonetic vibrations.'
   Why rejected: Asserts production (utpatti) of the word by sounds, which contradicts the manifestation doctrine's commitment that the word is eternally present and only revealed. The commentary explicitly rules out production (utpatti) in favor of manifestation (abhivyakti). -/
def production_theory : Reading :=
  { claims := [ Claim.predication "utpatti" sabda ] }
theorem production_theory_inadequate : ¬ contract.Adequate production_theory := by decide
#guard contract.contradicts production_theory = true

/- 'The word is manifested only through conditioning of the ear; the word itself does not require conditioning.'
   Why rejected: Treats the first mechanism as the sole operative mode, contradicting the verse's presentation of three logically equivalent alternatives. The axioms establish that dhvani conditions indriya, sabda, AND both together, not indriya alone. Restricting to ear-only conditioning is not entailed by the axioms. -/
def sabda_unconditioned : Entity := ⟨"śabda", Sorta.absolute⟩
def single_mechanism : Reading :=
  { claims := [ Claim.identity sabda_unconditioned sabda ] }
theorem single_mechanism_inadequate : ¬ contract.Adequate single_mechanism := by decide
#guard contract.licenses single_mechanism = false
theorem single_mechanism_sort_error : sabda_unconditioned ≠ sabda := by decide

/- "The sounds are the efficient causes that generate the word's meaning through phonetic vibrations."
   Why rejected: Reinterprets conditioning (preparation/asraya) as efficient causation. The verse presents dhvani as conditioning agent (preparing ear or word for manifestation), not as causal producer. This interpretation of dhvani's role is not supported by any axiom. -/
def efficient_causation : Reading :=
  { claims := [ Claim.relation "karana" (Node.ent dhvani) (Node.ent sabda) ] }
theorem efficient_causation_inadequate : ¬ contract.Adequate efficient_causation := by decide
#guard contract.licenses efficient_causation = false

end Counterexamples

end VakyaVallari.Verses.V1_78
