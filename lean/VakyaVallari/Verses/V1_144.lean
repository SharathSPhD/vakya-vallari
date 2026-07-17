/- Verse 1.144 — generated from data/contracts/1.144.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_144

open VakyaVallari

def sruti : Entity := ⟨"śruti", Sorta.absolute⟩
def smrti : Entity := ⟨"smṛti", Sorta.manifestation⟩
def sista : Entity := ⟨"śiṣṭa", Sorta.power⟩
def eternality_seed : Entity := ⟨"eternality_as_seed", Sorta.property⟩
def eternality_process : Entity := ⟨"eternality_as_process", Sorta.property⟩
def authorship : Entity := ⟨"authorship", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "anadi" sruti
    , Claim.predication "avyavacchinna" sruti
    , Claim.predication "akartrka" sruti
    , Claim.relation "nibadhyamana" (Node.ent sista) (Node.ent smrti)
    , Claim.predication "avyavacchinna" smrti
    , Claim.predication "kratritva" smrti
    , Claim.relation "asraya" (Node.ent smrti) (Node.ent sruti)
    , Claim.predication "eternality_seed" sruti
    , Claim.predication "eternality_process" smrti ]
  , denials := [ Claim.predication "akartrka" smrti ] }

def accepted : Reading :=
  { claims := [ Claim.predication "anadi" sruti
    , Claim.predication "avyavacchinna" sruti
    , Claim.predication "akartrka" sruti
    , Claim.relation "nibadhyamana" (Node.ent sista) (Node.ent smrti)
    , Claim.predication "avyavacchinna" smrti
    , Claim.predication "kratritva" smrti ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Smṛti, though continuously composed, is eternal in substance just like śruti, with no distinction in their types of eternality.'
   Why rejected: The commentary is emphatic about the difference: 'The two eternities are thus of different types — sruti eternal in substance (or as the recurrent seed), smrti eternal only as continuity of composition.' Treating smṛti as having the same eternality-type as śruti (eternality_seed instead of eternality_process) directly contradicts the contrast the verse establishes. This is a sort confusion: attempting to grant smṛti absoluteness where only manifestation applies. -/
def smrti_as_absolute_wrong : Entity := ⟨"smṛti", Sorta.absolute⟩
def smrti_absolute_like_sruti : Reading :=
  { claims := [ Claim.predication "eternality_seed" smrti_as_absolute_wrong ] }
theorem smrti_absolute_like_sruti_inadequate : ¬ contract.Adequate smrti_absolute_like_sruti := by decide
#guard contract.licenses smrti_absolute_like_sruti = false
theorem smrti_absolute_like_sruti_sort_error : smrti_as_absolute_wrong ≠ smrti := by decide

/- "Smṛti is eternal in its substance through continuous composition by the cultivated, equal to śruti's eternality."
   Why rejected: The commentary distinguishes two kinds of eternality: 'The two eternities are thus of different types — sruti eternal in substance (or as the recurrent seed), smrti eternal only as continuity of composition.' To treat smṛti as eternally substantive like śruti conflates these distinctions and loses the key contrast between absolute and manifestation. -/
def smrti_absolute_error : Entity := ⟨"smṛti", Sorta.absolute⟩
def smrti_absolute_eternality : Reading :=
  { claims := [ Claim.predication "eternality_seed" smrti_absolute_error ] }
theorem smrti_absolute_eternality_inadequate : ¬ contract.Adequate smrti_absolute_eternality := by decide
#guard contract.licenses smrti_absolute_eternality = false
theorem smrti_absolute_eternality_sort_error : smrti_absolute_error ≠ smrti := by decide

end Counterexamples

end VakyaVallari.Verses.V1_144
