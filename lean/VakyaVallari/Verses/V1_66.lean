/- Verse 1.66 — generated from data/contracts/1.66.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_66

open VakyaVallari

def samjna : Entity := ⟨"samjñā", Sorta.linguisticItem⟩
def samjnin : Entity := ⟨"samjñin", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "rupa_padarthika" samjna
    , Claim.predication "swatantra" samjna
    , Claim.predication "nimitta" samjna
    , Claim.relation "sambandha" (Node.ent samjna) (Node.ent samjnin) ]
  , denials := [ Claim.relation "liyate" (Node.ent samjna) (Node.ent samjnin) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "rupa_padarthika" samjna
    , Claim.predication "nimitta" samjna
    , Claim.relation "sambandha" (Node.ent samjna) (Node.ent samjnin) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The name is ultimately identical with and absorbed into the named thing.'
   Why rejected: Violates the verse's explicit teaching that samjna and samjnin are distinct reals in relation, not a case of identity or absorption. The designation is a relation (sambandha) between two pre-existing entities, each with its own ontological standing. -/
def absorption_identity : Reading :=
  { claims := [ Claim.identity samjna samjnin ] }
theorem absorption_identity_inadequate : ¬ contract.Adequate absorption_identity := by decide
#guard contract.licenses absorption_identity = false

/- 'The name has no meaningful reference except through its connection to the named thing.'
   Why rejected: Contradicts the axiom that samjna is rupa-padarthika before connection. The form (rupa) provides the name's meaning-object independently of assignment to the samjnin. Without this prior standing (swatantra), the name could not function as nimitta for dual grammatical cases. -/
def dependent_meaning : Reading :=
  { claims := [ Claim.predication "samjnin_padarthika" samjna ] }
theorem dependent_meaning_inadequate : ¬ contract.Adequate dependent_meaning := by decide
#guard contract.licenses dependent_meaning = false

end Counterexamples

end VakyaVallari.Verses.V1_66
