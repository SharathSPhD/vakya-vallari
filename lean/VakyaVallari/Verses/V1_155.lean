/- Verse 1.155 — generated from data/contracts/1.155.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_155

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def vivaksa : Entity := ⟨"vivakṣā", Sorta.cognition⟩
def artha : Entity := ⟨"artha", Sorta.absolute⟩
def aviccheda : Entity := ⟨"aviccheda", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "aviccheda" sabda
    , Claim.relation "niyantrita" (Node.ent sabda) (Node.ent vivaksa)
    , Claim.relation "na_abhidhayaka" (Node.ent sabda) (Node.ent artha) ]
  , denials := [ Claim.relation "abhidhayati" (Node.ent sabda) (Node.ent artha) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "niyantrita" (Node.ent sabda) (Node.ent vivaksa)
    , Claim.relation "na_abhidhayaka" (Node.ent sabda) (Node.ent artha)
    , Claim.predication "aviccheda" sabda ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'When a word is employed with the intention of another word, that employed word expresses the meaning directly.'
   Why rejected: Directly contradicts the verse's explicit claim that the employed word is not the expressor. Confuses the conduit (employed form) with the actual expressor (intended word governed by vivaksa). -/
def employed_word_expresses : Reading :=
  { claims := [ Claim.relation "abhidhayati" (Node.ent sabda) (Node.ent artha) ] }
theorem employed_word_expresses_inadequate : ¬ contract.Adequate employed_word_expresses := by decide
#guard contract.contradicts employed_word_expresses = true

/- 'Apabhramsa vernacular forms alone are not expressors of Sanskrit meanings; only Sanskrit forms express.'
   Why rejected: Narrows the verse's universal principle (any word employed with intention of another) to a specific case, missing the verse's indifference to which stream is 'first' (gavi/gauh either direction). The commentary makes clear the doctrine applies equally whether sadhu reaches through apabhramsa or vice versa. -/
def apabhramsa : Entity := ⟨"apabhramśa", Sorta.linguisticItem⟩
def apabhramsa_only_scope : Reading :=
  { claims := [ Claim.relation "na_abhidhayaka" (Node.ent apabhramsa) (Node.ent artha) ] }
theorem apabhramsa_only_scope_inadequate : ¬ contract.Adequate apabhramsa_only_scope := by decide
#guard contract.licenses apabhramsa_only_scope = false

/- 'Both the employed word and the intended word equally express the meaning regardless of intention.'
   Why rejected: Eliminates the role of vivaksa (intention) that the verse places at the center of the determination. The whole point is that expression is *determined by* which form the vivaksa deploys, not independent of it. -/
def vivaksa_irrelevant : Reading :=
  { claims := [ Claim.predication "aviccheda" artha ] }
theorem vivaksa_irrelevant_inadequate : ¬ contract.Adequate vivaksa_irrelevant := by decide
#guard contract.licenses vivaksa_irrelevant = false

end Counterexamples

end VakyaVallari.Verses.V1_155
