/- Verse 1.37 — generated from data/contracts/1.37.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_37

open VakyaVallari

def prakasa : Entity := ⟨"prakāśa", Sorta.power⟩
def jnana_atita_anagata : Entity := ⟨"atīta-anāgata-jñāna", Sorta.cognition⟩
def pratyaksa : Entity := ⟨"pratyakṣa", Sorta.cognition⟩
def anumana : Entity := ⟨"anumāna", Sorta.cognition⟩
def aparoksa : Entity := ⟨"aparokṣa", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.predication "aparoksa" jnana_atita_anagata
    , Claim.predication "aparoksa" pratyaksa
    , Claim.relation "na_visisyate" (Node.ent jnana_atita_anagata) (Node.ent pratyaksa) ]
  , denials := [ Claim.relation "bhavati" (Node.ent jnana_atita_anagata) (Node.ent anumana) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "na_visisyate" (Node.ent jnana_atita_anagata) (Node.ent pratyaksa) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Knowledge of the past and future is a form of especially refined or powerful inference.'
   Why rejected: The commentary explicitly states 'it is that it is NOT inference at all'. This reading misplaces the knowledge within the anumana category when the verse's core move is to declare it is NOT inference at all but rather perception. The denial axiom directly contradicts this rendering. -/
def superior_inference_mode : Reading :=
  { claims := [ Claim.relation "bhavati" (Node.ent jnana_atita_anagata) (Node.ent anumana) ] }
theorem superior_inference_mode_inadequate : ¬ contract.Adequate superior_inference_mode := by decide
#guard contract.contradicts superior_inference_mode = true

/- 'Knowledge of the past and future is still a mediated mental process, just using yogic methods rather than standard reasoning.'
   Why rejected: This contradicts the core axiom that jnana_atita_anagata has the property aparoksa (immediacy). The commentary emphasizes it 'has perception's immediacy', which means it is non-mediated. Treating it as mediated (saroksa) directly violates the defining property that makes it perception-like. -/
def saroksa : Entity := ⟨"sarokṣa", Sorta.property⟩
def mediated_process : Reading :=
  { claims := [ Claim.predication "saroksa" jnana_atita_anagata ] }
theorem mediated_process_inadequate : ¬ contract.Adequate mediated_process := by decide
#guard contract.licenses mediated_process = false

end Counterexamples

end VakyaVallari.Verses.V1_37
