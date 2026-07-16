/- Verse 1.9 — generated from data/contracts/1.9.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_9

open VakyaVallari

def vidya : Entity := ⟨"vidyā", Sorta.absolute⟩
def satya_visuddhi : Entity := ⟨"satyā viśuddhi", Sorta.manifestation⟩
def aksara : Entity := ⟨"akṣara", Sorta.absolute⟩
def pranava : Entity := ⟨"praṇava", Sorta.absolute⟩
def vada : Entity := ⟨"vāda", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.identity satya_visuddhi vidya
    , Claim.identity aksara pranava
    , Claim.relation "sadhana" (Node.ent aksara) (Node.ent vidya)
    , Claim.predication "na_virodhi_vada" vidya
    , Claim.relation "asraya" (Node.ent pranava) (Node.ent vada) ]
  , denials := [ Claim.relation "asraya" (Node.ent vada) (Node.ent vada) ] }

def accepted : Reading :=
  { claims := [ Claim.identity satya_visuddhi vidya
    , Claim.relation "sadhana" (Node.ent aksara) (Node.ent vidya)
    , Claim.predication "na_virodhi_vada" vidya ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Knowledge as a mental cognition is the path to purification through the sacred syllable Om.'
   Why rejected: Demotes vidya from the absolute presented in the verse (true purification itself) to a mere cognition, losing the ontological identity. The sort error (cognition vs absolute) breaks the identity claim with satya-visuddhi. -/
def vidya_cognition : Entity := ⟨"vidyā", Sorta.cognition⟩
def vidya_as_cognition : Reading :=
  { claims := [ Claim.identity satya_visuddhi vidya_cognition ] }
theorem vidya_as_cognition_inadequate : ¬ contract.Adequate vidya_as_cognition := by decide
#guard contract.licenses vidya_as_cognition = false
theorem vidya_as_cognition_sort_error : vidya_cognition ≠ vidya := by decide

/- 'The sacred syllable Om is a linguistic tool that makes different doctrines compatible with each other.'
   Why rejected: Reduces pranava to a mere linguistic property or accommodating tool, missing the commentary's key claim that Om contradicts no doctrine BECAUSE it is the base underneath all systems. Being a base is ontologically different from being a tool. -/
def pranava_device : Entity := ⟨"praṇava", Sorta.linguisticItem⟩
def pranava_as_linguistic_device : Reading :=
  { claims := [ Claim.identity aksara pranava_device ] }
theorem pranava_as_linguistic_device_inadequate : ¬ contract.Adequate pranava_as_linguistic_device := by decide
#guard contract.licenses pranava_as_linguistic_device = false
theorem pranava_as_linguistic_device_sort_error : pranava_device ≠ pranava := by decide

/- 'Each philosophical doctrine has its own foundation and the syllable Om merely echoes truths found in each.'
   Why rejected: Contradicts the relation asraya (pranava as the single base). The commentary states rival doctrines contradict because each is built on a partial base, but Om is THE base—not a derivative harmony. -/
def doktrines_independently_founded : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent vada) (Node.ent vada) ] }
theorem doktrines_independently_founded_inadequate : ¬ contract.Adequate doktrines_independently_founded := by decide
#guard contract.contradicts doktrines_independently_founded = true

end Counterexamples

end VakyaVallari.Verses.V1_9
