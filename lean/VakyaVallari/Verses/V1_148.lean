/- Verse 1.148 — generated from data/contracts/1.148.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_148

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def sadhutvam : Entity := ⟨"sādhutva", Sorta.property⟩
def nimitta : Entity := ⟨"nimitta", Sorta.power⟩
def rupa : Entity := ⟨"rūpa", Sorta.linguisticItem⟩
def visaya : Entity := ⟨"viṣaya", Sorta.manifestation⟩
def artha : Entity := ⟨"artha", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "vyavasthitam" (Node.ent nimitta) (Node.ent sadhutvam)
    , Claim.relation "visayabheda" (Node.ent visaya) (Node.ent sadhutvam)
    , Claim.predication "relational" sadhutvam ]
  , denials := [ Claim.predication "vyavasthitam" rupa
    , Claim.predication "independent" sabda ] }

def accepted : Reading :=
  { claims := [ Claim.relation "vyavasthitam" (Node.ent nimitta) (Node.ent sadhutvam)
    , Claim.relation "visayabheda" (Node.ent visaya) (Node.ent sadhutvam) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'A word-form is correct or incorrect based entirely on its phonetic shape.'
   Why rejected: Ignores the relational nature of sadhutvam and its dependence on nimitta-bheda. Violates the axiom that correctness is determined by ground-difference, not by rupa alone. The commentary explicitly denies this: 'No form is corrupt as acoustics.' -/
def intrinsic_form_correctness : Reading :=
  { claims := [ Claim.predication "vyavasthitam" rupa ] }
theorem intrinsic_form_correctness_inadequate : ¬ contract.Adequate intrinsic_form_correctness := by decide
#guard contract.contradicts intrinsic_form_correctness = true

/- 'The correctness of asva or goni is fixed uniformly; their status does not change across different meaning-domains.'
   Why rejected: Denies the visaya-dependence established by 'in another domain' and confirmed by the commentary's example: the same form goni is sadhu as 'sack' but asadhu as 'cow'. This violates the axiom visayabheda -> sadhutvam. -/
def context_independent : Reading :=
  { claims := [ Claim.predication "universal" sadhutvam ] }
theorem context_independent_inadequate : ¬ contract.Adequate context_independent := by decide
#guard contract.licenses context_independent = false

end Counterexamples

end VakyaVallari.Verses.V1_148
