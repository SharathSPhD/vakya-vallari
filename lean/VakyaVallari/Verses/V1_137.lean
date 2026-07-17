/- Verse 1.137 — generated from data/contracts/1.137.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_137

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def sakti : Entity := ⟨"śakti", Sorta.power⟩
def tarka : Entity := ⟨"tarka", Sorta.power⟩
def purusa : Entity := ⟨"puruṣa", Sorta.cognition⟩
def nyaya : Entity := ⟨"nyāya", Sorta.linguisticItem⟩
def agama : Entity := ⟨"āgama", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent sakti) (Node.ent sabda)
    , Claim.relation "asraya" (Node.ent tarka) (Node.ent purusa)
    , Claim.predication "sabdanugata" tarka
    , Claim.predication "anibandhana" tarka ]
  , denials := [ Claim.predication "svatantra" tarka ] }

def accepted : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent sakti) (Node.ent sabda)
    , Claim.relation "asraya" (Node.ent tarka) (Node.ent purusa)
    , Claim.predication "sabdanugata" tarka ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The personal reasoning power and word-power are essentially equivalent sources of interpretive authority; both work together as equal instruments.'
   Why rejected: This misses the verse's radical subordination: sakti belongs to words; tarka has authority only when following words. The commentary emphasizes asymmetry, not equivalence. Reading tarka and sakti as coequal violates the axiomatic structure. -/
def tarka_coequal : Reading :=
  { claims := [ Claim.identity sakti tarka ] }
theorem tarka_coequal_inadequate : ¬ contract.Adequate tarka_coequal := by decide
#guard contract.licenses tarka_coequal = false

/- 'Reasoning, when exercised by a skilled person, can be an independent and authoritative source of truth, even without textual support.'
   Why rejected: The verse explicitly denies this: tarka without agama is anibandhana (groundless). The verse rules out freestanding authority for reasoning. -/
def tarka_independent : Reading :=
  { claims := [ Claim.predication "svatantra" tarka ] }
theorem tarka_independent_inadequate : ¬ contract.Adequate tarka_independent := by decide
#guard contract.contradicts tarka_independent = true

end Counterexamples

end VakyaVallari.Verses.V1_137
