/- Verse 1.120 — generated from data/contracts/1.120.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_120

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.absolute⟩
def amnaya : Entity := ⟨"āmnāya", Sorta.linguisticItem⟩
def chandas : Entity := ⟨"chandas", Sorta.linguisticItem⟩
def visva : Entity := ⟨"viśva", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "vivartate" (Node.ent sabda) (Node.ent visva)
    , Claim.relation "source" (Node.ent chandas) (Node.ent visva)
    , Claim.predication "teaches_cosmic_unity" amnaya ]
  , denials := [ Claim.relation "parinamate" (Node.ent sabda) (Node.ent visva) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "vivartate" (Node.ent sabda) (Node.ent visva)
    , Claim.relation "source" (Node.ent chandas) (Node.ent visva)
    , Claim.predication "teaches_cosmic_unity" amnaya ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Bhartrhari endorses the doctrine that the word truly transforms into the universe, as the Vedic tradition teaches.'
   Why rejected: Takes parinama as Bhartrhari's own philosophical position. The commentary is explicit: parinama is the amnaya-knowers' scriptural idiom; Bhartrhari's own verb, held consistently since 1.1, is vivartate (appearance without real transformation). This is the central distinction the commentary enforces. -/
def endorse_parinama : Reading :=
  { claims := [ Claim.relation "parinamate" (Node.ent sabda) (Node.ent visva) ] }
theorem endorse_parinama_inadequate : ¬ contract.Adequate endorse_parinama := by decide
#guard contract.contradicts endorse_parinama = true

/- 'The word is a descriptive property of the universe, not its generative source.'
   Why rejected: Demotes sabda from absolute principle to property, reversing the asymmetry established by the axioms. An absolute can vivartate into a manifestation; a property cannot. This is a sort error that breaks the ontological hierarchy. -/
def sabda_property : Entity := ⟨"śabda", Sorta.property⟩
def sabda_as_description : Reading :=
  { claims := [ Claim.relation "vivartate" (Node.ent sabda_property) (Node.ent visva) ] }
theorem sabda_as_description_inadequate : ¬ contract.Adequate sabda_as_description := by decide
#guard contract.licenses sabda_as_description = false
theorem sabda_as_description_sort_error : sabda_property ≠ sabda := by decide

end Counterexamples

end VakyaVallari.Verses.V1_120
