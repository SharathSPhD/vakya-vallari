/- Verse 1.2 — generated from data/contracts/1.2.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_2

open VakyaVallari

def brahman : Entity := ⟨"brahman", Sorta.absolute⟩
def sakti : Entity := ⟨"śakti", Sorta.power⟩
def jagat : Entity := ⟨"jagat", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.predication "ekam" brahman
    , Claim.relation "asraya" (Node.ent brahman) (Node.ent sakti)
    , Claim.predication "apṛthaktva" brahman
    , Claim.relation "vivartate" (Node.ent sakti) (Node.ent jagat) ]
  , denials := [ Claim.relation "parinamate" (Node.ent brahman) (Node.ent jagat)
    , Claim.predication "prthaktva" brahman ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "ekam" brahman
    , Claim.relation "asraya" (Node.ent brahman) (Node.ent sakti)
    , Claim.predication "apṛthaktva" brahman
    , Claim.relation "vivartate" (Node.ent sakti) (Node.ent jagat) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Brahman genuinely transforms itself into the world through its differentiated powers.'
   Why rejected: Asserts parinama (real transformation of substance), which the verse rejects through the 'iva' (as if). The commentary emphasizes that removing the 'as if' leaves only real plurality, which the unity thesis cannot accommodate. -/
def real_transformation : Reading :=
  { claims := [ Claim.relation "parinamate" (Node.ent brahman) (Node.ent jagat) ] }
theorem real_transformation_inadequate : ¬ contract.Adequate real_transformation := by decide
#guard contract.contradicts real_transformation = true

/- "Brahman's powers are genuinely separate from Brahman itself, making the world fundamentally independent of its source."
   Why rejected: Denies apṛthaktva (non-separateness), which the verse establishes as the metaphysical foundation. The commentary is explicit: 'the powers are not other than it.' -/
def absolute_separation : Reading :=
  { claims := [ Claim.predication "prthaktva" brahman ] }
theorem absolute_separation_inadequate : ¬ contract.Adequate absolute_separation := by decide
#guard contract.contradicts absolute_separation = true

end Counterexamples

end VakyaVallari.Verses.V1_2
