/- Verse 1.107 — generated from data/contracts/1.107.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_107

open VakyaVallari

def vayu : Entity := ⟨"vāyu", Sorta.power⟩
def anu : Entity := ⟨"anu", Sorta.power⟩
def jnana : Entity := ⟨"jñāna", Sorta.cognition⟩
def sabda : Entity := ⟨"śabda", Sorta.manifestation⟩
def darsana : Entity := ⟨"darśana", Sorta.property⟩
def yogyata : Entity := ⟨"yogyatā", Sorta.property⟩
def sphota : Entity := ⟨"sphoṭa", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent vayu) (Node.ent sabda)
    , Claim.relation "asraya" (Node.ent anu) (Node.ent sabda)
    , Claim.relation "asraya" (Node.ent jnana) (Node.ent sabda)
    , Claim.predication "anavasthita" darsana
    , Claim.relation "asraya" (Node.ent sphota) (Node.ent yogyata) ]
  , denials := [ Claim.predication "siddha" darsana ] }

def accepted : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent vayu) (Node.ent sabda)
    , Claim.relation "asraya" (Node.ent anu) (Node.ent sabda)
    , Claim.relation "asraya" (Node.ent jnana) (Node.ent sabda)
    , Claim.predication "anavasthita" darsana ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Air is definitively established as the sole substrate for the word.'
   Why rejected: Commits to a single substrate view, contradicting the commentary's explicit statement that the divergence of views settles nowhere and Bhartrhari's demonstration that the sphota doctrine is compatible with all three substrates. -/
def settled_substrate : Reading :=
  { claims := [ Claim.predication "siddha" darsana ] }
theorem settled_substrate_inadequate : ¬ contract.Adequate settled_substrate := by decide
#guard contract.contradicts settled_substrate = true

/- "The manifested word's undividedness depends on which substrate theory one accepts."
   Why rejected: Asserts a dependence between substrate choice and the core sphota properties that the commentary explicitly severs: yogyata and undividedness stand unaffected by the substrate story. -/
def substrate_determines_sphota : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent darsana) (Node.ent sphota) ] }
theorem substrate_determines_sphota_inadequate : ¬ contract.Adequate substrate_determines_sphota := by decide
#guard contract.licenses substrate_determines_sphota = false

/- 'Cognition is a mere linguistic property, one view among others that carries no ontological weight.'
   Why rejected: Demotes jnana (cognition) from a substantive candidate substrate to a mere descriptive property. The commentary's phrasing — 'the idealist answer, word as a modification of awareness' — treats it as a genuine ontological contender, not a surface property. -/
def jnana_prop : Entity := ⟨"jñāna", Sorta.property⟩
def jnana_as_property : Reading :=
  { claims := [ Claim.identity jnana_prop jnana ] }
theorem jnana_as_property_inadequate : ¬ contract.Adequate jnana_as_property := by decide
#guard contract.licenses jnana_as_property = false
theorem jnana_as_property_sort_error : jnana_prop ≠ jnana := by decide

end Counterexamples

end VakyaVallari.Verses.V1_107
