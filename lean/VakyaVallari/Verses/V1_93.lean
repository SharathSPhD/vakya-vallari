/- Verse 1.93 — generated from data/contracts/1.93.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_93

open VakyaVallari

def sphota : Entity := ⟨"sphota", Sorta.linguisticItem⟩
def jati : Entity := ⟨"jāti", Sorta.power⟩
def vyakti : Entity := ⟨"vyakti", Sorta.manifestation⟩
def dhvani : Entity := ⟨"dhvani", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.identity sphota jati
    , Claim.relation "abhivyangya" (Node.ent jati) (Node.ent vyakti)
    , Claim.identity vyakti dhvani ]
  , denials := [ Claim.relation "generative_cause" (Node.ent dhvani) (Node.ent sphota) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.identity sphota jati
    , Claim.relation "abhivyangya" (Node.ent jati) (Node.ent vyakti)
    , Claim.identity vyakti dhvani ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The sphota is an individual sound instance, not a universal type.'
   Why rejected: Confuses the sphota (universal jati) with vyaktis (individual instances). Demoting sphota to a particular entity breaks the whole universal-particular framework and makes the identity with jati false. -/
def sphota_particular : Entity := ⟨"sphota", Sorta.manifestation⟩
def sphota_as_particular : Reading :=
  { claims := [ Claim.identity sphota_particular jati ] }
theorem sphota_as_particular_inadequate : ¬ contract.Adequate sphota_as_particular := by decide
#guard contract.licenses sphota_as_particular = false
theorem sphota_as_particular_sort_error : sphota_particular ≠ sphota := by decide

/- 'Sounds (dhvani) are the generative/productive cause of the sphota, rather than its manifestations.'
   Why rejected: Misreads the manifestation relation as a causal generation. The commentary establishes that 'the sound-word relation becomes a special case of the particular-universal relation'—sounds must be instances of the universal (type), not independent causes. Treating dhvani as a generative cause of sphota contradicts this denial and reintroduces the two-relation problem: one causal relation (dhvani→sphota) plus the type-instance relation. The economy argument requires only one unified relation. -/
def dhvani_as_generative_cause : Reading :=
  { claims := [ Claim.relation "generative_cause" (Node.ent dhvani) (Node.ent sphota) ] }
theorem dhvani_as_generative_cause_inadequate : ¬ contract.Adequate dhvani_as_generative_cause := by decide
#guard contract.contradicts dhvani_as_generative_cause = true

end Counterexamples

end VakyaVallari.Verses.V1_93
