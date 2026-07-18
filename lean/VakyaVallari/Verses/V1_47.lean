/- Verse 1.47 — generated from data/contracts/1.47.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_47

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def buddhi : Entity := ⟨"buddhi", Sorta.cognition⟩
def artha : Entity := ⟨"artha", Sorta.property⟩
def dhvani : Entity := ⟨"dhvani", Sorta.linguisticItem⟩
def karanas : Entity := ⟨"karaṇa", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent artha) (Node.ent sabda)
    , Claim.relation "vitarkita" (Node.ent buddhi) (Node.ent sabda)
    , Claim.relation "anugrhyate" (Node.ent dhvani) (Node.ent sabda)
    , Claim.relation "vivartate" (Node.ent karanas) (Node.ent dhvani) ]
  , denials := [ Claim.relation "is_substance" (Node.ent dhvani) (Node.ent sabda) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "vitarkita" (Node.ent buddhi) (Node.ent sabda)
    , Claim.relation "asraya" (Node.ent artha) (Node.ent sabda)
    , Claim.relation "anugrhyate" (Node.ent dhvani) (Node.ent sabda)
    , Claim.relation "vivartate" (Node.ent karanas) (Node.ent dhvani) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Sound is the fundamental nature of the word, produced by the organs of speech and then given meaning by the intellect.'
   Why rejected: Inverts the ontological order and contradicts the commentary's key point that sound is auxiliary, not the substance of the word. The word is first established as meaningful before sound appears. -/
def sonic_primacy : Reading :=
  { claims := [ Claim.relation "is_substance" (Node.ent dhvani) (Node.ent sabda) ] }
theorem sonic_primacy_inadequate : ¬ contract.Adequate sonic_primacy := by decide
#guard contract.contradicts sonic_primacy = true

/- 'The intellect and the organs of speech work together to produce the word and its sound at the same time.'
   Why rejected: Collapses the temporal order that the verse carefully stages: first the meaningful conception in the mind, then the sonic unfold from the organs. The commentary emphasizes this sequencing as crucial to understanding the word's nature. -/
def simultaneity : Reading :=
  { claims := [ Claim.relation "co_produce" (Node.ent karanas) (Node.ent sabda) ] }
theorem simultaneity_inadequate : ¬ contract.Adequate simultaneity := by decide
#guard contract.licenses simultaneity = false

end Counterexamples

end VakyaVallari.Verses.V1_47
