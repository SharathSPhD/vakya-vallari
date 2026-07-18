/- Verse 1.34 — generated from data/contracts/1.34.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_34

open VakyaVallari

def artha : Entity := ⟨"artha", Sorta.linguisticItem⟩
def anumana : Entity := ⟨"anumāna", Sorta.power⟩
def anumiti : Entity := ⟨"anumiti", Sorta.cognition⟩
def satya : Entity := ⟨"satya", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "aniyata" anumana
    , Claim.relation "apavada" (Node.ent anumana) (Node.ent anumiti)
    , Claim.predication "no_terminal_expertise" anumana ]
  , denials := [ Claim.relation "pramana" (Node.ent anumana) (Node.ent satya) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "aniyata" anumana
    , Claim.relation "apavada" (Node.ent anumana) (Node.ent anumiti)
    , Claim.predication "no_terminal_expertise" anumana ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Greater expertise in reasoning produces reliable, stable conclusions about matters.'
   Why rejected: Claims that increased expertise guarantees reliability, contradicting the denial that anumana is a pramana of satya. The verse shows that greater expertise produces contrary conclusions, not convergence. -/
def expertise_guarantees_truth : Reading :=
  { claims := [ Claim.relation "pramana" (Node.ent anumana) (Node.ent satya) ] }
theorem expertise_guarantees_truth_inadequate : ¬ contract.Adequate expertise_guarantees_truth := by decide
#guard contract.contradicts expertise_guarantees_truth = true

/- 'Because inference is unreliable and subject to reversal, it has no epistemic validity whatsoever and should be abandoned entirely.'
   Why rejected: Over-interprets fallibilism into complete invalidity. The verse shows anumana is aniyata (undetermined by expertise), not that it is invalid or avidya. The point is regress without terminal guarantee, not total rejection of inference. -/
def avidya : Entity := ⟨"avidya", Sorta.power⟩
def inference_completely_invalid : Reading :=
  { claims := [ Claim.identity anumana avidya ] }
theorem inference_completely_invalid_inadequate : ¬ contract.Adequate inference_completely_invalid := by decide
#guard contract.licenses inference_completely_invalid = false

end Counterexamples

end VakyaVallari.Verses.V1_34
