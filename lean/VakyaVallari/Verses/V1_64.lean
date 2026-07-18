/- Verse 1.64 — generated from data/contracts/1.64.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_64

open VakyaVallari

def guna : Entity := ⟨"guṇa", Sorta.property⟩
def asraya : Entity := ⟨"āśraya", Sorta.manifestation⟩
def prakarsha_hetu : Entity := ⟨"prakarṣa-hetu", Sorta.power⟩
def prakrishtatva : Entity := ⟨"prakṛṣṭatva", Sorta.property⟩
def svatantrya : Entity := ⟨"svatantrya", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asrita" (Node.ent guna) (Node.ent asraya)
    , Claim.predication "prakarsa_hetu" guna
    , Claim.predication "svatantryena_upadishyate" guna
    , Claim.relation "pratiyate" (Node.ent guna) (Node.ent prakrishtatva) ]
  , denials := [ Claim.predication "svatantra" guna ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "prakarsa_hetu" guna
    , Claim.predication "svatantryena_upadishyate" guna
    , Claim.relation "asrita" (Node.ent guna) (Node.ent asraya)
    , Claim.relation "pratiyate" (Node.ent guna) (Node.ent prakrishtatva) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The quality that grounds pre-eminence is truly independent, self-standing linguistic or ontological atom.'
   Why rejected: The verse and commentary are explicit that the guna appears to be independent only as a provisional analytical move: 'though in reality it exists only asrita, resting on its substrate.' Treating it as truly svatantra contradicts the asrita relation the verse asserts. The sort error (property being treated as absolute) makes this analysis fundamentally mistaken. -/
def guna_as_absolute : Reading :=
  { claims := [ Claim.predication "svatantra" guna ] }
theorem guna_as_absolute_inadequate : ¬ contract.Adequate guna_as_absolute := by decide
#guard contract.contradicts guna_as_absolute = true

/- "The substrate rests on the quality; only the substrate's pre-eminence grounds understanding of the quality."
   Why rejected: This reverses the critical asymmetry the verse establishes. The guna is asrita to the asraya, not the reverse. The commentary is clear: from the quality, the substrate's pre-eminence is understood. Reversing the dependence direction makes the logical structure backwards. -/
def inverted_dependence : Reading :=
  { claims := [ Claim.relation "asrita" (Node.ent asraya) (Node.ent guna) ] }
theorem inverted_dependence_inadequate : ¬ contract.Adequate inverted_dependence := by decide
#guard contract.licenses inverted_dependence = false

/- 'Because grammar provisionally grants independence to the quality as a mistake, treating it as if independent is a flaw that weakens grammatical analysis.'
   Why rejected: The commentary explicitly reframes analytical independence as a legitimate abstraction, not an error: 'analysis grants provisional independence to what is ontologically dependent, in order to state generalizations.' Grammar's method—treating asrita entities as if svatantra for rule-making—is not a flaw but a necessary feature. Misreading this as a mistake misses Bhartrhari's point. -/
def analytical_mistake_as_error : Reading :=
  { claims := [ Claim.predication "defect" guna ] }
theorem analytical_mistake_as_error_inadequate : ¬ contract.Adequate analytical_mistake_as_error := by decide
#guard contract.licenses analytical_mistake_as_error = false

end Counterexamples

end VakyaVallari.Verses.V1_64
