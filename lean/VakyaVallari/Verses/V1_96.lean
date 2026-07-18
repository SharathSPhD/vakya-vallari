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
  , denials := [ Claim.relation "bheda" (Node.ent dhvani) (Node.ent sabda)
    , Claim.relation "bheda" (Node.ent kaya) (Node.ent desa) ]
  , reported := [] }

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

/- 'Bodies themselves are differentiated across the multiple places where they occur, and by the same logic, the word too is differentiated across utterance-locations.'
   Why rejected: Misreads the analogy. The verse's point is to show that embodied things stand in multiple place-connections WITHOUT becoming differentiated or divided—one body in many places remains one body (multiply without multiplying them). This demonstrates that place-multiplicity is compatible with essential non-difference, justifying the denial of difference (bheda) between sound and word despite sounds being multiply-located. Claiming bodies ARE differentiated by place inverts the analogy's structural argument and undermines the parallel reasoning for the word. -/
def embodied_thing_localization_error : Reading :=
  { claims := [ Claim.relation "bheda" (Node.ent kaya) (Node.ent desa) ] }
theorem embodied_thing_localization_error_inadequate : ¬ contract.Adequate embodied_thing_localization_error := by decide
#guard contract.contradicts embodied_thing_localization_error = true

end Counterexamples

end VakyaVallari.Verses.V1_96
