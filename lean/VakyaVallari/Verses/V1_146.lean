/- Verse 1.146 — generated from data/contracts/1.146.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_146

open VakyaVallari

def mala : Entity := ⟨"mala", Sorta.property⟩
def kaya : Entity := ⟨"kāya", Sorta.manifestation⟩
def vac : Entity := ⟨"vāc", Sorta.absolute⟩
def buddhi : Entity := ⟨"buddhi", Sorta.cognition⟩
def cikitsa : Entity := ⟨"cikitsā", Sorta.absolute⟩
def laksana : Entity := ⟨"lakṣaṇa", Sorta.absolute⟩
def adhyatmasastra : Entity := ⟨"adhyātmaśāstra", Sorta.absolute⟩

def contract : Contract :=
  { axioms := [ Claim.relation "avastitah" (Node.ent mala) (Node.ent kaya)
    , Claim.relation "avastitah" (Node.ent mala) (Node.ent vac)
    , Claim.relation "avastitah" (Node.ent mala) (Node.ent buddhi)
    , Claim.relation "viśuddhi" (Node.ent cikitsa) (Node.ent kaya)
    , Claim.relation "viśuddhi" (Node.ent laksana) (Node.ent vac)
    , Claim.relation "viśuddhi" (Node.ent adhyatmasastra) (Node.ent buddhi)
    , Claim.relation "madhya" (Node.ent vac) (Node.ent kaya)
    , Claim.relation "madhya" (Node.ent vac) (Node.ent buddhi) ]
  , denials := [ Claim.relation "upamana" (Node.ent laksana) (Node.ent cikitsa) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "avastitah" (Node.ent mala) (Node.ent kaya)
    , Claim.relation "avastitah" (Node.ent mala) (Node.ent vac)
    , Claim.relation "avastitah" (Node.ent mala) (Node.ent buddhi)
    , Claim.relation "viśuddhi" (Node.ent cikitsa) (Node.ent kaya)
    , Claim.relation "viśuddhi" (Node.ent laksana) (Node.ent vac)
    , Claim.relation "viśuddhi" (Node.ent adhyatmasastra) (Node.ent buddhi) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Medicine serves as the therapeutic science for purifying the faults of speech.'
   Why rejected: The commentary assigns each science to its proper domain: medicine for body, grammar for speech, and metaphysics for mind. This reading misassigns medicine to speech, violating the categorical structure that makes the system work. -/
def medicine_on_speech : Reading :=
  { claims := [ Claim.relation "viśuddhi" (Node.ent cikitsa) (Node.ent vac) ] }
theorem medicine_on_speech_inadequate : ¬ contract.Adequate medicine_on_speech := by decide
#guard contract.licenses medicine_on_speech = false

/- 'The body stands between speech and the mind as the intermediary channel of the therapeutic system.'
   Why rejected: The commentary explicitly states that 'speech stands between body and spirit as the hinge-channel'. This reading reverses the structural ordering, placing body in the mediating position that the text assigns only to speech. -/
def reversed_hinge : Reading :=
  { claims := [ Claim.relation "madhya" (Node.ent kaya) (Node.ent vac) ] }
theorem reversed_hinge_inadequate : ¬ contract.Adequate reversed_hinge := by decide
#guard contract.licenses reversed_hinge = false

/- 'Grammar functions as an analogy or metaphor for how medicine purifies the body, but operates through a fundamentally different principle.'
   Why rejected: The commentary rejects the analogical reading: 'grammar is not *like* medicine; it occupies the middle seat in a single therapeutic system'. This reading treats the system as merely metaphorical rather than as a unified ontological structure. -/
def grammar_as_analogy : Reading :=
  { claims := [ Claim.relation "upamana" (Node.ent laksana) (Node.ent cikitsa) ] }
theorem grammar_as_analogy_inadequate : ¬ contract.Adequate grammar_as_analogy := by decide
#guard contract.contradicts grammar_as_analogy = true

end Counterexamples

end VakyaVallari.Verses.V1_146
