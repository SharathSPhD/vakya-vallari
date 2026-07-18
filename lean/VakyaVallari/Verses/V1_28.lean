/- Verse 1.28 — generated from data/contracts/1.28.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_28

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def adi : Entity := ⟨"ādi", Sorta.property⟩
def nityata : Entity := ⟨"nityatā", Sorta.property⟩
def krtakatva : Entity := ⟨"kṛtakatvā", Sorta.property⟩
def pranin : Entity := ⟨"prāṇin", Sorta.power⟩
def vyavastha : Entity := ⟨"vyavasthā", Sorta.manifestation⟩
def anadinidhana : Entity := ⟨"anādinidhanā", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "anupalabdha_adi" sabda
    , Claim.relation "iva" (Node.ent sabda) (Node.ent pranin)
    , Claim.predication "nityata" vyavastha
    , Claim.predication "anadinidhana" vyavastha ]
  , denials := [ Claim.predication "adi" sabda ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "anupalabdha_adi" sabda
    , Claim.relation "iva" (Node.ent sabda) (Node.ent pranin)
    , Claim.predication "nityata" vyavastha ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Individual words possess eternality as an intrinsic metaphysical property.'
   Why rejected: The verse's concessive opening ('whether they are eternal or made') explicitly declines any commitment to individual eternality. Its thesis is vyavastha-nityata (eternality of arrangement), not the eternality of words themselves. This reading commits to precisely what the verse brackets. -/
def individual_eternality : Reading :=
  { claims := [ Claim.predication "nityata" sabda ] }
theorem individual_eternality_inadequate : ¬ contract.Adequate individual_eternality := by decide
#guard contract.licenses individual_eternality = false

/- 'Words, whether eternal or made, possess an identifiable beginning or origin point.'
   Why rejected: Directly contradicts the core logical claim: on both horns of the disjunction (nitya or krtaka), no adi, no beginning, is found for them. This is the denial axis of the verse. -/
def words_have_origin : Reading :=
  { claims := [ Claim.predication "adi" sabda ] }
theorem words_have_origin_inadequate : ¬ contract.Adequate words_have_origin := by decide
#guard contract.contradicts words_have_origin = true

end Counterexamples

end VakyaVallari.Verses.V1_28
