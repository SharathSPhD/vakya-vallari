/- Verse 1.24-26 — generated from data/contracts/1.24-26.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_24_26

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def padartha : Entity := ⟨"padartha", Sorta.linguisticItem⟩
def anvakhyeya : Entity := ⟨"anvākhyeya", Sorta.linguisticItem⟩
def pratipadaka : Entity := ⟨"pratipadaka", Sorta.linguisticItem⟩
def sambandha : Entity := ⟨"saṃbandha", Sorta.property⟩
def dharma : Entity := ⟨"dharma", Sorta.absolute⟩
def pratyaya : Entity := ⟨"pratyaya", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.predication "apoddhāra" sabda
    , Claim.predication "sthita-lakṣaṇa" padartha
    , Claim.relation "vyakhyāyate" (Node.ent pratipadaka) (Node.ent anvakhyeya)
    , Claim.predication "kāryakāraṇa-bhāva" sambandha
    , Claim.predication "yogya-bhāva" sambandha ]
  , denials := [ Claim.predication "sarva-upavarnita" padartha ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "apoddhāra" sabda
    , Claim.predication "sthita-lakṣaṇa" padartha
    , Claim.relation "vyakhyāyate" (Node.ent pratipadaka) (Node.ent anvakhyeya)
    , Claim.predication "kāryakāraṇa-bhāva" sambandha
    , Claim.predication "yogya-bhāva" sambandha ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Words are primitive linguistic units from which sentences are built.'
   Why rejected: Contradicts the presupposed apoddhara doctrine: the verse grounds itself in the principle that words are extracted from the sentence by analysis, not given as natural prior units. The sentence is the real linguistic whole. -/
def word_as_primitive : Reading :=
  { claims := [ Claim.predication "prakṛta" sabda ] }
theorem word_as_primitive_inadequate : ¬ contract.Adequate word_as_primitive := by decide
#guard contract.licenses word_as_primitive = false

/- 'This science transmits every true matter concerning meanings and relations.'
   Why rejected: The final clause of the verse explicitly denies this: only some matters are transmitted according to tradition, not all. The discipline is selective. -/
def comprehensive_transmission : Reading :=
  { claims := [ Claim.predication "sarva-upavarnita" padartha ] }
theorem comprehensive_transmission_inadequate : ¬ contract.Adequate comprehensive_transmission := by decide
#guard contract.contradicts comprehensive_transmission = true

end Counterexamples

end VakyaVallari.Verses.V1_24_26
