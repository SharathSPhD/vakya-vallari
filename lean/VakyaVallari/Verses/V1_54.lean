/- Verse 1.54 — generated from data/contracts/1.54.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_54

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def artha : Entity := ⟨"artha", Sorta.manifestation⟩
def lokah : Entity := ⟨"lokaḥ", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.relation "upasarjani" (Node.ent sabda) (Node.ent artha)
    , Claim.predication "caritartha" sabda
    , Claim.predication "pararthatva" sabda ]
  , denials := [ Claim.relation "upasarjani" (Node.ent artha) (Node.ent sabda)
    , Claim.relation "pratipadyate" (Node.ent lokah) (Node.ent sabda) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "upasarjani" (Node.ent sabda) (Node.ent artha)
    , Claim.predication "caritartha" sabda
    , Claim.predication "pararthatva" sabda ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- "In certain things-to-be-expressed, meanings become subordinate to the words, which remain focal to the listener's attention."
   Why rejected: Inverts the upasarjani relation; treats meanings rather than words as subordinate. This directly contradicts the verse's explicit statement that words become artha-upasarjani-bhuta (subordinate to meaning). -/
def reversed_subordination : Reading :=
  { claims := [ Claim.relation "upasarjani" (Node.ent artha) (Node.ent sabda) ] }
theorem reversed_subordination_inadequate : ¬ contract.Adequate reversed_subordination := by decide
#guard contract.contradicts reversed_subordination = true

/- 'The world clearly notices and attends to the words themselves, recognizing linguistic forms as focal to communication.'
   Why rejected: Asserts that the world attends to (pratipadyate) words, directly contradicting the verse's core claim that the world does not cognize the words when they are subordinate to meaning. -/
def world_attends_words : Reading :=
  { claims := [ Claim.relation "pratipadyate" (Node.ent lokah) (Node.ent sabda) ] }
theorem world_attends_words_inadequate : ¬ contract.Adequate world_attends_words := by decide
#guard contract.contradicts world_attends_words = true

end Counterexamples

end VakyaVallari.Verses.V1_54
