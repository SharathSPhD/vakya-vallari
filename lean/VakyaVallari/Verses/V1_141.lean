/- Verse 1.141 — generated from data/contracts/1.141.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_141

open VakyaVallari

def vyakarana_smrti : Entity := ⟨"vyākaraṇasmṛti", Sorta.linguisticItem⟩
def sadhutva_jnana : Entity := ⟨"sādhutvajñāna", Sorta.cognition⟩
def sistas : Entity := ⟨"śiṣṭa", Sorta.power⟩
def smrti : Entity := ⟨"smṛti", Sorta.linguisticItem⟩
def sadhutva : Entity := ⟨"sādhutva", Sorta.property⟩
def sruti : Entity := ⟨"śruti", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.identity vyakarana_smrti smrti
    , Claim.relation "visaya" (Node.ent vyakarana_smrti) (Node.ent sadhutva_jnana)
    , Claim.relation "nibandhana" (Node.ent vyakarana_smrti) (Node.ent sistas)
    , Claim.predication "dharma_bearing" sadhutva
    , Claim.predication "avicchinna" sistas ]
  , denials := [ Claim.identity vyakarana_smrti sruti ] }

def accepted : Reading :=
  { claims := [ Claim.relation "visaya" (Node.ent vyakarana_smrti) (Node.ent sadhutva_jnana)
    , Claim.relation "nibandhana" (Node.ent vyakarana_smrti) (Node.ent sistas) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The grammatical tradition studies the meaning conveyed by correct forms.'
   Why rejected: The verse specifies the object is knowledge of correctness (sadhutva-jnana), not meaning. The commentary emphasizes that corrupt forms convey meaning equally (1.27), so meaning cannot be what uniquely defines grammar. This misinterprets the visaya (object/domain) of the tradition. -/
def artha_jnana : Entity := ⟨"arthajñāna", Sorta.cognition⟩
def meaning_conflation : Reading :=
  { claims := [ Claim.relation "visaya" (Node.ent vyakarana_smrti) (Node.ent artha_jnana) ] }
theorem meaning_conflation_inadequate : ¬ contract.Adequate meaning_conflation := by decide
#guard contract.licenses meaning_conflation = false

/- 'Grammar is a revealed tradition (sruti) directly communicated by the gods.'
   Why rejected: The commentary explicitly distinguishes grammar as a smrti (remembrance-tradition) from sruti (revealed tradition). Grammar is derivative of the Veda through secondary markers (lingas), not revealed directly. This reverses the established classification of grammar's epistemic status. -/
def sruti : Entity := ⟨"śruti", Sorta.linguisticItem⟩
def sruti_confusion : Reading :=
  { claims := [ Claim.identity vyakarana_smrti sruti ] }
theorem sruti_confusion_inadequate : ¬ contract.Adequate sruti_confusion := by decide
#guard contract.contradicts sruti_confusion = true

end Counterexamples

end VakyaVallari.Verses.V1_141
