/- Translation adequacy against a commentary contract.

   A contract supplies axioms (claims licensed by the commentary). A reading
   (what a translation asserts) is adequate iff every claim it makes is
   entailed by the axioms. Entailment is deliberately mechanical and
   auditable: membership in the axiom list closed under identity reflexivity
   and symmetry. Expressiveness grows only as verses demand it.
-/
import VakyaVallari.Ontology

namespace VakyaVallari

inductive Claim where
  | identity : Entity → Entity → Claim
  | predication : String → Entity → Claim
  | relation : String → Node → Node → Claim
deriving DecidableEq, Repr

/-- What a translation asserts, as claims. -/
structure Reading where
  claims : List Claim
deriving Repr

/-- Mechanical entailment: axiom membership, plus reflexivity and symmetry
    for identity. -/
def entails (axioms : List Claim) : Claim → Bool
  | .identity a b =>
      a == b
        || axioms.contains (.identity a b)
        || axioms.contains (.identity b a)
  | c => axioms.contains c

/-- A reading is adequate iff all its claims are entailed. -/
def Adequate (axioms : List Claim) (r : Reading) : Prop :=
  r.claims.all (entails axioms) = true

/-- Boolean form, for `#guard` and pipelines. -/
def Adequate.check (axioms : List Claim) (r : Reading) : Bool :=
  r.claims.all (entails axioms)

instance : Decidable (Adequate axioms r) := by
  unfold Adequate; infer_instance

end VakyaVallari
