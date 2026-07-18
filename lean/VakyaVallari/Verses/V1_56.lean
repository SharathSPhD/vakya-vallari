/- Verse 1.56 — generated from data/contracts/1.56.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_56

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def artha : Entity := ⟨"artha", Sorta.manifestation⟩
def grahana : Entity := ⟨"grahaṇa", Sorta.cognition⟩
def prakasaka : Entity := ⟨"prakāśaka", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent grahana) (Node.ent prakasaka)
    , Claim.relation "purvatara" (Node.ent grahana) (Node.ent artha)
    , Claim.predication "virayate" sabda ]
  , denials := [ Claim.relation "prakasaka" (Node.ent sabda) (Node.ent artha)
    , Claim.relation "satta_prakasaka" (Node.ent sabda) (Node.ent artha) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent grahana) (Node.ent prakasaka)
    , Claim.relation "purvatara" (Node.ent grahana) (Node.ent artha) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Words signify meanings by their acoustic properties alone, regardless of whether the hearer perceives them.'
   Why rejected: Contradicts the core denial: signification requires grahana; words existing unperceived convey nothing. This reading treats signification as a property of the sound-object relation independent of cognition. -/
def direct_acoustic_signification : Reading :=
  { claims := [ Claim.relation "satta_prakasaka" (Node.ent sabda) (Node.ent artha) ] }
theorem direct_acoustic_signification_inadequate : ¬ contract.Adequate direct_acoustic_signification := by decide
#guard contract.contradicts direct_acoustic_signification = true

/- 'Words present in proximity to the hearer convey their meanings even without being heard or grasped.'
   Why rejected: Contradicts the denial that unperceived words convey nothing. This reverses the priority of grasping-the-word, making signification independent of the hearer's cognition. -/
def presence_without_apprehension : Reading :=
  { claims := [ Claim.relation "prakasaka" (Node.ent sabda) (Node.ent artha) ] }
theorem presence_without_apprehension_inadequate : ¬ contract.Adequate presence_without_apprehension := by decide
#guard contract.contradicts presence_without_apprehension = true

end Counterexamples

end VakyaVallari.Verses.V1_56
