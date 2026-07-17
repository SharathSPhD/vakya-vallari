/- Verse 1.104 — generated from data/contracts/1.104.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_104

open VakyaVallari

def dhvani : Entity := ⟨"dhvani", Sorta.linguisticItem⟩
def sphota : Entity := ⟨"sphota", Sorta.linguisticItem⟩
def prabha : Entity := ⟨"prabha", Sorta.manifestation⟩
def dipa : Entity := ⟨"dīpa", Sorta.absolute⟩

def contract : Contract :=
  { axioms := [ Claim.relation "abhivyakti" (Node.ent dhvani) (Node.ent sphota)
    , Claim.predication "vyakta" dhvani
    , Claim.relation "vivartate" (Node.ent dipa) (Node.ent prabha) ]
  , denials := [ Claim.predication "avyakta" dhvani ] }

def accepted : Reading :=
  { claims := [ Claim.predication "vyakta" dhvani
    , Claim.relation "abhivyakti" (Node.ent dhvani) (Node.ent sphota)
    , Claim.relation "vivartate" (Node.ent dipa) (Node.ent prabha) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'From afar, the underlying sound cannot be discerned separately, and only the meaning survives the distance; in bells, only the lingering resonance reaches the ear, not the strike.'
   Why rejected: Asserts that dhvani is imperceptible (avyakta), contradicting the verse's central empirical claim that one hears the bare sound even when the word is not understood. This violates the denial that the position 'dhvani is never sensed' is false. -/
def dhvani_imperceptible : Reading :=
  { claims := [ Claim.predication "avyakta" dhvani ] }
theorem dhvani_imperceptible_inadequate : ¬ contract.Adequate dhvani_imperceptible := by decide
#guard contract.contradicts dhvani_imperceptible = true

/- 'From afar, the sound and meaning are utterly indistinguishable; in bells, the strike and resonance are one phenomenon.'
   Why rejected: Collapses dhvani and sphota into identity, erasing the distinction (bheda) the verse's observations establish as patent (vyakto bhedah). The axiom that dhvani manifests sphota presupposes they are distinct entities, so this claim is not derivable from the verse's foundation. -/
def identity_conflation : Reading :=
  { claims := [ Claim.identity dhvani sphota ] }
theorem identity_conflation_inadequate : ¬ contract.Adequate identity_conflation := by decide
#guard contract.licenses identity_conflation = false

end Counterexamples

end VakyaVallari.Verses.V1_104
