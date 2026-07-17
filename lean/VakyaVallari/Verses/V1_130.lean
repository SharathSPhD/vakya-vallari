/- Verse 1.130 — generated from data/contracts/1.130.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_130

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.absolute⟩
def brahman : Entity := ⟨"brahman", Sorta.absolute⟩
def sabdantar : Entity := ⟨"śabdāntar", Sorta.manifestation⟩
def atman : Entity := ⟨"ātman", Sorta.absolute⟩
def maharsabha : Entity := ⟨"mahāṛṣabha", Sorta.property⟩
def sayujya : Entity := ⟨"sāyujya", Sorta.power⟩
def audita : Entity := ⟨"audita", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.identity sabda brahman
    , Claim.relation "vivartate" (Node.ent sabda) (Node.ent sabdantar)
    , Claim.relation "asraya" (Node.ent atman) (Node.ent sabdantar)
    , Claim.predication "maharsabha" sabdantar
    , Claim.predication "isyate" sayujya ]
  , denials := [ Claim.identity sabdantar audita ] }

def accepted : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent atman) (Node.ent sabdantar)
    , Claim.predication "maharsabha" sabdantar
    , Claim.predication "isyate" sayujya ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The audible fourth part of speech standing within the speaker is declared to be the great bull.'
   Why rejected: The commentary explicitly contrasts the inner word (sabdantar) with the audible fourth part: 'not the audible fourth part but the inner totality of speech'. This reading violates that essential ontological distinction and confuses two different levels of the word. -/
def audita : Entity := ⟨"audita", Sorta.property⟩
def audible_word_confusion : Reading :=
  { claims := [ Claim.identity sabdantar audita ] }
theorem audible_word_confusion_inadequate : ¬ contract.Adequate audible_word_confusion := by decide
#guard contract.contradicts audible_word_confusion = true

/- 'Union with an external deity is what is sought.'
   Why rejected: The commentary states the goal is 'union with language at its own root', not with a transcendent deity outside language. This reading misplaces the soteriological object and misunderstands the non-dualistic character of the soteriology. -/
def devata : Entity := ⟨"devatā", Sorta.absolute⟩
def external_deity_goal : Reading :=
  { claims := [ Claim.relation "sayujya_with" (Node.ent sayujya) (Node.ent devata) ] }
theorem external_deity_goal_inadequate : ¬ contract.Adequate external_deity_goal := by decide
#guard contract.licenses external_deity_goal = false

end Counterexamples

end VakyaVallari.Verses.V1_130
