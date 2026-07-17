/- Verse 1.124 — generated from data/contracts/1.124.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_124

open VakyaVallari

def vagrupa : Entity := ⟨"vāgrūpatā", Sorta.power⟩
def avabodha : Entity := ⟨"avabodha", Sorta.cognition⟩
def prakasha : Entity := ⟨"prakāśa", Sorta.cognition⟩
def pratyavamarsa : Entity := ⟨"pratyavamarśa", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.predication "sasvata" vagrupa
    , Claim.identity vagrupa pratyavamarsa
    , Claim.relation "asraya" (Node.ent vagrupa) (Node.ent prakasha)
    , Claim.relation "niyamaka" (Node.ent vagrupa) (Node.ent avabodha) ]
  , denials := [ Claim.relation "svatantra" (Node.ent prakasha) (Node.ent vagrupa) ] }

def accepted : Reading :=
  { claims := [ Claim.predication "sasvata" vagrupa
    , Claim.identity vagrupa pratyavamarsa
    , Claim.relation "asraya" (Node.ent vagrupa) (Node.ent prakasha) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The light of consciousness shines independently, even without word-formedness or articulation.'
   Why rejected: The verse explicitly denies this: prakasha cannot illuminate if vagrupa departs from avabodha. The commentary insists this is not empirical contingency but transcendental necessity — bare impingement without articulation is no cognition at all, hence no light. -/
def prakasha_svatantra : Reading :=
  { claims := [ Claim.relation "svatantra" (Node.ent prakasha) (Node.ent vagrupa) ] }
theorem prakasha_svatantra_inadequate : ¬ contract.Adequate prakasha_svatantra := by decide
#guard contract.contradicts prakasha_svatantra = true

/- 'Word-formedness is merely a contingent feature that happens to accompany awareness but could be absent.'
   Why rejected: The commentary makes this necessity explicit: 'to be aware is to be articulately aware, and articulation is the word's work' — vagrupa is not incidental but constitutive of avabodha itself. This reading treats the niyamaka relation as absent or optional, contradicting the axiom that vagrupa niyamaka avabodha. -/
def vagrupa_contingent_feature : Reading :=
  { claims := [ Claim.predication "apadartham" vagrupa ] }
theorem vagrupa_contingent_feature_inadequate : ¬ contract.Adequate vagrupa_contingent_feature := by decide
#guard contract.licenses vagrupa_contingent_feature = false

/- 'Recognition (pratyavamarsa) is merely a reflective mental act that can occur independently of the fundamental word-power.'
   Why rejected: Treats pratyavamarsa as a contingent operation of mind rather than identifying it with the essential word-formedness power itself. The identity vagrupa = pratyavamarsa forbids treating them as separable; this reading implicitly denies that identity by demoting pratyavamarsa to a secondary reflective operation. -/
def pratyavamarsa_act : Entity := ⟨"pratyavamarśa-kriyā", Sorta.manifestation⟩
def pratyavamarsa_mere_reflective_act : Reading :=
  { claims := [ Claim.identity pratyavamarsa_act vagrupa ] }
theorem pratyavamarsa_mere_reflective_act_inadequate : ¬ contract.Adequate pratyavamarsa_mere_reflective_act := by decide
#guard contract.licenses pratyavamarsa_mere_reflective_act = false

end Counterexamples

end VakyaVallari.Verses.V1_124
