/- Verse 1.149 — generated from data/contracts/1.149.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_149

open VakyaVallari

def sadhu : Entity := ⟨"sadhu", Sorta.linguisticItem⟩
def apabhramsa : Entity := ⟨"apabhramsa", Sorta.linguisticItem⟩
def pratyaya : Entity := ⟨"pratyaya", Sorta.cognition⟩
def artha : Entity := ⟨"artha", Sorta.property⟩
def anumana : Entity := ⟨"anumāna", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.relation "hetave" (Node.ent apabhramsa) (Node.ent pratyaya)
    , Claim.relation "prakasaka" (Node.ent apabhramsa) (Node.ent artha)
    , Claim.relation "prakasaka" (Node.ent sadhu) (Node.ent artha)
    , Claim.relation "signifies_through" (Node.ent apabhramsa) (Node.ent sadhu)
    , Claim.predication "mediated_by_anumana" apabhramsa ]
  , denials := [ Claim.identity apabhramsa sadhu ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "hetave" (Node.ent apabhramsa) (Node.ent pratyaya)
    , Claim.relation "prakasaka" (Node.ent apabhramsa) (Node.ent artha) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Corrupt and correct word-forms are equivalent in status and function.'
   Why rejected: The commentary explicitly states the corrupt form is evidence of the correct one, not equal to it. An equality claim contradicts the foundational asymmetry established between them. -/
def apabhramsa_equal_to_sadhu : Reading :=
  { claims := [ Claim.identity apabhramsa sadhu ] }
theorem apabhramsa_equal_to_sadhu_inadequate : ¬ contract.Adequate apabhramsa_equal_to_sadhu := by decide
#guard contract.contradicts apabhramsa_equal_to_sadhu = true

/- 'Correct forms derive their meaning from corrupt ones; the correct signifies through the deviant.'
   Why rejected: Reverses the causal and semiotic order. The commentary is explicit that apabhramsa signifies THROUGH sadhu, not the reverse. Sadhu is the base; corruption is parasitic on correctness. The reversed direction inverts the entire doctrine. -/
def mediation_reversed : Reading :=
  { claims := [ Claim.relation "signifies_through" (Node.ent sadhu) (Node.ent apabhramsa) ] }
theorem mediation_reversed_inadequate : ¬ contract.Adequate mediation_reversed := by decide
#guard contract.licenses mediation_reversed = false

end Counterexamples

end VakyaVallari.Verses.V1_149
