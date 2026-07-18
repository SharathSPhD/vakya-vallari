/- Verse 1.125 — generated from data/contracts/1.125.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_125

open VakyaVallari

def vak : Entity := ⟨"vāk", Sorta.absolute⟩
def vidya : Entity := ⟨"vidyā", Sorta.manifestation⟩
def silpa : Entity := ⟨"śilpa", Sorta.manifestation⟩
def kala : Entity := ⟨"kalā", Sorta.manifestation⟩
def vastu : Entity := ⟨"vastu", Sorta.manifestation⟩
def vibhajanam : Entity := ⟨"vibhajanam", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.relation "upabandhati" (Node.ent vak) (Node.ent vidya)
    , Claim.relation "upabandhati" (Node.ent vak) (Node.ent silpa)
    , Claim.relation "upabandhati" (Node.ent vak) (Node.ent kala)
    , Claim.predication "vibhajyate" vastu
    , Claim.relation "asraya" (Node.ent vibhajanam) (Node.ent vak) ]
  , denials := []
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "upabandhati" (Node.ent vak) (Node.ent vidya)
    , Claim.relation "upabandhati" (Node.ent vak) (Node.ent silpa)
    , Claim.relation "upabandhati" (Node.ent vak) (Node.ent kala)
    , Claim.predication "vibhajyate" vastu
    , Claim.relation "asraya" (Node.ent vibhajanam) (Node.ent vak) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Sciences, crafts and arts have their own structure independent of word; the word merely labels or describes them.'
   Why rejected: Demotes vāk from the absolute binding principle to a passive property or linguistic labeling device, contradicting the commentary's insistence that word-power actively binds (upabandhati) all domains of human competence. The sort error (absolute vs property) makes the binding relation impossible. -/
def vak_property : Entity := ⟨"vāk", Sorta.property⟩
def passive_word_labels : Reading :=
  { claims := [ Claim.relation "abhidhayate" (Node.ent vak_property) (Node.ent vidya) ] }
theorem passive_word_labels_inadequate : ¬ contract.Adequate passive_word_labels := by decide
#guard contract.licenses passive_word_labels = false
theorem passive_word_labels_sort_error : vak_property ≠ vak := by decide

/- 'Artifacts differentiate themselves into parts through their own nature; word plays no role.'
   Why rejected: Severs the word's causal role in differentiation (vibhajanam). The commentary explicitly states that articulation of the craft-object is word-borne, and the artifact's very identity as this kind of thing depends on the word-guided maker's projection of rationale onto matter. The claimed relation (vibhajanam depends on vastu's own nature) is not derivable from axioms establishing that vibhajanam is instead word-borne. -/
def self_differentiated_artifacts : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent vibhajanam) (Node.ent vastu) ] }
theorem self_differentiated_artifacts_inadequate : ¬ contract.Adequate self_differentiated_artifacts := by decide
#guard contract.licenses self_differentiated_artifacts = false

/- 'Things are first brought to completion, then the word simply reflects or records their articulation.'
   Why rejected: Reverses the temporal and causal order. The commentary makes clear that differentiation (vibhajanam) happens under word's control (tad-vasat), not after. The word-guided maker projects the rationale onto matter; differentiation is not a secondary labeling. -/
def word_secondary_effect : Reading :=
  { claims := [ Claim.relation "anuvartin" (Node.ent vibhajanam) (Node.ent vak) ] }
theorem word_secondary_effect_inadequate : ¬ contract.Adequate word_secondary_effect := by decide
#guard contract.licenses word_secondary_effect = false

end Counterexamples

end VakyaVallari.Verses.V1_125
