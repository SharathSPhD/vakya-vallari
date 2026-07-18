/- Verse 1.88 — generated from data/contracts/1.88.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_88

open VakyaVallari

def varna_sphota : Entity := ⟨"varṇa-sphota", Sorta.absolute⟩
def pada_sphota : Entity := ⟨"pada-sphota", Sorta.absolute⟩
def vakya_sphota : Entity := ⟨"vākya-sphota", Sorta.absolute⟩
def vyanjaka : Entity := ⟨"vyañjaka", Sorta.linguisticItem⟩
def sakti : Entity := ⟨"śakti", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.predication "atyantabhinna" varna_sphota
    , Claim.predication "atyantabhinna" pada_sphota
    , Claim.predication "atyantabhinna" vakya_sphota
    , Claim.relation "vyanjaka" (Node.ent varna_sphota) (Node.ent vyanjaka)
    , Claim.relation "vyanjaka" (Node.ent pada_sphota) (Node.ent vyanjaka)
    , Claim.relation "vyanjaka" (Node.ent vakya_sphota) (Node.ent vyanjaka)
    , Claim.predication "samkirana" sakti
    , Claim.predication "paraspara_bhinna" varna_sphota
    , Claim.predication "paraspara_bhinna" pada_sphota
    , Claim.predication "paraspara_bhinna" vakya_sphota ]
  , denials := [ Claim.relation "samghata" (Node.ent varna_sphota) (Node.ent pada_sphota)
    , Claim.relation "samghata" (Node.ent pada_sphota) (Node.ent vakya_sphota) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "atyantabhinna" varna_sphota
    , Claim.predication "atyantabhinna" pada_sphota
    , Claim.predication "atyantabhinna" vakya_sphota
    , Claim.predication "samkirana" sakti ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The word-sphota is composed of constituent phoneme-sphotas arranged in sequence.'
   Why rejected: Treats the hierarchy among sphotas as mereological composition, which the commentary explicitly denies: hierarchy among sphotas is a hierarchy of alternative unities, not of containment. This contradicts the denial that the word is a sum of phonemes. -/
def compositional_hierarchy : Reading :=
  { claims := [ Claim.relation "samghata" (Node.ent varna_sphota) (Node.ent pada_sphota) ] }
theorem compositional_hierarchy_inadequate : ¬ contract.Adequate compositional_hierarchy := by decide
#guard contract.contradicts compositional_hierarchy = true

/- 'One can mark off distinct temporal segments of the speech stream as manifesting phonemes, others as manifesting words, and still others as manifesting the sentence.'
   Why rejected: Asserts that portions of the acoustic stream can be definitively assigned to distinct manifestational levels. The commentary explicitly denies this: the hearer cannot assign portions of the acoustic flow to levels. The iva signals that apparent commingling blocks any such partition. -/
def acoustic_stream_partitioned : Reading :=
  { claims := [ Claim.relation "sakshi" (Node.ent vyanjaka) (Node.ent varna_sphota) ] }
theorem acoustic_stream_partitioned_inadequate : ¬ contract.Adequate acoustic_stream_partitioned := by decide
#guard contract.licenses acoustic_stream_partitioned = false

end Counterexamples

end VakyaVallari.Verses.V1_88
