/- Verse 1.98 — generated from data/contracts/1.98.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_98

open VakyaVallari

def dravya : Entity := ⟨"dravya", Sorta.absolute⟩
def gandha : Entity := ⟨"gandha", Sorta.manifestation⟩
def nimitta : Entity := ⟨"nimitta", Sorta.power⟩
def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def svara : Entity := ⟨"svara", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "prakasaka" (Node.ent nimitta) (Node.ent gandha)
    , Claim.predication "niyata" nimitta
    , Claim.relation "asraya" (Node.ent nimitta) (Node.ent dravya)
    , Claim.relation "prakasaka" (Node.ent svara) (Node.ent sabda) ]
  , denials := [ Claim.predication "constitutes" svara ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "prakasaka" (Node.ent nimitta) (Node.ent gandha)
    , Claim.predication "niyata" nimitta
    , Claim.relation "asraya" (Node.ent nimitta) (Node.ent dravya) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The manifestables themselves—smells—are the illuminating condition for similar things perceived.'
   Why rejected: Confuses the manifestable (gandha, sort=manifestation) with the manifestor (nimitta, sort=power). The commentary explicitly identifies the nimitta as the crushing or burning, not the smell itself. This sort error makes the prakāśaka relation unlicensed. -/
def gandha_nimitta : Entity := ⟨"gandha", Sorta.power⟩
def manifestable_as_nimitta : Reading :=
  { claims := [ Claim.relation "prakasaka" (Node.ent gandha_nimitta) (Node.ent gandha) ] }
theorem manifestable_as_nimitta_inadequate : ¬ contract.Adequate manifestable_as_nimitta := by decide
#guard contract.licenses manifestable_as_nimitta = false
theorem manifestable_as_nimitta_sort_error : gandha_nimitta ≠ gandha := by decide

/- 'The same instrumental cause (crushing) produces the scent in all sandals indifferently.'
   Why rejected: Asserts that nimitta is universal/non-specific, which contradicts the pratidravyavasthita property: it must be lodged substance by substance. The axioms require asraya (ground) to each dravya individually. -/
def nimitta_univ : Entity := ⟨"nimitta", Sorta.power⟩
def nimitta_universal : Reading :=
  { claims := [ Claim.predication "visva" nimitta_univ ] }
theorem nimitta_universal_inadequate : ¬ contract.Adequate nimitta_universal := by decide
#guard contract.licenses nimitta_universal = false

/- 'The dedicated sound-pattern for each word is what constitutes that word.'
   Why rejected: The commentary explicitly rejects this: 'the dedication is no argument that the pattern constitutes the word.' The relation is manifestation (prakāśaka), not constitution or composition. The word is not made of the sound. -/
def pattern_constitutes_word : Reading :=
  { claims := [ Claim.predication "constitutes" svara ] }
theorem pattern_constitutes_word_inadequate : ¬ contract.Adequate pattern_constitutes_word := by decide
#guard contract.contradicts pattern_constitutes_word = true

end Counterexamples

end VakyaVallari.Verses.V1_98
