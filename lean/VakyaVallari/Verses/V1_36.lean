/- Verse 1.36 — generated from data/contracts/1.36.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_36

open VakyaVallari

def siddhi : Entity := ⟨"siddhi", Sorta.manifestation⟩
def karma : Entity := ⟨"karma", Sorta.power⟩
def pratyaksa : Entity := ⟨"pratyakṣa", Sorta.power⟩
def anumana : Entity := ⟨"anumāna", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.predication "karmaja" siddhi
    , Claim.relation "vyatikramya" (Node.ent siddhi) (Node.ent pratyaksa)
    , Claim.relation "vyatikramya" (Node.ent siddhi) (Node.ent anumana) ]
  , denials := [ Claim.relation "grahana" (Node.ent pratyaksa) (Node.ent siddhi)
    , Claim.relation "grahana" (Node.ent anumana) (Node.ent siddhi) ] }

def accepted : Reading :=
  { claims := [ Claim.predication "karmaja" siddhi
    , Claim.relation "vyatikramya" (Node.ent siddhi) (Node.ent pratyaksa)
    , Claim.relation "vyatikramya" (Node.ent siddhi) (Node.ent anumana) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The attainments of ancestors, raksasas and pisacas can be directly perceived.'
   Why rejected: Violates the explicit claim that siddhis stand beyond (vyatikramya) perception. The verse grounds its dialectical argument precisely on the insufficiency of perception (and inference) to grasp these attainments; to assert they can be perceived denies the verse's central logical move. -/
def perception_sufficient : Reading :=
  { claims := [ Claim.relation "grahana" (Node.ent pratyaksa) (Node.ent siddhi) ] }
theorem perception_sufficient_inadequate : ¬ contract.Adequate perception_sufficient := by decide
#guard contract.contradicts perception_sufficient = true

/- 'The attainments of these beings, while not perceptible, can be inferred from effects or scriptural testimony.'
   Why rejected: Violates the explicit claim that siddhis transcend (vyatikramya) inference. The verse pairs perception and inference as jointly insufficient (vyatikramya both), making an appeal to inference alone a misreading. The dialectical force requires that the opponent cannot save their position by invoking a second pramana. -/
def inference_sufficient : Reading :=
  { claims := [ Claim.relation "grahana" (Node.ent anumana) (Node.ent siddhi) ] }
theorem inference_sufficient_inadequate : ¬ contract.Adequate inference_sufficient := by decide
#guard contract.contradicts inference_sufficient = true

/- 'The attainments of these beings arise from divine grace, innate power, or self-causation rather than from karma.'
   Why rejected: Contradicts the explicit restriction 'karmaja eva siddhayah' (born of karma alone). The verse's use of eva (alone/only) excludes alternative efficient causes. Any other source violates the causal structure Bhartrhari establishes. -/
def grace : Entity := ⟨"grace", Sorta.power⟩
def non_karmic_causation : Reading :=
  { claims := [ Claim.relation "janaka" (Node.ent grace) (Node.ent siddhi) ] }
theorem non_karmic_causation_inadequate : ¬ contract.Adequate non_karmic_causation := by decide
#guard contract.licenses non_karmic_causation = false

end Counterexamples

end VakyaVallari.Verses.V1_36
