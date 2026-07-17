/- Verse 1.121 — generated from data/contracts/1.121.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_121

open VakyaVallari

def itikartavyata : Entity := ⟨"itikartavyatā", Sorta.power⟩
def sabda : Entity := ⟨"śabda", Sorta.absolute⟩
def samskara : Entity := ⟨"saṃskāra", Sorta.manifestation⟩
def bala : Entity := ⟨"bāla", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.relation "vyapasrita" (Node.ent itikartavyata) (Node.ent sabda)
    , Claim.relation "pratipadyate" (Node.ent bala) (Node.ent samskara)
    , Claim.predication "sabdamula" samskara ]
  , denials := [ Claim.predication "anindriya" itikartavyata ] }

def accepted : Reading :=
  { claims := [ Claim.relation "vyapasrita" (Node.ent itikartavyata) (Node.ent sabda)
    , Claim.relation "pratipadyate" (Node.ent bala) (Node.ent samskara)
    , Claim.predication "sabdamula" samskara ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- "The child's purposive behavior before language-acquisition demonstrates knowledge independent of word."
   Why rejected: Treats pre-linguistic infant competence as a counterexample to word-dependence, ignoring that Bhartrhari dissolves this by grounding infant know-how in samskara—word-formed traces operating below conscious speech. This reading denies the sabdamula predication, cutting the explanatory link. -/
def word_free_infant : Reading :=
  { claims := [ Claim.predication "anindriya" itikartavyata ] }
theorem word_free_infant_inadequate : ¬ contract.Adequate word_free_infant := by decide
#guard contract.contradicts word_free_infant = true

/- 'The child carries innate procedural capacities that are not themselves linguistic in nature.'
   Why rejected: Acknowledges the empirical fact (pre-linguistic competence) but rejects the commentary's resolution: that samskara are word-formed. This reduces samskara to mere neurological residue, stripping the sabdamula predication and leaving the axiom unsupported. -/
def samskara_nonlinguistic : Entity := ⟨"saṃskāra", Sorta.property⟩
def empirical_nativism : Reading :=
  { claims := [ Claim.relation "pratipadyate" (Node.ent bala) (Node.ent samskara_nonlinguistic) ] }
theorem empirical_nativism_inadequate : ¬ contract.Adequate empirical_nativism := by decide
#guard contract.licenses empirical_nativism = false
theorem empirical_nativism_sort_error : samskara_nonlinguistic ≠ samskara := by decide

end Counterexamples

end VakyaVallari.Verses.V1_121
