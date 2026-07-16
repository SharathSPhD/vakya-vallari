/- Verse 1.43 — generated from data/contracts/1.43.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_43

open VakyaVallari

def akrtaka_sastra : Entity := ⟨"akṛtaka-śāstra", Sorta.absolute⟩
def smrti : Entity := ⟨"smṛti", Sorta.linguisticItem⟩
def grammar : Entity := ⟨"śabdānāmanuśāsana", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asritya" (Node.ent grammar) (Node.ent akrtaka_sastra)
    , Claim.predication "nibandhana" smrti
    , Claim.relation "asritya" (Node.ent grammar) (Node.ent smrti) ]
  , denials := [ Claim.predication "arbitrary" smrti ] }

def accepted : Reading :=
  { claims := [ Claim.relation "asritya" (Node.ent grammar) (Node.ent akrtaka_sastra)
    , Claim.relation "asritya" (Node.ent grammar) (Node.ent smrti)
    , Claim.predication "nibandhana" smrti ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The cultivated decide the regulation of words by an arbitrary, self-justifying tradition without any transcendent grounding.'
   Why rejected: Misrepresents tradition as arbitrary and self-grounded, contradicting the commentary's explicit insistence that the smrti is not arbitrary but grounded in nibandhana and attachments to its source. -/
def arbitrary_tradition : Reading :=
  { claims := [ Claim.predication "arbitrary" smrti ] }
theorem arbitrary_tradition_inadequate : ¬ contract.Adequate arbitrary_tradition := by decide
#guard contract.contradicts arbitrary_tradition = true

/- 'Grammar is an arbitrary, conventional system maintained by tradition alone, with no connection to any uncreated or transcendent principle.'
   Why rejected: Simultaneously contradicts both axioms: (1) it denies grammar rests on uncreated teaching, and (2) it represents tradition as arbitrary, contradicting the commentary's insistence on nibandhana. It misses that both sources are necessary and neither is arbitrary. -/
def arbitrary_grammar_tradition_only : Reading :=
  { claims := [ Claim.predication "arbitrary" grammar
    , Claim.predication "arbitrary" smrti ] }
theorem arbitrary_grammar_tradition_only_inadequate : ¬ contract.Adequate arbitrary_grammar_tradition_only := by decide
#guard contract.contradicts arbitrary_grammar_tradition_only = true

end Counterexamples

end VakyaVallari.Verses.V1_43
