/- Verse 1.153 — generated from data/contracts/1.153.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_153

open VakyaVallari

def apabhransa : Entity := ⟨"apabhraṃśa", Sorta.linguisticItem⟩
def sadhurupa : Entity := ⟨"sādhurūpa", Sorta.linguisticItem⟩
def prasiddhi : Entity := ⟨"prasiddhī", Sorta.power⟩
def vigunasamudaya : Entity := ⟨"viguṇasamudāya", Sorta.power⟩
def vacakatva : Entity := ⟨"vācakatva", Sorta.property⟩
def adrsta : Entity := ⟨"adrṣṭa", Sorta.absolute⟩
def parampara : Entity := ⟨"pāramparyā", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.relation "prasiddhim_agatah" (Node.ent apabhransa) (Node.ent prasiddhi)
    , Claim.predication "asraya_vigunasamudaya" apabhransa
    , Claim.relation "avacakah" (Node.ent prasiddhi) (Node.ent sadhurupa)
    , Claim.predication "vacakatva_niyamita_prasiddhya" vacakatva
    , Claim.relation "sadhutva_amangala" (Node.ent sadhurupa) (Node.ent vigunasamudaya)
    , Claim.predication "adrsta_rakshana" adrsta ]
  , denials := [ Claim.predication "sadhurupa_atma_vacak" sadhurupa
    , Claim.relation "parampara_sadhut_rakshan" (Node.ent parampara) (Node.ent sadhurupa) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "prasiddhim_agatah" (Node.ent apabhransa) (Node.ent prasiddhi)
    , Claim.relation "avacakah" (Node.ent prasiddhi) (Node.ent sadhurupa)
    , Claim.predication "asraya_vigunasamudaya" apabhransa ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The correct form remains expressive and authoritative regardless of speaker community.'
   Why rejected: Violates the core doctrine that expressiveness follows establishment and community. The verse teaches that correctness (sadhutva) confers no reach beyond the community—this reading inappropriately grants the correct form trans-community authority that the commentary explicitly denies. -/
def intrinsic_correctness : Reading :=
  { claims := [ Claim.predication "sadhurupa_atma_vacak" sadhurupa ] }
theorem intrinsic_correctness_inadequate : ¬ contract.Adequate intrinsic_correctness := by decide
#guard contract.contradicts intrinsic_correctness = true

/- 'Defective speakers simply fail to recognize the superiority of the correct form due to ignorance.'
   Why rejected: Treats 1.153 as a normative lament about speaker failure, when the commentary insists on a descriptive reading that grants the Prakrits full semantic citizenship within their communities. This misses the fundamental inversion: it is not that the correct form is truly expressive but unknown; rather, in those communities, the established corrupt form *is* the expressive form. -/
def ignorance_model : Reading :=
  { claims := [ Claim.predication "vigunasamudaya_ajnana" vigunasamudaya ] }
theorem ignorance_model_inadequate : ¬ contract.Adequate ignorance_model := by decide
#guard contract.licenses ignorance_model = false

/- 'Transmission through established lineages preserves the correct form and its authority.'
   Why rejected: Contradicts the verse's explicit teaching that transmission can degrade forms (when it runs through broken lineages), and that the established form—even if corrupt—is what is expressive. The commentary shows transmission as value-neutral: it carries what it carries, and expressiveness follows what is carried, not what should have been carried. -/
def transmission_preserves : Reading :=
  { claims := [ Claim.relation "parampara_sadhut_rakshan" (Node.ent parampara) (Node.ent sadhurupa) ] }
theorem transmission_preserves_inadequate : ¬ contract.Adequate transmission_preserves := by decide
#guard contract.contradicts transmission_preserves = true

/- 'Correctness and establishment are ultimately reconciled by a hidden normative standard that applies universally.'
   Why rejected: Misses the intentional concession: the verse shows that the normative claim survives *only* in the realm of the unseen (adrsta), beyond observation. Any attempt to reconcile correctness and presiding usage within the observable domain violates the verse's retreat to this single unseen ground. -/
def normative_retreat : Reading :=
  { claims := [ Claim.predication "sadhutva_siddhanta_sarva" sadhurupa ] }
theorem normative_retreat_inadequate : ¬ contract.Adequate normative_retreat := by decide
#guard contract.licenses normative_retreat = false

end Counterexamples

end VakyaVallari.Verses.V1_153
