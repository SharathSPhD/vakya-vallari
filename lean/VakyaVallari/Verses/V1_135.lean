/- Verse 1.135 — generated from data/contracts/1.135.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_135

open VakyaVallari

def tarka : Entity := ⟨"tarka", Sorta.power⟩
def veda : Entity := ⟨"veda", Sorta.linguisticItem⟩
def sastra : Entity := ⟨"sastra", Sorta.linguisticItem⟩
def vakyartha : Entity := ⟨"vākyārtha", Sorta.linguisticItem⟩
def rupa : Entity := ⟨"rūpa", Sorta.property⟩
def vivitti : Entity := ⟨"vivitti", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.predication "avirodhi" tarka
    , Claim.predication "caksur" tarka
    , Claim.predication "na_avatisthate" vakyartha
    , Claim.relation "apeksha" (Node.ent vakyartha) (Node.ent vivitti) ]
  , denials := [ Claim.relation "nimitta" (Node.ent rupa) (Node.ent vakyartha)
    , Claim.predication "asraya" tarka ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "avirodhi" tarka
    , Claim.predication "caksur" tarka
    , Claim.predication "na_avatisthate" vakyartha ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Reasoning alone, without reference to Veda and sastra, is sufficient to establish sentence-meaning.'
   Why rejected: The verse explicitly conditions tarka's validity on non-conflict with Veda and sastra (vedaśāstrāvirodhī). This reading ignores the concord requirement, treating reasoning as self-sufficient, contrary to the commentary's insistence that it is an instrument, not a foundation. -/
def tarka_autonomous : Reading :=
  { claims := [ Claim.predication "svatasiddha" tarka ] }
theorem tarka_autonomous_inadequate : ¬ contract.Adequate tarka_autonomous := by decide
#guard contract.licenses tarka_autonomous = false

/- 'The bare form of words alone is sufficient to determine their meaning.'
   Why rejected: This directly contradicts the verse's second half and the commentary's explicit statement that from the bare form alone (rūpamātrāddhi), meaning does not settle (na-avatiṣṭhate). The verse teaches that form requires construal, not standalone determination. -/
def form_sufficient : Reading :=
  { claims := [ Claim.relation "nimitta" (Node.ent rupa) (Node.ent vakyartha) ] }
theorem form_sufficient_inadequate : ¬ contract.Adequate form_sufficient := by decide
#guard contract.contradicts form_sufficient = true

/- 'Reasoning serves as the foundational pramana for establishing sentence-meaning.'
   Why rejected: The commentary explicitly states that 'tarka is blind as a foundation', meaning it cannot stand alone as a pramana. The verse depicts reasoning as an eye (instrument) for the sightless, explicitly auxiliary, not foundational. -/
def tarka_foundation : Reading :=
  { claims := [ Claim.predication "asraya" tarka ] }
theorem tarka_foundation_inadequate : ¬ contract.Adequate tarka_foundation := by decide
#guard contract.contradicts tarka_foundation = true

end Counterexamples

end VakyaVallari.Verses.V1_135
