/- Verse 1.37 — generated from data/contracts/1.37.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_37

open VakyaVallari

def prakasa : Entity := ⟨"prakāśa", Sorta.power⟩
def anupapluta_cetas : Entity := ⟨"anupapluta-cetas", Sorta.property⟩
def jnana_atita_anagata : Entity := ⟨"atīta-anāgata-jñāna", Sorta.cognition⟩
def pratyaksa : Entity := ⟨"pratyakṣa", Sorta.cognition⟩
def anumana : Entity := ⟨"anumāna", Sorta.cognition⟩
def aparoksa : Entity := ⟨"aparokṣa", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.relation "nimitta" (Node.ent prakasa) (Node.ent jnana_atita_anagata)
    , Claim.relation "nimitta" (Node.ent anupapluta_cetas) (Node.ent jnana_atita_anagata)
    , Claim.predication "aparoksa" jnana_atita_anagata
    , Claim.predication "aparoksa" pratyaksa
    , Claim.relation "na_visisyate" (Node.ent jnana_atita_anagata) (Node.ent pratyaksa) ]
  , denials := [ Claim.relation "bhavati" (Node.ent jnana_atita_anagata) (Node.ent anumana) ]
  , reported := [] }

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

/- 'The knowledge of past and future arises spontaneously without requirement of a manifest inner light or clear mind; these circumstances are merely contexts, not conditions.'
   Why rejected: The commentary explicitly states 'Two conditions are named: avirbhuta-prakasa, an inner light that has become manifest, and anupapluta-cetas, a mind not flooded or disturbed. Where they are met, knowledge of atita and anagata is pratyaksat na visisyate'. By establishing prakasa and anupapluta_cetas as nimitta (occasions/necessary conditions) for jnana_atita_anagata, the axioms license only qualified cognition, not spontaneous cognition independent of these prerequisites. A reading that denies the necessity of these named conditions contradicts the core semantic structure of the verse. -/
def svayabhava : Entity := ⟨"svayabhāva", Sorta.property⟩
def conditions_unnecessary : Reading :=
  { claims := [ Claim.predication "svayabhava" jnana_atita_anagata ] }
theorem conditions_unnecessary_inadequate : ¬ contract.Adequate conditions_unnecessary := by decide
#guard contract.licenses conditions_unnecessary = false

end Counterexamples

end VakyaVallari.Verses.V1_37
