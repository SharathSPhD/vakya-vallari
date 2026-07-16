/- Verse 1.7 — generated from data/contracts/1.7.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_7

open VakyaVallari

def smrti : Entity := ⟨"smṛti", Sorta.property⟩
def veda : Entity := ⟨"veda", Sorta.absolute⟩
def linga : Entity := ⟨"liṅga", Sorta.property⟩
def vedavid : Entity := ⟨"vedavid", Sorta.cognition⟩
def drishta_prayojana : Entity := ⟨"dṛṣṭa prayojana", Sorta.property⟩
def adrshta_prayojana : Entity := ⟨"adṛṣṭa prayojana", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.relation "prakalpita" (Node.ent vedavid) (Node.ent smrti)
    , Claim.predication "paratantra" smrti
    , Claim.relation "asritya" (Node.ent smrti) (Node.ent veda)
    , Claim.predication "ubhayaprayojana" smrti ]
  , denials := [ Claim.predication "svatantra" smrti ] }

def accepted : Reading :=
  { claims := [ Claim.relation "prakalpita" (Node.ent vedavid) (Node.ent smrti)
    , Claim.relation "asritya" (Node.ent smrti) (Node.ent veda)
    , Claim.predication "paratantra" smrti ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The smritis are authoritative texts composed independently, with both seen and unseen purposes.'
   Why rejected: Asserts independence (svatantra) for smritis, which the commentary explicitly denies. They are derivative (paratantra) and rest upon the Veda alone. Treating smrti as an independent authority contradicts the denial. -/
def smrti_as_independent : Reading :=
  { claims := [ Claim.predication "svatantra" smrti ] }
theorem smrti_as_independent_inadequate : ¬ contract.Adequate smrti_as_independent := by decide
#guard contract.contradicts smrti_as_independent = true

/- 'The smritis were framed by learned scholars directly from observation of the world, not from Vedic inference.'
   Why rejected: Asserts that smrtis derive from empirical sources rather than from Vedic linga (inferential marks). The commentary explicitly states they are prakalpita on the basis of linga within the Veda itself. -/
def smrti_source_empirical : Reading :=
  { claims := [ Claim.relation "prakalpita" (Node.ent smrti) (Node.ent linga) ] }
theorem smrti_source_empirical_inadequate : ¬ contract.Adequate smrti_source_empirical := by decide
#guard contract.licenses smrti_source_empirical = false

end Counterexamples

end VakyaVallari.Verses.V1_7
