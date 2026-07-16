/- Verse 1.61 — generated from data/contracts/1.61.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_61

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def sva_rupa : Entity := ⟨"sva-rūpa", Sorta.manifestation⟩
def artha : Entity := ⟨"artha", Sorta.manifestation⟩
def sakti : Entity := ⟨"śakti", Sorta.power⟩
def sva_rupa_sakti : Entity := ⟨"sva-rūpa-śakti", Sorta.power⟩
def artha_sakti : Entity := ⟨"artha-śakti", Sorta.power⟩
def vyakarana : Entity := ⟨"vyākaraṇa", Sorta.power⟩
def paramartha : Entity := ⟨"paramārtha", Sorta.manifestation⟩
def vikalpa : Entity := ⟨"vikalpa", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.relation "coexist" (Node.ent sva_rupa_sakti) (Node.ent artha_sakti)
    , Claim.predication "aavarana-vimuktah" artha_sakti
    , Claim.predication "aavarana-vimuktah" sva_rupa_sakti
    , Claim.relation "avadharyate" (Node.ent vikalpa) (Node.ent sabda)
    , Claim.predication "dvaya-sakti-sambhava" sabda
    , Claim.predication "na-niyata-karyabhak" sabda ]
  , denials := [ Claim.relation "exhausts" (Node.ent sabda) (Node.ent sakti)
    , Claim.relation "determines-operation" (Node.ent sabda) (Node.ent vyakarana) ] }

def accepted : Reading :=
  { claims := [ Claim.predication "na-niyata-karyabhak" sabda
    , Claim.predication "aavarana-vimuktah" artha_sakti
    , Claim.relation "coexist" (Node.ent sva_rupa_sakti) (Node.ent artha_sakti) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'When a word is mentioned in a rule, its power is exhausted by that mention.'
   Why rejected: The verse explicitly denies that mention exhausts the word's powers. This reading misses the coexistence doctrine: the word retains both its own-form power and referential power regardless of mention. -/
def mention_exhausts_power : Reading :=
  { claims := [ Claim.relation "exhausts" (Node.ent sabda) (Node.ent sakti) ] }
theorem mention_exhausts_power_inadequate : ¬ contract.Adequate mention_exhausts_power := by decide
#guard contract.contradicts mention_exhausts_power = true

/- "A word uttered in a grammatical rule necessarily becomes the direct object of that rule's operation."
   Why rejected: Contradicts the core axiom that utterance does not make the word niyatam karyabhak. The verse insists on the independence of the word's powers from its occurrence in a rule. -/
def utterance_determines_operation : Reading :=
  { claims := [ Claim.relation "determines-operation" (Node.ent sabda) (Node.ent vyakarana) ] }
theorem utterance_determines_operation_inadequate : ¬ contract.Adequate utterance_determines_operation := by decide
#guard contract.contradicts utterance_determines_operation = true

/- 'Each word occurrence has a single power determined by its function in the grammatical rule.'
   Why rejected: Violates the two-powers doctrine central to the verse. The commentary explicitly states the two saktis coexist, and context selects which operates—not that the word has only one power. -/
def single_power_doctrine : Reading :=
  { claims := [ Claim.predication "eka-sakti-yuktah" sabda ] }
theorem single_power_doctrine_inadequate : ¬ contract.Adequate single_power_doctrine := by decide
#guard contract.licenses single_power_doctrine = false

end Counterexamples

end VakyaVallari.Verses.V1_61
