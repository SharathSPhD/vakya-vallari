/- Verse 1.150 — generated from data/contracts/1.150.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_150

open VakyaVallari

def suddha_rupa : Entity := ⟨"śuddha-rūpa", Sorta.linguisticItem⟩
def ashuddha_rupa : Entity := ⟨"aśuddha-rūpa", Sorta.linguisticItem⟩
def vackaka : Entity := ⟨"vāchaka", Sorta.power⟩
def smrti_sastra : Entity := ⟨"smṛti-śāstra", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.relation "na_anugamyante_paryaya" (Node.ent ashuddha_rupa) (Node.ent suddha_rupa)
    , Claim.predication "samskara_sadhita" ashuddha_rupa
    , Claim.relation "pratipannas" (Node.ent smrti_sastra) (Node.ent ashuddha_rupa)
    , Claim.predication "asaksat_vackaka" ashuddha_rupa ]
  , denials := [ Claim.relation "paryaya_bhava" (Node.ent ashuddha_rupa) (Node.ent suddha_rupa)
    , Claim.predication "vackaka" ashuddha_rupa ] }

def accepted : Reading :=
  { claims := [ Claim.predication "asaksat_vackaka" ashuddha_rupa
    , Claim.relation "na_anugamyante_paryaya" (Node.ent ashuddha_rupa) (Node.ent suddha_rupa) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Corrupt and correct forms are complete synonyms used interchangeably by cultivated speakers.'
   Why rejected: Contradicts the core finding that cultivated speakers treat them asymmetrically (gavi corrected to gauh, never reverse). The commentary states in cultivated usage they never behave as a synonym-pair. This erases the directional correction that grounds the semantic consequence. -/
def synonym_equivalence : Reading :=
  { claims := [ Claim.relation "paryaya_bhava" (Node.ent ashuddha_rupa) (Node.ent suddha_rupa) ] }
theorem synonym_equivalence_inadequate : ¬ contract.Adequate synonym_equivalence := by decide
#guard contract.contradicts synonym_equivalence = true

/- 'Corrupt forms directly express meaning with the same immediacy as correct forms.'
   Why rejected: The commentary explicitly states the corrupt forms are not *directly* expressive; their conveying is mediated and inferential (1.149). This reading contradicts the semantic thesis the verse establishes. -/
def direct_expressiveness : Reading :=
  { claims := [ Claim.predication "vackaka" ashuddha_rupa ] }
theorem direct_expressiveness_inadequate : ¬ contract.Adequate direct_expressiveness := by decide
#guard contract.contradicts direct_expressiveness = true

end Counterexamples

end VakyaVallari.Verses.V1_150
