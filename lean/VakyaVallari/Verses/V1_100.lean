/- Verse 1.100 — generated from data/contracts/1.100.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_100

open VakyaVallari

def pratibimba : Entity := ⟨"pratibimba", Sorta.manifestation⟩
def bimba : Entity := ⟨"bimba", Sorta.absolute⟩
def parimana : Entity := ⟨"parimāṇa", Sorta.property⟩
def bhava : Entity := ⟨"bhāva", Sorta.absolute⟩
def sajatiya : Entity := ⟨"sārūpya", Sorta.property⟩
def abhasavikara : Entity := ⟨"abhāsavikāra", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent pratibimba) (Node.ent bimba)
    , Claim.predication "viruddhaparimana" pratibimba
    , Claim.identity pratibimba abhasavikara
    , Claim.predication "na_dvitiya" pratibimba ]
  , denials := [ Claim.predication "satya_bhava" pratibimba ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "viruddhaparimana" pratibimba
    , Claim.predication "na_dvitiya" pratibimba
    , Claim.relation "asraya" (Node.ent pratibimba) (Node.ent bimba) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'A mountain reflected in a mirror is a real entity with the same form as the original mountain.'
   Why rejected: Treats the reflection as possessing satya-bhava (real entity status) and sarupa (same-form property), which the commentary explicitly refutes. The denial forbids treating reflections as real duplicates; this reading asserts exactly that contradiction. -/
def literal_duplicate_entity : Reading :=
  { claims := [ Claim.predication "satya_bhava" pratibimba ] }
theorem literal_duplicate_entity_inadequate : ¬ contract.Adequate literal_duplicate_entity := by decide
#guard contract.contradicts literal_duplicate_entity = true

/- 'The size-in-the-mirror is a real property transferred from the original to the reflection.'
   Why rejected: Proposes that parimana literally transfers from the original to the reflection as a real transferrable property. The commentary refutes this: size-in-the-mirror is a fact about the mirroring condition (abhasavikara), not a transferred property. This incorrectly sorts the mirrored-size as a property rather than an appearance-dependent manifestation. -/
def parimana_bhava : Entity := ⟨"parimāṇa-bhāva", Sorta.property⟩
def size_transfer_doctrine : Reading :=
  { claims := [ Claim.relation "sankriya" (Node.ent bimba) (Node.ent parimana_bhava) ] }
theorem size_transfer_doctrine_inadequate : ¬ contract.Adequate size_transfer_doctrine := by decide
#guard contract.licenses size_transfer_doctrine = false

end Counterexamples

end VakyaVallari.Verses.V1_100
