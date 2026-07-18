/- Verse 1.70 — generated from data/contracts/1.70.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_70

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def sphota : Entity := ⟨"sphota", Sorta.linguisticItem⟩
def phoneme : Entity := ⟨"phoneme", Sorta.linguisticItem⟩
def ekatvavada : Entity := ⟨"ekatvavāda", Sorta.power⟩
def nanatvavada : Entity := ⟨"nānātvavāda", Sorta.power⟩
def karyatva : Entity := ⟨"kāryatva", Sorta.property⟩
def nityata : Entity := ⟨"nityatā", Sorta.property⟩
def cognition : Entity := ⟨"buddhi", Sorta.cognition⟩

def contract : Contract :=
  { axioms := []
  , denials := []
  , reported := [ Claim.predication "asti" ekatvavada
    , Claim.predication "asti" nanatvavada
    , Claim.relation "asraya" (Node.ent ekatvavada) (Node.ent sphota)
    , Claim.relation "asraya" (Node.ent nanatvavada) (Node.ent phoneme) ] }

-- pūrvapakṣa: this contract carries reported (non-endorsed) claims
#guard contract.doxographic = true

def accepted : Reading :=
  { claims := [ Claim.predication "asti" ekatvavada
    , Claim.predication "asti" nanatvavada
    , Claim.relation "asraya" (Node.ent ekatvavada) (Node.ent sphota)
    , Claim.relation "asraya" (Node.ent nanatvavada) (Node.ent phoneme) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Any proponent of unity necessarily holds that words are eternal.'
   Why rejected: Assumes a required link between unity and eternality, violating the orthogonality that the verse establishes through repetition and the commentary confirms: 'unity-theorists and plurality-theorists exist on both sides of the eternality dispute.' -/
def necessary_eternality : Reading :=
  { claims := [ Claim.relation "avasrayate" (Node.ent ekatvavada) (Node.ent nityata) ] }
theorem necessary_eternality_inadequate : ¬ contract.Adequate necessary_eternality := by decide
#guard contract.licenses necessary_eternality = false

/- 'A word that is produced cannot be one unified entity.'
   Why rejected: Falsely links production to plurality, collapsing the two independent questions. Theorists of unity exist on both sides of the eternality/production divide, so production does not entail plurality. -/
def production_requires_plurality : Reading :=
  { claims := [ Claim.relation "avasrayate" (Node.ent karyatva) (Node.ent nanatvavada) ] }
theorem production_requires_plurality_inadequate : ¬ contract.Adequate production_requires_plurality := by decide
#guard contract.licenses production_requires_plurality = false

end Counterexamples

end VakyaVallari.Verses.V1_70
