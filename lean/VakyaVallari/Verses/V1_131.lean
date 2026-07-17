/- Verse 1.131 — generated from data/contracts/1.131.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_131

open VakyaVallari

def sabda_samskara : Entity := ⟨"śabdasaṃskāra", Sorta.linguisticItem⟩
def siddhih : Entity := ⟨"siddhiḥ", Sorta.manifestation⟩
def paramatman : Entity := ⟨"paramātman", Sorta.absolute⟩
def pravrtti_tattva : Entity := ⟨"pravṛttitattva", Sorta.power⟩
def pravrtti_tattva_jna : Entity := ⟨"pravṛttitattvajna", Sorta.cognition⟩
def brahma_amrta : Entity := ⟨"brahma-amṛta", Sorta.absolute⟩

def contract : Contract :=
  { axioms := [ Claim.identity sabda_samskara siddhih
    , Claim.relation "is-attainment-of" (Node.ent siddhih) (Node.ent paramatman)
    , Claim.predication "functioning-principle" pravrtti_tattva
    , Claim.relation "asnute" (Node.ent pravrtti_tattva_jna) (Node.ent brahma_amrta) ]
  , denials := [ Claim.relation "asnute" (Node.ent sabda_samskara) (Node.ent brahma_amrta) ] }

def accepted : Reading :=
  { claims := [ Claim.identity sabda_samskara siddhih
    , Claim.relation "is-attainment-of" (Node.ent siddhih) (Node.ent paramatman)
    , Claim.predication "functioning-principle" pravrtti_tattva
    , Claim.relation "asnute" (Node.ent pravrtti_tattva_jna) (Node.ent brahma_amrta) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Those who master the technical rules of grammar automatically attain the supreme self.'
   Why rejected: Reduces sabda-samskara to mechanical linguistic skill rather than the deeper principle (pravrtti-tattva) of the word's functioning. The verse requires active knowledge (tattva-jna) of the principle, not mere grammatical competence. Also treats attainment as automatic rather than as realization. -/
def sabda_samskara_technical : Entity := ⟨"śabdasaṃskāra", Sorta.property⟩
def mechanical_grammar : Reading :=
  { claims := [ Claim.predication "technical-rules" sabda_samskara_technical
    , Claim.relation "achieves" (Node.ent sabda_samskara_technical) (Node.ent paramatman) ] }
theorem mechanical_grammar_inadequate : ¬ contract.Adequate mechanical_grammar := by decide
#guard contract.licenses mechanical_grammar = false
theorem mechanical_grammar_sort_error : sabda_samskara_technical ≠ sabda_samskara := by decide

/- 'Grammar practitioners enjoy the deathless Brahman through their practice alone.'
   Why rejected: The verse explicitly conditions enjoyment on knowing the principle (pravrtti-tattva-jna), not on practice or technical skill. The commentary stresses this is knowledge of 'the principle of the word's functioning, its descent and return,' which is a cognitive and metaphysical realization, not mechanical application. This reading drops the knowledge requirement (tattva-jna) and falsely attributes the enjoyment (asnute) to the practice itself rather than to the knower. -/
def skip_the_principle : Reading :=
  { claims := [ Claim.relation "asnute" (Node.ent sabda_samskara) (Node.ent brahma_amrta) ] }
theorem skip_the_principle_inadequate : ¬ contract.Adequate skip_the_principle := by decide
#guard contract.contradicts skip_the_principle = true

/- 'The perfecting of language is the attainment of the supreme self, separate from the deathless Brahman which is enjoyed as a different goal.'
   Why rejected: Treats paramatman (supreme self) and brahma-amrta (deathless Brahman) as distinct end-goals rather than the same realization. The commentary frames them as continuous: attainment of the supreme self via word-perfecting and the enjoyment of brahma-amrta are manifestations of a single realization, tasted differently (recalling 'paramo rasa' of 1.12). The principle of functioning bridges them as a unified path. -/
def paramatman_vs_brahma : Reading :=
  { claims := [ Claim.relation "is-separate-from" (Node.ent paramatman) (Node.ent brahma_amrta) ] }
theorem paramatman_vs_brahma_inadequate : ¬ contract.Adequate paramatman_vs_brahma := by decide
#guard contract.licenses paramatman_vs_brahma = false

end Counterexamples

end VakyaVallari.Verses.V1_131
