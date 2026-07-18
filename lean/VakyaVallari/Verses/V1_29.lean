/- Verse 1.29 — generated from data/contracts/1.29.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_29

open VakyaVallari

def vyavastha : Entity := ⟨"vyavastha", Sorta.manifestation⟩
def artha : Entity := ⟨"artha", Sorta.absolute⟩
def smrti : Entity := ⟨"smṛti", Sorta.linguisticItem⟩
def sadhutva : Entity := ⟨"sādhutva", Sorta.property⟩
def dharma : Entity := ⟨"dharma", Sorta.absolute⟩
def vyavahara : Entity := ⟨"vyavahāra", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "āśrayate" (Node.ent vyavastha) (Node.ent artha)
    , Claim.relation "sampad" (Node.ent smrti) (Node.ent artha)
    , Claim.identity artha dharma ]
  , denials := [ Claim.identity artha vyavahara ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "āśrayate" (Node.ent vyavastha) (Node.ent artha)
    , Claim.relation "sampad" (Node.ent smrti) (Node.ent artha) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The tradition concerning correctness could be purposeless if properly established.'
   Why rejected: Reverses the causal principle: the verse establishes that IF something is codified, it MUST have purpose. To say smṛti could be anarthika contradicts the logical framework the verse uses—the fact of its composition by the cultivated entails it must serve an artha. -/
def anarthika_tradition : Reading :=
  { claims := [ Claim.predication "anarthika" smrti ] }
theorem anarthika_tradition_inadequate : ¬ contract.Adequate anarthika_tradition := by decide
#guard contract.licenses anarthika_tradition = false

/- 'The tradition of correctness serves the purpose of enabling communication.'
   Why rejected: The commentary explicitly rules this out: 'that purpose is dharma rather than communication'. The artha of smṛti is dharma (righteous behavior/linguistic purity in conduct), not mere vyavahāra (communicative function). This reading confuses the vehicle (language) with the destination (dharma). -/
def vyavahara : Entity := ⟨"vyavahāra", Sorta.manifestation⟩
def communication_purpose : Reading :=
  { claims := [ Claim.identity artha vyavahara ] }
theorem communication_purpose_inadequate : ¬ contract.Adequate communication_purpose := by decide
#guard contract.contradicts communication_purpose = true

end Counterexamples

end VakyaVallari.Verses.V1_29
