/- Verse 1.96 — generated from data/contracts/1.96.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_96

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.absolute⟩
def dhvani : Entity := ⟨"dhvani", Sorta.manifestation⟩
def desa : Entity := ⟨"deśa", Sorta.property⟩
def kaya : Entity := ⟨"kāya", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "abheda" (Node.ent dhvani) (Node.ent sabda)
    , Claim.predication "sambandha" kaya
    , Claim.relation "uparcarena_sambandha" (Node.ent sabda) (Node.ent desa) ]
  , denials := [ Claim.relation "bheda" (Node.ent dhvani) (Node.ent sabda) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "abheda" (Node.ent dhvani) (Node.ent sabda)
    , Claim.predication "sambandha" kaya ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The eternal word becomes parcelled and differentiated as utterances occur in different places.'
   Why rejected: Violates the explicit assertion that despite place-difference in sounds (desa-bheda in dhvani), there is no difference in the word itself. The analogy with embodied things shows that location-predicates can be multiple without creating real division. -/
def spatial_parcellation_of_word : Reading :=
  { claims := [ Claim.relation "bheda" (Node.ent dhvani) (Node.ent sabda) ] }
theorem spatial_parcellation_of_word_inadequate : ¬ contract.Adequate spatial_parcellation_of_word := by decide
#guard contract.contradicts spatial_parcellation_of_word = true

end Counterexamples

end VakyaVallari.Verses.V1_96
