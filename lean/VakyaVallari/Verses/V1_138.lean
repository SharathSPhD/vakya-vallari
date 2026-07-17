/- Verse 1.138 — generated from data/contracts/1.138.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_138

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def rupa : Entity := ⟨"rūpa", Sorta.property⟩
def sakti : Entity := ⟨"śakti", Sorta.power⟩
def visapaharana : Entity := ⟨"viṣāpaharaṇa", Sorta.manifestation⟩
def yata_sakti : Entity := ⟨"yata-śakti", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.predication "asraya" rupa
    , Claim.predication "asraya" sabda
    , Claim.relation "vivartate" (Node.ent yata_sakti) (Node.ent visapaharana)
    , Claim.predication "powers" sabda ]
  , denials := [ Claim.predication "merely_conventional" sabda ] }

def accepted : Reading :=
  { claims := [ Claim.predication "asraya" rupa
    , Claim.predication "asraya" sabda
    , Claim.relation "vivartate" (Node.ent yata_sakti) (Node.ent visapaharana) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Words are conventional signs whose meaning depends entirely on social agreement and shared reference conventions, possessing no intrinsic power of their own.'
   Why rejected: Treats sabda as merely_conventional, contradicting the verse's core claim that words exhibit the same fixed powers as sensible qualities do. This denies yata-sakti for words entirely. -/
def conventional_reference : Reading :=
  { claims := [ Claim.predication "merely_conventional" sabda ] }
theorem conventional_reference_inadequate : ¬ contract.Adequate conventional_reference := by decide
#guard contract.contradicts conventional_reference = true

/- 'The efficacy of mantra formulas is transferable to synonymous words that express the same meaning.'
   Why rejected: Violates the form-boundness axiom: if word-efficacy were transferable to synonyms, the verse's evidence from mantra-healing would collapse. The commentary is explicit: 'substitute a synonym and the power is gone'. This treats sakti as meaning-dependent rather than form-bound. -/
def transferable_efficacy : Reading :=
  { claims := [ Claim.relation "transferable" (Node.ent sabda) (Node.ent visapaharana) ] }
theorem transferable_efficacy_inadequate : ¬ contract.Adequate transferable_efficacy := by decide
#guard contract.licenses transferable_efficacy = false

/- 'The powers attributed to sensible qualities like colour are merely conventional categorizations, not intrinsic determinations.'
   Why rejected: Denies yata-sakti for the analogy base itself (rupa), which would make the entire argument vacuous. The verse grounds the claim about word-power in the observable fixity of colour's powers: 'this herb's colour signals this virtue; fire's touch burns and water's cools, invariably'. -/
def sensible_qualities_non_intrinsic : Reading :=
  { claims := [ Claim.predication "merely_conventional" rupa ] }
theorem sensible_qualities_non_intrinsic_inadequate : ¬ contract.Adequate sensible_qualities_non_intrinsic := by decide
#guard contract.licenses sensible_qualities_non_intrinsic = false

end Counterexamples

end VakyaVallari.Verses.V1_138
