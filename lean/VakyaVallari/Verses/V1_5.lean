/- Verse 1.5 — generated from data/contracts/1.5.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_5

open VakyaVallari

def brahman : Entity := ⟨"brahman", Sorta.absolute⟩
def veda : Entity := ⟨"veda", Sorta.linguisticItem⟩
def sakha : Entity := ⟨"śākhā", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "upaya" (Node.ent veda) (Node.ent brahman)
    , Claim.relation "anukara" (Node.ent veda) (Node.ent brahman)
    , Claim.predication "eka" veda
    , Claim.relation "vivartate" (Node.ent veda) (Node.ent sakha) ]
  , denials := [ Claim.relation "parinamate" (Node.ent veda) (Node.ent sakha) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "upaya" (Node.ent veda) (Node.ent brahman)
    , Claim.relation "anukara" (Node.ent veda) (Node.ent brahman)
    , Claim.predication "eka" veda ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The Veda serves only as an instrument to reach Brahman, not as Brahman itself.'
   Why rejected: Treats veda as purely instrumental by degrading Brahman from absolute reality (word-essence) to a mere external goal (property). This severs the anukara (likeness) dimension; the commentary insists the Veda IS 'the goal in linguistic image', not merely a pointer to it. The claim upaya(veda, brahman-as-goal) is unlicensed: axioms sanction such relations only to brahman-as-absolute. -/
def brahman_goal : Entity := ⟨"brahman", Sorta.property⟩
def veda_as_instructions_only : Reading :=
  { claims := [ Claim.relation "upaya" (Node.ent veda) (Node.ent brahman_goal) ] }
theorem veda_as_instructions_only_inadequate : ¬ contract.Adequate veda_as_instructions_only := by decide
#guard contract.licenses veda_as_instructions_only = false
theorem veda_as_instructions_only_sort_error : brahman_goal ≠ brahman := by decide

/- 'The Veda genuinely exists as many distinct recensions rather than one appearing as many.'
   Why rejected: Treats sakhas as satya (real multiplicity), contradicting the commentary's explicit claim that their plurality is phenomenal, like the plurality of saktis. -/
def sakhas_as_real_plurality : Reading :=
  { claims := [ Claim.relation "parinamate" (Node.ent veda) (Node.ent sakha) ] }
theorem sakhas_as_real_plurality_inadequate : ¬ contract.Adequate sakhas_as_real_plurality := by decide
#guard contract.contradicts sakhas_as_real_plurality = true

end Counterexamples

end VakyaVallari.Verses.V1_5
