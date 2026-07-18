/- Verse 1.99 — generated from data/contracts/1.99.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_99

open VakyaVallari

def prakasya : Entity := ⟨"prakāśya", Sorta.manifestation⟩
def prakasaka : Entity := ⟨"prakāśaka", Sorta.power⟩
def pratibimba : Entity := ⟨"pratibimba", Sorta.manifestation⟩
def medium : Entity := ⟨"medium", Sorta.property⟩
def bheda : Entity := ⟨"bheda", Sorta.property⟩
def face : Entity := ⟨"face", Sorta.linguisticItem⟩
def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def appearance : Entity := ⟨"appearance", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "anuvartate" (Node.ent prakasya) (Node.ent prakasaka)
    , Claim.relation "hetutva" (Node.ent medium) (Node.ent bheda)
    , Claim.predication "aniruddha" face
    , Claim.relation "anueti" (Node.ent pratibimba) (Node.ent medium)
    , Claim.relation "anuvartate" (Node.ent sabda) (Node.ent prakasaka) ]
  , denials := [ Claim.predication "parinamate" face
    , Claim.relation "hetutva" (Node.ent face) (Node.ent bheda) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "anuvartate" (Node.ent prakasya) (Node.ent prakasaka)
    , Claim.relation "anueti" (Node.ent pratibimba) (Node.ent medium) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The reflected object itself changes in its intrinsic nature when observed through different media.'
   Why rejected: Treats the face as having properties intrinsic to it that change based on the medium. But the commentary explicitly states 'the face has not changed' and 'the differences are patently the medium's contribution.' This misreading confuses the manifestation (pratibimba) with its ground (face), assigning to the ground properties that belong only to the manifestation. -/
def intrinsic_change : Reading :=
  { claims := [ Claim.predication "parinamate" face ] }
theorem intrinsic_change_inadequate : ¬ contract.Adequate intrinsic_change := by decide
#guard contract.contradicts intrinsic_change = true

/- 'The differences in reflections occur regardless of the medium, showing that the illuminated object is self-determining.'
   Why rejected: Denies the causal role of the medium in producing the differences. But the verse and commentary are explicit: 'when the oil, water and the like differ' the pratibimba differs. This reading severs the causal relation between medium and differences that the verse centrally asserts. -/
def medium_irrelevant : Reading :=
  { claims := [ Claim.relation "hetutva" (Node.ent face) (Node.ent bheda) ] }
theorem medium_irrelevant_inadequate : ¬ contract.Adequate medium_irrelevant := by decide
#guard contract.contradicts medium_irrelevant = true

/- 'The medium deceives us about the true nature of the revealed object; only the unchanging ground is real.'
   Why rejected: While the verse establishes that the face remains unchanged, it does not claim that the appearance is illusory or that perception through media is unreliable. The commentary emphasizes 'this is not speculation but something seen' — treating the appearance as directly observable and informative, not deceptive. -/
def appearance_is_illusion : Reading :=
  { claims := [ Claim.predication "mayic" appearance ] }
theorem appearance_is_illusion_inadequate : ¬ contract.Adequate appearance_is_illusion := by decide
#guard contract.licenses appearance_is_illusion = false

end Counterexamples

end VakyaVallari.Verses.V1_99
