/- Verse 1.152 — generated from data/contracts/1.152.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_152

open VakyaVallari

def sadhu : Entity := ⟨"sādhu", Sorta.linguisticItem⟩
def apabhramsa : Entity := ⟨"apabhraṃśa", Sorta.linguisticItem⟩
def artha : Entity := ⟨"artha", Sorta.absolute⟩

def contract : Contract :=
  { axioms := [ Claim.predication "prayoktavye" sadhu
    , Claim.predication "vyavahita" sadhu
    , Claim.relation "abhidhiyate" (Node.ent apabhramsa) (Node.ent artha)
    , Claim.relation "vachaka" (Node.ent sadhu) (Node.ent artha) ]
  , denials := [ Claim.relation "vachaka" (Node.ent apabhramsa) (Node.ent artha) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "prayoktavye" sadhu
    , Claim.predication "vyavahita" sadhu
    , Claim.relation "abhidhiyate" (Node.ent apabhramsa) (Node.ent artha) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'A corrupt form possesses the independent power to express meaning, functioning as the primary expressor without reliance on the correct form.'
   Why rejected: Wrongly attributes the vachaka (expressor/revealer) relation to apabhramsa. The doctrine insists only sadhu is vachaka; apabhramsa's expression is parasitic. Sadhu is 'doing the expressing from behind the screen', making apabhramsa merely the vehicle for meaning's transmission. This reverses the semantic hierarchy. -/
def apabhramsa_autonomous_expression : Reading :=
  { claims := [ Claim.relation "vachaka" (Node.ent apabhramsa) (Node.ent artha) ] }
theorem apabhramsa_autonomous_expression_inadequate : ¬ contract.Adequate apabhramsa_autonomous_expression := by decide
#guard contract.contradicts apabhramsa_autonomous_expression = true

/- 'Corrupt forms are equally valid and appropriate for use in communication as correct forms.'
   Why rejected: Wrongly attributes prayoktavye (normativity/obligation to use) to apabhramsa. Only sadhu is prayoktavye—the form that *should* be employed. Apabhramsa may convey meaning, but it is not normative. The normativity is constitutive of the doctrine: sadhu's prayoktavye status is internal to the mechanism through which competence operates. -/
def apabhramsa_normative : Reading :=
  { claims := [ Claim.predication "prayoktavye" apabhramsa ] }
theorem apabhramsa_normative_inadequate : ¬ contract.Adequate apabhramsa_normative := by decide
#guard contract.licenses apabhramsa_normative = false

end Counterexamples

end VakyaVallari.Verses.V1_152
