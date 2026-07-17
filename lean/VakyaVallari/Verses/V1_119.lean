/- Verse 1.119 — generated from data/contracts/1.119.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_119

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def svara : Entity := ⟨"svara", Sorta.manifestation⟩
def sadja : Entity := ⟨"sadja", Sorta.manifestation⟩
def bheda : Entity := ⟨"bheda", Sorta.property⟩
def artha : Entity := ⟨"artha", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "vyakhyate" (Node.ent sabda) (Node.ent bheda)
    , Claim.relation "rupyate" (Node.ent sabda) (Node.ent bheda)
    , Claim.relation "asraya" (Node.ent sabda) (Node.ent artha) ]
  , denials := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "vyakhyate" (Node.ent sabda) (Node.ent bheda)
    , Claim.relation "rupyate" (Node.ent sabda) (Node.ent bheda)
    , Claim.relation "asraya" (Node.ent sabda) (Node.ent artha) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The musical notes have an intrinsic, pre-given distinction that word merely names and describes.'
   Why rejected: Makes the distinction (bheda) prior to word, contradicting the verse's core claim that word GIVES FORM to the distinction. The commentary explicitly shows: 'the named scale is what carves it into sadja-versus-rsabha'—the carving requires word; there is no pre-existing division to discover. -/
def intrinsic_distinction : Reading :=
  { claims := [ Claim.predication "svatantra" bheda ] }
theorem intrinsic_distinction_inadequate : ¬ contract.Adequate intrinsic_distinction := by decide
#guard contract.licenses intrinsic_distinction = false

/- 'Only the meanings and conceptual categories of objects depend on word; the audible phenomena themselves exist independently.'
   Why rejected: Restricts word-dependence to the cognitive layer, contradicting the verse's a fortiori argument. The commentary states: 'The untrained ear hears continuous pitch; the named scale is what carves it into sadja-versus-rsabha.' If even immediate auditory distinction (the hardest case) requires word for its individuation, then all objects certainly depend on word for their differentiation. -/
def semantic_layer_only : Reading :=
  { claims := [ Claim.predication "niralambin" svara ] }
theorem semantic_layer_only_inadequate : ¬ contract.Adequate semantic_layer_only := by decide
#guard contract.licenses semantic_layer_only = false

end Counterexamples

end VakyaVallari.Verses.V1_119
