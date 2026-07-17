/- Verse 1.133 — generated from data/contracts/1.133.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_133

open VakyaVallari

def vada : Entity := ⟨"vāda", Sorta.linguisticItem⟩
def kartr : Entity := ⟨"kartṛ", Sorta.power⟩
def karma : Entity := ⟨"karma", Sorta.manifestation⟩
def sruti : Entity := ⟨"śruti", Sorta.linguisticItem⟩
def smrti : Entity := ⟨"smṛti", Sorta.linguisticItem⟩
def loka : Entity := ⟨"loka", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.predication "anta" vada
    , Claim.predication "anta" kartr
    , Claim.relation "udita" (Node.ent sruti) (Node.ent karma)
    , Claim.relation "udita" (Node.ent smrti) (Node.ent karma)
    , Claim.relation "avyativartita" (Node.ent loka) (Node.ent karma)
    , Claim.predication "nitya" karma ]
  , denials := [ Claim.predication "anta" karma
    , Claim.relation "vyativartate" (Node.ent loka) (Node.ent karma) ] }

def accepted : Reading :=
  { claims := [ Claim.predication "anta" vada
    , Claim.predication "anta" kartr
    , Claim.relation "avyativartita" (Node.ent loka) (Node.ent karma) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'When doctrines and their authors pass away, the world likewise abandons its practices.'
   Why rejected: Inverts the asymmetry: the commentary insists doctrines are mortal but rites are not. This reading asserts that karma also perishes, contradicting the core observation. -/
def symmetrical_mortality : Reading :=
  { claims := [ Claim.relation "vyativartate" (Node.ent loka) (Node.ent karma) ] }
theorem symmetrical_mortality_inadequate : ¬ contract.Adequate symmetrical_mortality := by decide
#guard contract.contradicts symmetrical_mortality = true

/- 'The ritual order exists only so long as the philosophical systems that originally justified it continue to be argued and defended.'
   Why rejected: Treats karma as parasitic on vada-s. The commentary's point is that karma persists precisely because it is practice-borne, not doctrine-borne. This reading makes karma as mortal as the doctrines, contradicting the declared independence. -/
def doctrine_dependent_ritual : Reading :=
  { claims := [ Claim.predication "anta" karma ] }
theorem doctrine_dependent_ritual_inadequate : ¬ contract.Adequate doctrine_dependent_ritual := by decide
#guard contract.contradicts doctrine_dependent_ritual = true

/- 'The rituals establish themselves through constant practice, while śruti and smṛti merely record what the world has already established.'
   Why rejected: Reverses the logical and textual priority. The verse and commentary make clear that it is the declaration in śruti and smṛti that grounds the karma, not the other way around. This reading asserts an unlicensed source relation (loka creates/authorizes karma) that the axioms do not warrant. -/
def practice_as_source : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent karma) (Node.ent loka) ] }
theorem practice_as_source_inadequate : ¬ contract.Adequate practice_as_source := by decide
#guard contract.licenses practice_as_source = false

end Counterexamples

end VakyaVallari.Verses.V1_133
