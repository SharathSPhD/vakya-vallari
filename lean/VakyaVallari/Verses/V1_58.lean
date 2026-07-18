/- Verse 1.58 — generated from data/contracts/1.58.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_58

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def grahyatva : Entity := ⟨"grahyatva", Sorta.power⟩
def grahakatva : Entity := ⟨"grahakatva", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent grahyatva) (Node.ent sabda)
    , Claim.relation "asraya" (Node.ent grahakatva) (Node.ent sabda)
    , Claim.predication "hetutvam" grahyatva
    , Claim.predication "hetutvam" grahakatva ]
  , denials := [ Claim.relation "virodha" (Node.ent grahyatva) (Node.ent grahakatva) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent grahyatva) (Node.ent sabda)
    , Claim.relation "asraya" (Node.ent grahakatva) (Node.ent sabda)
    , Claim.predication "hetutvam" grahyatva
    , Claim.predication "hetutvam" grahakatva ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The word has a single unified power that cannot be separated into distinct properties.'
   Why rejected: The verse identifies 'The two properties' and the axioms establish grahyatva and grahakatva as distinct entities, each with its own asraya and hetutvam. This reading falsely collapses them into identity. -/
def single_unified_power : Reading :=
  { claims := [ Claim.identity grahyatva grahakatva ] }
theorem single_unified_power_inadequate : ¬ contract.Adequate single_unified_power := by decide
#guard contract.licenses single_unified_power = false

/- "The two properties of the word interfere with and obstruct each other's effects."
   Why rejected: The verse explicitly states the powers operate 'without conflict'. The commentary reinforces: 'neither obstructs the other'. This reading directly contradicts the denial of virodha between the two powers. -/
def mutual_interference : Reading :=
  { claims := [ Claim.relation "virodha" (Node.ent grahyatva) (Node.ent grahakatva) ] }
theorem mutual_interference_inadequate : ¬ contract.Adequate mutual_interference := by decide
#guard contract.contradicts mutual_interference = true

end Counterexamples

end VakyaVallari.Verses.V1_58
