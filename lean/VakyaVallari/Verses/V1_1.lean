/- Verse 1.1 — generated from data/contracts/1.1.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_1

open VakyaVallari

def brahman : Entity := ⟨"brahman", Sorta.absolute⟩
def sabdatattva : Entity := ⟨"śabdatattva", Sorta.absolute⟩
def jagat : Entity := ⟨"jagat", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.identity sabdatattva brahman
    , Claim.relation "vivartate" (Node.ent brahman) (Node.ent jagat)
    , Claim.predication "anadinidhana" brahman
    , Claim.predication "aksara" brahman ]
  , denials := [ Claim.relation "parinamate" (Node.ent brahman) (Node.ent jagat) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.identity sabdatattva brahman
    , Claim.predication "anadinidhana" brahman
    , Claim.predication "aksara" brahman
    , Claim.relation "vivartate" (Node.ent brahman) (Node.ent jagat) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The imperishable linguistic structure underlying words has no beginning or end.'
   Why rejected: Renders śabdatattva as a mere linguistic property, demoting the ontological identity the commentary insists on: the ultimate IS language, not something described by it. The sort error (property vs absolute) makes the identity claim decidably false. -/
def sabdatattva_naive : Entity := ⟨"śabdatattva", Sorta.property⟩
def naive_linguistic_structure : Reading :=
  { claims := [ Claim.identity sabdatattva_naive brahman ] }
theorem naive_linguistic_structure_inadequate : ¬ contract.Adequate naive_linguistic_structure := by decide
#guard contract.licenses naive_linguistic_structure = false
theorem naive_linguistic_structure_sort_error : sabdatattva_naive ≠ sabdatattva := by decide

/- 'Brahman transforms itself into the world of objects.'
   Why rejected: Asserts a real transformation (parinama) of Brahman's substance, which the commentary explicitly rules out in favor of vivarta (appearance without loss of unity). -/
def parinama_transformation : Reading :=
  { claims := [ Claim.relation "parinamate" (Node.ent brahman) (Node.ent jagat) ] }
theorem parinama_transformation_inadequate : ¬ contract.Adequate parinama_transformation := by decide
#guard contract.contradicts parinama_transformation = true

end Counterexamples

end VakyaVallari.Verses.V1_1
