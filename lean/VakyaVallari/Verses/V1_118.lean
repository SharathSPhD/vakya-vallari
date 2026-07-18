/- Verse 1.118 — generated from data/contracts/1.118.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_118

open VakyaVallari

def sakti : Entity := ⟨"śakti", Sorta.power⟩
def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def visva : Entity := ⟨"viśva", Sorta.manifestation⟩
def atman : Entity := ⟨"ātman", Sorta.absolute⟩
def pratibha : Entity := ⟨"pratibha", Sorta.cognition⟩
def bheda : Entity := ⟨"bheda", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asrita" (Node.ent sakti) (Node.ent sabda)
    , Claim.predication "nibandhani" sakti
    , Claim.predication "svarupa" atman
    , Claim.relation "netra" (Node.ent atman) (Node.ent sakti)
    , Claim.predication "bheda-rupa" atman ]
  , denials := [ Claim.predication "bheda" atman ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "asrita" (Node.ent sakti) (Node.ent sabda)
    , Claim.predication "nibandhani" sakti
    , Claim.relation "netra" (Node.ent atman) (Node.ent sakti)
    , Claim.predication "bheda-rupa" atman ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The self is truly divided into many forms; difference is its real nature.'
   Why rejected: The commentary explicitly states the seer is undivided (akhaṇḍa) and only *appears* divided because its differentiating instrument (the word-power) colours its perception. Making bheda an actual property of ātman contradicts the vivarta structure where multiplicity arises from the lens, not from the subject. -/
def atman_truly_divided : Reading :=
  { claims := [ Claim.predication "bheda" atman ] }
theorem atman_truly_divided_inadequate : ¬ contract.Adequate atman_truly_divided := by decide
#guard contract.contradicts atman_truly_divided = true

/- 'The word-power stands apart from the self and independently generates the appearance of the universe.'
   Why rejected: Severs the constitutive unity in 'whose eye is that power': the commentary emphasizes that the power IS the self's very organ of self-perception, not an external force. The atman perceives *through* the word-power as its instrument (netra); they are inseparable in the perceptual act. -/
def sakti_without_instrument_role : Reading :=
  { claims := [ Claim.relation "svatantra" (Node.ent sakti) (Node.ent visva) ] }
theorem sakti_without_instrument_role_inadequate : ¬ contract.Adequate sakti_without_instrument_role := by decide
#guard contract.licenses sakti_without_instrument_role = false

/- "The atman actually transforms (parinama) into the differentiated world through the word-power's action."
   Why rejected: The verse's metaphor of the eye colouring the seen denies real transformation. The atman remains undivided; the appearance of difference is an artefact of the perceptual instrument (word-power), not a real change in the ātman's substance. -/
def parinama_appearance : Reading :=
  { claims := [ Claim.relation "parinamate" (Node.ent atman) (Node.ent visva) ] }
theorem parinama_appearance_inadequate : ¬ contract.Adequate parinama_appearance := by decide
#guard contract.licenses parinama_appearance = false

end Counterexamples

end VakyaVallari.Verses.V1_118
