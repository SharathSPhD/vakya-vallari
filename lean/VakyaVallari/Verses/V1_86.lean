/- Verse 1.86 — generated from data/contracts/1.86.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_86

open VakyaVallari

def jnana : Entity := ⟨"jñāna", Sorta.cognition⟩
def bheda : Entity := ⟨"bheda", Sorta.manifestation⟩
def vak : Entity := ⟨"vāk", Sorta.manifestation⟩
def upaplava : Entity := ⟨"upaplava", Sorta.property⟩
def krama : Entity := ⟨"krama", Sorta.property⟩
def sphota : Entity := ⟨"sphota", Sorta.linguisticItem⟩
def sabdatattva : Entity := ⟨"śabdatattva", Sorta.absolute⟩
def jneya : Entity := ⟨"jñeya", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.identity sphota sabdatattva
    , Claim.relation "anukaroti" (Node.ent jnana) (Node.ent bheda)
    , Claim.predication "upaplava" vak
    , Claim.predication "dhruvam" upaplava
    , Claim.predication "kramopasrsta" vak
    , Claim.relation "asraya" (Node.ent jnana) (Node.ent jneya) ]
  , denials := [ Claim.predication "anutthanna" vak
    , Claim.predication "anutthanna" jnana ] }

def accepted : Reading :=
  { claims := [ Claim.relation "anukaroti" (Node.ent jnana) (Node.ent bheda)
    , Claim.predication "upaplava" vak
    , Claim.predication "kramopasrsta" vak
    , Claim.relation "asraya" (Node.ent jnana) (Node.ent jneya) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Speech can appear in its pure undivided form, free from the contamination of sequence.'
   Why rejected: Directly contradicts the verse's assertion that vak suffers upaplava constantly (dhruvam) and never appears except when contaminated by krama-upasrsta. The commentary explicitly denies that speech can present its true undivided face. -/
def uncontaminated_speech : Reading :=
  { claims := [ Claim.predication "anutthanna" vak ] }
theorem uncontaminated_speech_inadequate : ¬ contract.Adequate uncontaminated_speech := by decide
#guard contract.contradicts uncontaminated_speech = true

/- 'In ordinary transaction, cognition presents its true undivided nature without imitating differentiation.'
   Why rejected: Directly violates the verse's core doctrine that jnana perpetually imitates (anukaroti) bheda. The commentary states that neither cognition nor speech 'ever presents its true face in ordinary transaction', ruling out the possibility of unmediated presentation. -/
def undistorted_cognition : Reading :=
  { claims := [ Claim.predication "anutthanna" jnana ] }
theorem undistorted_cognition_inadequate : ¬ contract.Adequate undistorted_cognition := by decide
#guard contract.contradicts undistorted_cognition = true

/- 'Cognition is self-sufficient and does not depend upon objects for its operation.'
   Why rejected: Violates the explicit claim that jnana is jneya-vyapasraya — cognition rests upon its objects. The mimicry of differentiation occurs precisely because cognition must conform to the structure of what it grasps. -/
def cognition_independent : Reading :=
  { claims := [ Claim.relation "nirasraya" (Node.ent jnana) (Node.ent jneya) ] }
theorem cognition_independent_inadequate : ¬ contract.Adequate cognition_independent := by decide
#guard contract.licenses cognition_independent = false

end Counterexamples

end VakyaVallari.Verses.V1_86
