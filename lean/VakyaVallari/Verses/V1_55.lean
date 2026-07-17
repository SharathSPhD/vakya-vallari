/- Verse 1.55 — generated from data/contracts/1.55.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_55

open VakyaVallari

def tejas : Entity := ⟨"tejas", Sorta.power⟩
def grahakatva : Entity := ⟨"grahakatva", Sorta.power⟩
def grahyatva : Entity := ⟨"grāhyatva", Sorta.power⟩
def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def artha : Entity := ⟨"artha", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.predication "has_grahakatva" tejas
    , Claim.predication "has_grahyatva" tejas
    , Claim.predication "has_grahakatva" sabda
    , Claim.predication "has_grahyatva" sabda
    , Claim.relation "prthag_avasthite" (Node.ent grahyatva) (Node.ent grahakatva)
    , Claim.predication "sarva_sabdanam" sabda ]
  , denials := [ Claim.identity grahyatva grahakatva ] }

def accepted : Reading :=
  { claims := [ Claim.predication "has_grahakatva" sabda
    , Claim.predication "has_grahyatva" sabda
    , Claim.relation "prthag_avasthite" (Node.ent grahyatva) (Node.ent grahakatva) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Words possess a single undifferentiated power that is both passive reception and active presentation, not two distinct powers.'
   Why rejected: The verse emphasizes 'standing distinct' and the commentary repeatedly stresses prthag avasthite (distinct in standing). Merging the powers into one contradicts the core doctrine that attention can fall on either separately. This denies the relation axiom. -/
def undifferentiated_power : Reading :=
  { claims := [ Claim.identity grahyatva grahakatva ] }
theorem undifferentiated_power_inadequate : ¬ contract.Adequate undifferentiated_power := by decide
#guard contract.contradicts undifferentiated_power = true

/- 'Words are merely inert sounds that are heard, lacking any active power to seize and present meaning.'
   Why rejected: This assigns to words only the passive power (grahyatva), not the active power (grahakatva). The axioms require all sabda to have both: 'grahakatva, graspingness (they seize their meanings and present them)'. Denying this relation makes the reading unlicensed. -/
def sabda_inert : Entity := ⟨"inert sound", Sorta.linguisticItem⟩
def only_passive : Reading :=
  { claims := [ Claim.predication "has_grahyatva" sabda_inert
    , Claim.identity sabda sabda_inert ] }
theorem only_passive_inadequate : ¬ contract.Adequate only_passive := by decide
#guard contract.licenses only_passive = false

/- 'Some words (such as words used as mere sounds in poetry) lack the power to grasp meaning, unlike ordinary words.'
   Why rejected: This restricts grahakatva to only some words, violating the axiom 'Sarva-sabdanam, of *all* words: the doctrine tolerates no exceptions.' A word without grahakatva contradicts the universal requirement. -/
def poetic_word : Entity := ⟨"poetic word", Sorta.linguisticItem⟩
def exceptional_words : Reading :=
  { claims := [ Claim.predication "has_grahyatva" poetic_word ] }
theorem exceptional_words_inadequate : ¬ contract.Adequate exceptional_words := by decide
#guard contract.licenses exceptional_words = false

end Counterexamples

end VakyaVallari.Verses.V1_55
