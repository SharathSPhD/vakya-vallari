/- Verse 1.91 — generated from data/contracts/1.91.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_91

open VakyaVallari

def vikara : Entity := ⟨"vikāra", Sorta.manifestation⟩
def anupurvi_niyama : Entity := ⟨"anupurvī-niyama", Sorta.property⟩
def pratipatti : Entity := ⟨"pratipattṝ", Sorta.cognition⟩
def buddhi : Entity := ⟨"buddhi", Sorta.cognition⟩
def krama : Entity := ⟨"kramaḥ", Sorta.property⟩
def niyata_krama : Entity := ⟨"niyata krama", Sorta.property⟩
def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def process : Entity := ⟨"process", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.predication "anupurvi_niyama" vikara
    , Claim.predication "niyata_krama" pratipatti
    , Claim.predication "lawlike" process
    , Claim.relation "exemplifies" (Node.ent vikara) (Node.ent pratipatti) ]
  , denials := [ Claim.predication "arbitrary" pratipatti
    , Claim.predication "aniyama" vikara ] }

def accepted : Reading :=
  { claims := [ Claim.predication "anupurvi_niyama" vikara
    , Claim.predication "niyata_krama" pratipatti ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The sequence of cognitions in comprehenders is arbitrary and varies unpredictably from hearer to hearer.'
   Why rejected: Contradicts the verse's assertion of niyata krama (fixed, law-governed sequence), and ignores the evidence that all competent hearers follow the same staged path. -/
def arbitrary_cognitions : Reading :=
  { claims := [ Claim.predication "arbitrary" pratipatti ] }
theorem arbitrary_cognitions_inadequate : ¬ contract.Adequate arbitrary_cognitions := by decide
#guard contract.contradicts arbitrary_cognitions = true

/- 'Errors in comprehension are accidental deviations from the correct path, not lawlike stages.'
   Why rejected: The commentary explicitly states 'Error with lawlike trajectory is process, not accident', insisting that even the errors are integral to the causal process, not random deviations. -/
def accidental_errors : Reading :=
  { claims := [ Claim.predication "accidental" pratipatti ] }
theorem accidental_errors_inadequate : ¬ contract.Adequate accidental_errors := by decide
#guard contract.licenses accidental_errors = false

/- 'Natural transformations like milk becoming cheese have no necessary order of succession.'
   Why rejected: The verse explicitly grounds cognition's ordered nature in the fixed serial order of natural transformation, which the commentary stresses is governed by anupurvi-niyama, not aniyama (disorder). -/
def formless_transformation : Reading :=
  { claims := [ Claim.predication "aniyama" vikara ] }
theorem formless_transformation_inadequate : ¬ contract.Adequate formless_transformation := by decide
#guard contract.contradicts formless_transformation = true

end Counterexamples

end VakyaVallari.Verses.V1_91
