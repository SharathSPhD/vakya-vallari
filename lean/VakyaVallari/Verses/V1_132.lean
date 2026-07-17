/- Verse 1.132 — generated from data/contracts/1.132.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_132

open VakyaVallari

def veda : Entity := ⟨"veda", Sorta.absolute⟩
def agama : Entity := ⟨"agama", Sorta.manifestation⟩
def kartr : Entity := ⟨"kartṛ", Sorta.power⟩
def bija : Entity := ⟨"bīja", Sorta.power⟩
def vyavastha : Entity := ⟨"vyavasthā", Sorta.power⟩
def rshi : Entity := ⟨"rṣi", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.identity bija vyavastha
    , Claim.relation "asraya" (Node.ent agama) (Node.ent kartr)
    , Claim.relation "vivartate" (Node.ent bija) (Node.ent veda)
    , Claim.relation "drś" (Node.ent rshi) (Node.ent veda)
    , Claim.predication "akartr" veda
    , Claim.predication "eternal" vyavastha
    , Claim.predication "eternal" bija ]
  , denials := [ Claim.predication "eternal" agama
    , Claim.relation "karta" (Node.ent rshi) (Node.ent veda) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent agama) (Node.ent kartr)
    , Claim.predication "eternal" bija
    , Claim.relation "vivartate" (Node.ent bija) (Node.ent veda) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'A teaching-tradition, once established, persists eternally and requires a constant sustaining agent.'
   Why rejected: Confuses the temporal manifestation (agama, which the verse says perish) with the eternal essence (the seed). Agama is established in each age by a kartṛ but doesn't persist eternally. -/
def eternal_agama : Reading :=
  { claims := [ Claim.predication "eternal" agama ] }
theorem eternal_agama_inadequate : ¬ contract.Adequate eternal_agama := by decide
#guard contract.contradicts eternal_agama = true

/- 'The wise seers (rṣis) compose the Veda anew in each age according to their insights.'
   Why rejected: Misrepresents the role of rṣis as creators/composers rather than perceivers. The verse says rṣis 'see' the eternal Veda, meaning they perceive what already exists (the eternal seed-order), not invent new teachings. -/
def rsi_composers : Reading :=
  { claims := [ Claim.relation "karta" (Node.ent rshi) (Node.ent veda) ] }
theorem rsi_composers_inadequate : ¬ contract.Adequate rsi_composers := by decide
#guard contract.contradicts rsi_composers = true

/- 'The eternal seed-order also requires an originating agent (Ishvara/God) to establish it.'
   Why rejected: Incorrectly extends the need for a kartṛ (which applies to the temporal manifestation agama) to the eternal seed (bīja). The verse distinguishes: agama needs a kartṛ; the seed is self-persisting and eternal. -/
def ishvara : Entity := ⟨"īśvara", Sorta.power⟩
def seed_needs_agent : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent bija) (Node.ent ishvara) ] }
theorem seed_needs_agent_inadequate : ¬ contract.Adequate seed_needs_agent := by decide
#guard contract.licenses seed_needs_agent = false

end Counterexamples

end VakyaVallari.Verses.V1_132
