/- Verse 1.42 — generated from data/contracts/1.42.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_42

open VakyaVallari

def anumana : Entity := ⟨"anumāna", Sorta.power⟩
def pratyaksha : Entity := ⟨"pratyakṣa", Sorta.power⟩
def vinipata : Entity := ⟨"vinipāta", Sorta.manifestation⟩
def sarana_jnana : Entity := ⟨"saraṇa-jñāna", Sorta.cognition⟩
def visama_pathi : Entity := ⟨"viṣame pathi", Sorta.property⟩
def drava : Entity := ⟨"dhāvatā", Sorta.property⟩
def sukshma_jnana : Entity := ⟨"sūkṣma-jñāna", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.predication "pramana" anumana
    , Claim.predication "pramana" pratyaksha
    , Claim.relation "asraya" (Node.ent vinipata) (Node.ent visama_pathi)
    , Claim.relation "asraya" (Node.ent vinipata) (Node.ent drava)
    , Claim.predication "serial_slow" anumana
    , Claim.predication "na_durlabha" vinipata ]
  , denials := [ Claim.predication "pramana" vinipata
    , Claim.relation "vivartate" (Node.ent anumana) (Node.ent vinipata) ] }

def accepted : Reading :=
  { claims := [ Claim.predication "pramana" anumana
    , Claim.relation "asraya" (Node.ent vinipata) (Node.ent visama_pathi)
    , Claim.relation "asraya" (Node.ent vinipata) (Node.ent drava)
    , Claim.predication "na_durlabha" vinipata ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Inference is not a valid means of knowledge and should be completely rejected.'
   Why rejected: The commentary explicitly states 'touch is a genuine pramana, as inference is', establishing anumana's legitimacy. Treating it as an invalid pramana contradicts the axiom that establishes anumana as a power. -/
def anumana_invalid : Entity := ⟨"anumāna", Sorta.property⟩
def anumana_not_pramana : Reading :=
  { claims := [ Claim.predication "pramana" anumana_invalid ] }
theorem anumana_not_pramana_inadequate : ¬ contract.Adequate anumana_not_pramana := by decide
#guard contract.licenses anumana_not_pramana = false
theorem anumana_not_pramana_sort_error : anumana_invalid ≠ anumana := by decide

/- 'Inference necessarily and always produces headlong falls.'
   Why rejected: The verse's conditional structure (combination of rough ground AND speed) contradicts a universal claim of failure. The commentary says 'on even ground, walking slowly, it suffices', showing anumana succeeds in favorable circumstances. -/
def anumana_always_fails : Reading :=
  { claims := [ Claim.relation "vivartate" (Node.ent anumana) (Node.ent vinipata) ] }
theorem anumana_always_fails_inadequate : ¬ contract.Adequate anumana_always_fails := by decide
#guard contract.contradicts anumana_always_fails = true

/- 'Direct perception fails on difficult terrain, just as inference does.'
   Why rejected: The verse isolates anumana's failure; touch/perception is introduced as a genuine pramana that succeeds. The commentary emphasizes that the problem is anumana's serial nature combined with rough terrain, not rough terrain itself. -/
def pratyaksha_fails_on_rough_ground : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent vinipata) (Node.ent pratyaksha) ] }
theorem pratyaksha_fails_on_rough_ground_inadequate : ¬ contract.Adequate pratyaksha_fails_on_rough_ground := by decide
#guard contract.licenses pratyaksha_fails_on_rough_ground = false

end Counterexamples

end VakyaVallari.Verses.V1_42
