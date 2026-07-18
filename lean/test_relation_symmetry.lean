import VakyaVallari.Adequacy

namespace VakyaVallari.Tests.RelationSymmetry

open VakyaVallari

def a : Entity := ⟨"a", Sorta.absolute⟩
def b : Entity := ⟨"b", Sorta.absolute⟩

def contract : Contract :=
  { axioms := [Claim.relation "vivartate" (Node.ent a) (Node.ent b)]
  , denials := [] }

-- The reversed relation claim should NOT be entailed
def reversed_reading : Reading :=
  { claims := [Claim.relation "vivartate" (Node.ent b) (Node.ent a)] }

-- This should fail: the theorem should be false if the relation is entailed
theorem reversed_not_adequate : ¬ contract.Adequate reversed_reading := by decide

-- Also verify that the forward relation IS entailed
def forward_reading : Reading :=
  { claims := [Claim.relation "vivartate" (Node.ent a) (Node.ent b)] }

theorem forward_adequate : contract.Adequate forward_reading := by decide

end VakyaVallari.Tests.RelationSymmetry
