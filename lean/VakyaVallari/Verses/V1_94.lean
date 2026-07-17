/- Verse 1.94 — generated from data/contracts/1.94.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_94

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.absolute⟩
def dhvani : Entity := ⟨"dhvani", Sorta.manifestation⟩
def nimitta : Entity := ⟨"nimitta", Sorta.power⟩
def upalabdhi : Entity := ⟨"upalabdhi", Sorta.cognition⟩
def prakasa : Entity := ⟨"prakāśa", Sorta.absolute⟩

def contract : Contract :=
  { axioms := [ Claim.predication "avikara" sabda
    , Claim.relation "vikrta" (Node.ent nimitta) (Node.ent dhvani)
    , Claim.relation "nimitta" (Node.ent dhvani) (Node.ent upalabdhi)
    , Claim.relation "vivartate" (Node.ent sabda) (Node.ent dhvani) ]
  , denials := [ Claim.relation "parinamate" (Node.ent dhvani) (Node.ent sabda)
    , Claim.predication "vikara" sabda ] }

def accepted : Reading :=
  { claims := [ Claim.predication "avikara" sabda
    , Claim.relation "vikrta" (Node.ent nimitta) (Node.ent dhvani)
    , Claim.relation "nimitta" (Node.ent dhvani) (Node.ent upalabdhi)
    , Claim.relation "vivartate" (Node.ent sabda) (Node.ent dhvani) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- "The sound's modifications are transferred to the unchanging word, making it also modified."
   Why rejected: The commentary explicitly states that modifications condition apprehension without transferring change: 'do not put flicker into the pot.' This reading commits a kind error by asserting parinamate (real transformation) instead of vivarta (manifestation without transfer). -/
def transfer_of_change : Reading :=
  { claims := [ Claim.relation "parinamate" (Node.ent dhvani) (Node.ent sabda) ] }
theorem transfer_of_change_inadequate : ¬ contract.Adequate transfer_of_change := by decide
#guard contract.contradicts transfer_of_change = true

/- 'Both the sound and the word are modified, since the sound is the manifestation of the word.'
   Why rejected: Conflates the sound's causal modifications (by speaker's organs, effort, pace) with the word's nature. The commentary's lamp analogy makes clear that the intermediary's changes do not affect what is mediated: the lamp's flicker does not put flicker in the pot. -/
def sabda_modified : Entity := ⟨"śabda", Sorta.manifestation⟩
def shared_modification : Reading :=
  { claims := [ Claim.predication "vikara" sabda_modified ] }
theorem shared_modification_inadequate : ¬ contract.Adequate shared_modification := by decide
#guard contract.licenses shared_modification = false
theorem shared_modification_sort_error : sabda_modified ≠ sabda := by decide

end Counterexamples

end VakyaVallari.Verses.V1_94
