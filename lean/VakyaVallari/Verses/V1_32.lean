/- Verse 1.32 — generated from data/contracts/1.32.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_32

open VakyaVallari

def sakti : Entity := ⟨"śakti", Sorta.power⟩
def avastha : Entity := ⟨"avasthā", Sorta.manifestation⟩
def desa : Entity := ⟨"deśa", Sorta.manifestation⟩
def kala : Entity := ⟨"kāla", Sorta.manifestation⟩
def anumana : Entity := ⟨"anumāna", Sorta.cognition⟩
def prasiddhi : Entity := ⟨"prasiddhi", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.relation "niyantrite" (Node.ent sakti) (Node.ent avastha)
    , Claim.relation "niyantrite" (Node.ent sakti) (Node.ent desa)
    , Claim.relation "niyantrite" (Node.ent sakti) (Node.ent kala)
    , Claim.predication "atidurlabha" prasiddhi ]
  , denials := []
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "niyantrite" (Node.ent sakti) (Node.ent avastha)
    , Claim.relation "niyantrite" (Node.ent sakti) (Node.ent desa)
    , Claim.relation "niyantrite" (Node.ent sakti) (Node.ent kala)
    , Claim.predication "atidurlabha" prasiddhi ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The powers of things remain constant across all variations in state, place, and time, making them fully establishable by inference from finite observation.'
   Why rejected: Denies the core differentiation thesis. The verse explicitly asserts that powers are indexed to avastha, desa, and kala. A reading that claims powers are invariant across these circumstances directly contradicts the axioms and misses why inference becomes ati-durlabha. -/
def universal_unchanging_powers : Reading :=
  { claims := [ Claim.predication "siddha" prasiddhi ] }
theorem universal_unchanging_powers_inadequate : ¬ contract.Adequate universal_unchanging_powers := by decide
#guard contract.licenses universal_unchanging_powers = false

/- 'Inference fails completely because the external world is unknowable and powers cannot be observed at all.'
   Why rejected: Misreads the verse's carefully limited argument. The commentary explicitly states Bhartrhari grants that things have powers and can be observed. The failure is specifically at the inductive step—from finite cases to universal principle—not at perception or external reality. This reading imports a broader skepticism the verse does not entail. -/
def radical_skepticism : Reading :=
  { claims := [ Claim.predication "agrahya" sakti ] }
theorem radical_skepticism_inadequate : ¬ contract.Adequate radical_skepticism := by decide
#guard contract.licenses radical_skepticism = false

end Counterexamples

end VakyaVallari.Verses.V1_32
