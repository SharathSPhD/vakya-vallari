/- Verse 1.110-111 — generated from data/contracts/1.110-111.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_110_111

open VakyaVallari

def anu : Entity := ⟨"aṇu", Sorta.absolute⟩
def sakti : Entity := ⟨"śakti", Sorta.power⟩
def chaya : Entity := ⟨"chāya", Sorta.manifestation⟩
def atapa : Entity := ⟨"atapa", Sorta.manifestation⟩
def tamas : Entity := ⟨"tamas", Sorta.manifestation⟩
def sabda : Entity := ⟨"śabda", Sorta.manifestation⟩
def sabda_akhya : Entity := ⟨"śabdākhyāḥ", Sorta.linguisticItem⟩
def prayatna : Entity := ⟨"prayatna", Sorta.power⟩
def parinama : Entity := ⟨"parināma", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.relation "parinamate" (Node.ent anu) (Node.ent sabda)
    , Claim.predication "sarvasaktitvat" anu
    , Claim.relation "vyajyamana" (Node.ent sakti) (Node.ent sabda_akhya)
    , Claim.relation "pracyante" (Node.ent sabda_akhya) (Node.ent prayatna)
    , Claim.predication "functional_designation" sabda_akhya ]
  , denials := [ Claim.predication "eka_dravya" sabda_akhya
    , Claim.predication "paryapta" sabda_akhya ] }

def accepted : Reading :=
  { claims := [ Claim.relation "parinamate" (Node.ent anu) (Node.ent sabda)
    , Claim.predication "sarvasaktitvat" anu
    , Claim.relation "pracyante" (Node.ent sabda_akhya) (Node.ent prayatna)
    , Claim.predication "functional_designation" sabda_akhya ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The atoms combine into a single, unified word-substance that hearer can grasp as one.'
   Why rejected: The commentary explicitly denies this: clouds are 'aggregates with edges only from a distance, form without unity' and 'a cloud of word-atoms has no principled oneness for the hearer's single grasp'. The theory fails precisely because it cannot deliver the unity word requires. -/
def sabda_unified : Entity := ⟨"śabda", Sorta.absolute⟩
def unified_word_substance : Reading :=
  { claims := [ Claim.identity anu sabda_unified ] }
theorem unified_word_substance_inadequate : ¬ contract.Adequate unified_word_substance := by decide
#guard contract.licenses unified_word_substance = false
theorem unified_word_substance_sort_error : sabda_unified ≠ sabda := by decide

/- 'Atoms eternally possess wordhood as an intrinsic property rather than generating it through transformation.'
   Why rejected: The verse uses parinamirah (transform), not dharana (inherently possess). The commentary says atoms 'take on word-being as one parinama among siblings', stressing this is a transformation into one mode among others (shadow, light, darkness), not an eternal property. The functional designation ('a name conceding that wordhood is a functional designation, not a natural kind') is generated, not pre-existing. -/
def sabda_property : Entity := ⟨"śabda", Sorta.property⟩
def eternal_word_property : Reading :=
  { claims := [ Claim.predication "nityatva" anu ] }
theorem eternal_word_property_inadequate : ¬ contract.Adequate eternal_word_property := by decide
#guard contract.licenses eternal_word_property = false
theorem eternal_word_property_sort_error : sabda_property ≠ sabda := by decide

/- 'A conscious agent directs the effort by which atom-clouds condense into articulate words.'
   Why rejected: The verse treats prayatna as a force property of the atoms themselves ('When their own power is being manifested, impelled by effort'), not as conscious direction from a speaker. The atomistic theory attributes word-generation to mechanical effort within nature, not intentional acts of agency. Introducing consciousness would solve the unity problem the commentary identifies—but the purvapaksa theory explicitly denies it, and that denial is part of what makes it a coherent (if incomplete) position. -/
def conscious_agent : Entity := ⟨"kartṛ", Sorta.cognition⟩
def consciousness_orchestrates : Reading :=
  { claims := [ Claim.relation "prayojanam" (Node.ent conscious_agent) (Node.ent prayatna) ] }
theorem consciousness_orchestrates_inadequate : ¬ contract.Adequate consciousness_orchestrates := by decide
#guard contract.licenses consciousness_orchestrates = false

/- 'Like the vayu theory, atoms form a continuous medium that carries wordhood through the air.'
   Why rejected: The verse explicitly denies this: the commentary contrasts this atom-theory with 'the vayu theory [which] made word a *state* of one continuous stuff', and says 'this view grinds the substrate finer: anavah, atoms'. The atomistic theory uses scattered particles (prakiya-dravya), not a continuous medium like air. The cloud simile emphasizes aggregation of discrete units, not a single flowing substance. -/
def sabda_vayu : Entity := ⟨"vāyu", Sorta.manifestation⟩
def atoms_unified_like_vayu : Reading :=
  { claims := [ Claim.relation "ananta_dravya" (Node.ent sabda_vayu) (Node.ent sabda_akhya) ] }
theorem atoms_unified_like_vayu_inadequate : ¬ contract.Adequate atoms_unified_like_vayu := by decide
#guard contract.licenses atoms_unified_like_vayu = false

end Counterexamples

end VakyaVallari.Verses.V1_110_111
