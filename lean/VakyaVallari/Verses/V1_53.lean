/- Verse 1.53 — generated from data/contracts/1.53.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_53

open VakyaVallari

def buddhi : Entity := ⟨"buddhi", Sorta.cognition⟩
def vyavasaya : Entity := ⟨"vyavasāya", Sorta.cognition⟩
def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def sphota : Entity := ⟨"sphota", Sorta.linguisticItem⟩
def artha : Entity := ⟨"artha", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "pravritti" (Node.ent buddhi) (Node.ent sabda)
    , Claim.relation "janma" (Node.ent vyavasaya) (Node.ent sabda)
    , Claim.identity sabda sphota
    , Claim.predication "ekatva" sphota ]
  , denials := [ Claim.relation "arthajanma" (Node.ent vyavasaya) (Node.ent artha) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "pravritti" (Node.ent buddhi) (Node.ent sabda)
    , Claim.relation "janma" (Node.ent vyavasaya) (Node.ent sabda)
    , Claim.identity sabda sphota ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- "The speaker's cognition operates on individual phonemes sequentially, and the hearer computes meaning by reassembling them."
   Why rejected: Treats sabda as a mere sequence of phonetic elements rather than a unified sphota. The commentary insists cognition lands on the word itself, the same undivided unit for both speaker and hearer, not on private phoneme tokens. This demotes sphota from a linguisticItem to a mere aggregation, violating the sort and the identity axiom. -/
def phoneme_seq : Entity := ⟨"phoneme sequence", Sorta.property⟩
def phoneme_sequence_view : Reading :=
  { claims := [ Claim.relation "pravritti" (Node.ent buddhi) (Node.ent phoneme_seq) ] }
theorem phoneme_sequence_view_inadequate : ¬ contract.Adequate phoneme_sequence_view := by decide
#guard contract.licenses phoneme_sequence_view = false

/- "The speaker's buddhi engages the sabda directly, but the hearer's vyavasaya is triggered by the last phoneme and reconstructs the meaning inferentially."
   Why rejected: Breaks the symmetry the verse and commentary emphasize: both speaker and hearer converge on the same word. This reading treats them asymmetrically—one direct, one constructed—and implicitly denies their convergence on a single sphota. The commentary's 'upon those very words' mandates numerically identical engagement, which this reading violates. -/
def asymmetric_cognition : Reading :=
  { claims := [ Claim.relation "janma" (Node.ent vyavasaya) (Node.ent artha) ] }
theorem asymmetric_cognition_inadequate : ¬ contract.Adequate asymmetric_cognition := by decide
#guard contract.licenses asymmetric_cognition = false

/- 'Comprehension is a matter of receiving phonemes and computing a meaning from them.'
   Why rejected: The commentary explicitly rejects this: 'comprehension is not a matter of receiving phonemes and computing a meaning from them; the hearer's cognition lands on the word'. This reading treats meaning as computed from phonemes, but the axioms only license vyavasaya's engagement with sabda/sphota, not directly with artha. -/
def meaning_computation : Reading :=
  { claims := [ Claim.relation "arthajanma" (Node.ent vyavasaya) (Node.ent artha) ] }
theorem meaning_computation_inadequate : ¬ contract.Adequate meaning_computation := by decide
#guard contract.contradicts meaning_computation = true

end Counterexamples

end VakyaVallari.Verses.V1_53
