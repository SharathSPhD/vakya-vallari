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
  , denials := [] }

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

end Counterexamples

end VakyaVallari.Verses.V1_93
