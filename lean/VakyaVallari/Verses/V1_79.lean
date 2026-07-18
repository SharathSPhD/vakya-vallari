/- Verse 1.79 — generated from data/contracts/1.79.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_79

open VakyaVallari

def indriya : Entity := ⟨"indriya", Sorta.power⟩
def visaya : Entity := ⟨"viṣaya", Sorta.manifestation⟩
def gandha : Entity := ⟨"gandha", Sorta.property⟩
def samadhana : Entity := ⟨"samādhāna", Sorta.power⟩
def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.relation "samskārayate" (Node.ent samadhana) (Node.ent indriya)
    , Claim.relation "samskārayate" (Node.ent visaya) (Node.ent gandha)
    , Claim.relation "samskārayate" (Node.ent samadhana) (Node.ent sabda)
    , Claim.relation "samskārayate" (Node.ent visaya) (Node.ent sabda) ]
  , denials := [ Claim.relation "samskārayate" (Node.ent samadhana) (Node.ent visaya)
    , Claim.relation "samskārayate" (Node.ent visaya) (Node.ent indriya) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "samskārayate" (Node.ent samadhana) (Node.ent indriya)
    , Claim.relation "samskārayate" (Node.ent visaya) (Node.ent gandha) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Both sense-organ and object must always be prepared together to enable perception.'
   Why rejected: The verse distinguishes two independent pathways: organ-preparation (concentration improves the eye) operates 'while leaving the object untouched,' and object-preparation (crushing readies scent) operates 'while doing nothing to the nose.' Requiring both falsifies this independence. -/
def unified_samskara : Reading :=
  { claims := [ Claim.relation "samskārayate" (Node.ent samadhana) (Node.ent visaya) ] }
theorem unified_samskara_inadequate : ¬ contract.Adequate unified_samskara := by decide
#guard contract.contradicts unified_samskara = true

/- "The hidden property (scent) itself causes the object to be prepared, rather than the object's preparation revealing the property."
   Why rejected: Reverses the direction of causation. The commentary shows that processing prepares/readies the object's gandha for apprehension; the gandha does not do the preparing. A sort error since gandha is a property (not a power) and cannot be a samskara-source. -/
def gandha_agent : Entity := ⟨"gandha", Sorta.power⟩
def reverse_causation : Reading :=
  { claims := [ Claim.relation "samskārayate" (Node.ent gandha_agent) (Node.ent visaya) ] }
theorem reverse_causation_inadequate : ¬ contract.Adequate reverse_causation := by decide
#guard contract.licenses reverse_causation = false
theorem reverse_causation_sort_error : gandha_agent ≠ gandha := by decide

end Counterexamples

end VakyaVallari.Verses.V1_79
