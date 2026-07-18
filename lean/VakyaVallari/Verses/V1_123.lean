/- Verse 1.123 — generated from data/contracts/1.123.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_123

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def pratyaya : Entity := ⟨"pratyaya", Sorta.cognition⟩
def jnana : Entity := ⟨"jñāna", Sorta.cognition⟩
def anuviddha : Entity := ⟨"anuviddha", Sorta.property⟩
def nirvikalpaka_pratyaksa : Entity := ⟨"nirvikalpaka pratyaksa", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.relation "anugamadapeksam" (Node.ent pratyaya) (Node.ent sabda)
    , Claim.predication "anuviddha" jnana
    , Claim.relation "vivartate" (Node.ent sabda) (Node.ent jnana)
    , Claim.predication "arthakriyakari" sabda ]
  , denials := [ Claim.relation "anugamadapeksam" (Node.ent nirvikalpaka_pratyaksa) (Node.ent sabda)
    , Claim.relation "utpatti_anantaram_labha" (Node.ent jnana) (Node.ent sabda) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "anugamadapeksam" (Node.ent pratyaya) (Node.ent sabda)
    , Claim.predication "anuviddha" jnana ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Perception can occur in a wordless state, with conceptualization and verbal articulation added afterwards.'
   Why rejected: The commentary explicitly rejects the Buddhist doctrine of nirvikalpaka pratyaksa (wordless perception), stating that attending to actual cognition reveals it is already articulate. This reading allows a mode of cognition without word dependency. -/
def nirvikalpaka_pratyaksa : Entity := ⟨"nirvikalpaka pratyaksa", Sorta.cognition⟩
def wordless_perception : Reading :=
  { claims := [ Claim.relation "anugamadapeksam" (Node.ent nirvikalpaka_pratyaksa) (Node.ent sabda) ] }
theorem wordless_perception_inadequate : ¬ contract.Adequate wordless_perception := by decide
#guard contract.contradicts wordless_perception = true

/- 'Knowledge is first independently accomplished, and then subsequently labeled with words.'
   Why rejected: Commits the dualism the verse and commentary reject: cognition first, word second. The commentary states 'the wording is *in* the seeing, as the thread is in the fabric'; remove the thread and fabric remains is false. Word is constitutive, not post-hoc attribution. -/
def post_hoc_labeling : Reading :=
  { claims := [ Claim.relation "utpatti_anantaram_labha" (Node.ent jnana) (Node.ent sabda) ] }
theorem post_hoc_labeling_inadequate : ¬ contract.Adequate post_hoc_labeling := by decide
#guard contract.contradicts post_hoc_labeling = true

/- 'Word is merely a tool for describing cognitions that can occur and be known independently of it.'
   Why rejected: Demotes word to a property (descriptive instrument) rather than recognizing it as constitutive to the structure of all knowing. The sort error (property vs. linguisticItem with constitutive role) treats the relation as contingent rather than necessary. -/
def sabda_tool : Entity := ⟨"śabda", Sorta.property⟩
def linguistic_description_only : Reading :=
  { claims := [ Claim.predication "vacanika" sabda_tool ] }
theorem linguistic_description_only_inadequate : ¬ contract.Adequate linguistic_description_only := by decide
#guard contract.licenses linguistic_description_only = false
theorem linguistic_description_only_sort_error : sabda_tool ≠ sabda := by decide

end Counterexamples

end VakyaVallari.Verses.V1_123
