/- Verse 1.8 — generated from data/contracts/1.8.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_8

open VakyaVallari

def arthavada : Entity := ⟨"arthavāda", Sorta.linguisticItem⟩
def vidhi : Entity := ⟨"vidhi", Sorta.linguisticItem⟩
def ekatva_pravada : Entity := ⟨"ekativā-pravāda", Sorta.cognition⟩
def dvaita_pravada : Entity := ⟨"dvaitā-pravāda", Sorta.cognition⟩
def vikalpa : Entity := ⟨"vikalpa", Sorta.cognition⟩

def contract : Contract :=
  { axioms := [ Claim.relation "niśrita" (Node.ent ekatva_pravada) (Node.ent arthavada)
    , Claim.relation "niśrita" (Node.ent dvaita_pravada) (Node.ent arthavada)
    , Claim.relation "nikalpaja" (Node.ent ekatva_pravada) (Node.ent vikalpa)
    , Claim.relation "nikalpaja" (Node.ent dvaita_pravada) (Node.ent vikalpa) ]
  , denials := [ Claim.relation "niśrita" (Node.ent ekatva_pravada) (Node.ent vidhi)
    , Claim.relation "niśrita" (Node.ent dvaita_pravada) (Node.ent vidhi) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "niśrita" (Node.ent ekatva_pravada) (Node.ent arthavada)
    , Claim.relation "niśrita" (Node.ent dvaita_pravada) (Node.ent arthavada)
    , Claim.relation "nikalpaja" (Node.ent ekatva_pravada) (Node.ent vikalpa)
    , Claim.relation "nikalpaja" (Node.ent dvaita_pravada) (Node.ent vikalpa) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The monist and dualist doctrines rest on the injunctive commands of the Veda.'
   Why rejected: Misidentifies the foundation as vidhi (injunctive portions) when the verse explicitly states it is arthavada (non-injunctive explanatory material). This category error undermines the commentary's key point: that ambiguous non-injunctive material permits multiple constructions. -/
def injunctive_foundation : Reading :=
  { claims := [ Claim.relation "niśrita" (Node.ent ekatva_pravada) (Node.ent vidhi)
    , Claim.relation "niśrita" (Node.ent dvaita_pravada) (Node.ent vidhi) ] }
theorem injunctive_foundation_inadequate : ¬ contract.Adequate injunctive_foundation := by decide
#guard contract.contradicts injunctive_foundation = true

/- 'The monist and dualist doctrines converge on a single underlying truth derived from the Veda.'
   Why rejected: Ignores the verse's emphasis on manifold (bahudhā) conflicting doctrines arising from their own differing constructions (svavikalpajāh). The commentary explicitly notes they 'multiply and conflict' precisely because they rest on non-injunctive ambiguous material. -/
def unified_pravada : Entity := ⟨"ekā pravāda", Sorta.cognition⟩
def unified_doctrine : Reading :=
  { claims := [ Claim.identity ekatva_pravada unified_pravada
    , Claim.identity dvaita_pravada unified_pravada ] }
theorem unified_doctrine_inadequate : ¬ contract.Adequate unified_doctrine := by decide
#guard contract.licenses unified_doctrine = false

/- 'The monist and dualist doctrines are directly revealed by Vedic knowledge, not mental constructions.'
   Why rejected: Contradicts the explicit statement that they are svavikalpajāh (born from their own conceptual constructions). The verse places the doctrines squarely in the domain of vikalpa (conceptual elaboration), not revelation. -/
def revelation : Entity := ⟨"śruti", Sorta.cognition⟩
def revealed_not_constructed : Reading :=
  { claims := [ Claim.relation "nikalpaja" (Node.ent ekatva_pravada) (Node.ent revelation) ] }
theorem revealed_not_constructed_inadequate : ¬ contract.Adequate revealed_not_constructed := by decide
#guard contract.licenses revealed_not_constructed = false

end Counterexamples

end VakyaVallari.Verses.V1_8
