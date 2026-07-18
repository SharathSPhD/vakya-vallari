/- Verse 1.80 — generated from data/contracts/1.80.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_80

open VakyaVallari

def caksu : Entity := ⟨"cakṣuḥ", Sorta.power⟩
def tejas : Entity := ⟨"tejas", Sorta.power⟩
def visaya : Entity := ⟨"viṣaya", Sorta.manifestation⟩
def indriya : Entity := ⟨"indriya", Sorta.power⟩
def samskara : Entity := ⟨"saṃskāra", Sorta.power⟩
def dhvani : Entity := ⟨"dhvani", Sorta.linguisticItem⟩
def kramo : Entity := ⟨"kramo", Sorta.property⟩
def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def shrota : Entity := ⟨"śrota", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.relation "samskara_gives" (Node.ent tejas) (Node.ent indriya)
    , Claim.relation "samskara_gives" (Node.ent tejas) (Node.ent visaya)
    , Claim.predication "kramo_tulya_tejasam" dhvani
    , Claim.relation "samskara_gives" (Node.ent dhvani) (Node.ent shrota)
    , Claim.relation "samskara_gives" (Node.ent dhvani) (Node.ent sabda) ]
  , denials := [ Claim.identity dhvani tejas ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "samskara_gives" (Node.ent tejas) (Node.ent indriya)
    , Claim.relation "samskara_gives" (Node.ent tejas) (Node.ent visaya)
    , Claim.predication "kramo_tulya_tejasam" dhvani
    , Claim.relation "samskara_gives" (Node.ent dhvani) (Node.ent shrota)
    , Claim.relation "samskara_gives" (Node.ent dhvani) (Node.ent sabda) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- "Sound operates only to manifest the word directly; it does not condition the hearer's faculty at all."
   Why rejected: The verse establishes that sound works like light: conditioning both receiver and object. Denying the receiver-side (hearer's faculty conditioning) severs the complete analogy and misses the phenomenology of how repetition ripens understanding. -/
def dhvani_agent : Entity := ⟨"dhvani", Sorta.manifestation⟩
def sound_determines_object_alone : Reading :=
  { claims := [ Claim.relation "vivartate" (Node.ent dhvani_agent) (Node.ent sabda) ] }
theorem sound_determines_object_alone_inadequate : ¬ contract.Adequate sound_determines_object_alone := by decide
#guard contract.licenses sound_determines_object_alone = false
theorem sound_determines_object_alone_sort_error : dhvani_agent ≠ dhvani := by decide

/- "In vision, light only makes the object visible; it does not prepare the eye's capacity to see."
   Why rejected: The commentary says light plays a double role, preparing both eye and object. If light worked only on the object, the analogy to sound would not establish that sound conditions both hearer and word. -/
def tejas_manifestive : Entity := ⟨"tejas", Sorta.manifestation⟩
def light_determines_object_alone : Reading :=
  { claims := [ Claim.relation "vivartate" (Node.ent tejas_manifestive) (Node.ent visaya) ] }
theorem light_determines_object_alone_inadequate : ¬ contract.Adequate light_determines_object_alone := by decide
#guard contract.licenses light_determines_object_alone = false
theorem light_determines_object_alone_sort_error : tejas_manifestive ≠ tejas := by decide

/- 'Sound and light are essentially the same substance, differing only in their sensory appearance.'
   Why rejected: The commentary explicitly defers the question of whether sound is separately perceived (1.81). Identifying them in substance would prematurely close a debate that Bhartrhari intentionally leaves open. The verse establishes only a functional parallel, not an identity. -/
def sound_essence_equals_light : Reading :=
  { claims := [ Claim.identity dhvani tejas ] }
theorem sound_essence_equals_light_inadequate : ¬ contract.Adequate sound_essence_equals_light := by decide
#guard contract.contradicts sound_essence_equals_light = true

end Counterexamples

end VakyaVallari.Verses.V1_80
