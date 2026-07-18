/- Verse 1.14 — generated from data/contracts/1.14.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_14

open VakyaVallari

def vyakarana : Entity := ⟨"vyākaraṇa", Sorta.linguisticItem⟩
def apavarga : Entity := ⟨"apavarga", Sorta.absolute⟩
def vangmala : Entity := ⟨"vāṅmala", Sorta.manifestation⟩
def sarvavidya : Entity := ⟨"sarvavidyā", Sorta.manifestation⟩
def adhividya : Entity := ⟨"adhividyā", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.relation "dvara" (Node.ent vyakarana) (Node.ent apavarga)
    , Claim.relation "cikitsa" (Node.ent vyakarana) (Node.ent vangmala)
    , Claim.relation "pavitrate" (Node.ent vyakarana) (Node.ent sarvavidya)
    , Claim.identity vyakarana adhividya ]
  , denials := [ Claim.relation "samavaya" (Node.ent vyakarana) (Node.ent sarvavidya) ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "dvara" (Node.ent vyakarana) (Node.ent apavarga)
    , Claim.relation "cikitsa" (Node.ent vyakarana) (Node.ent vangmala)
    , Claim.relation "pavitrate" (Node.ent vyakarana) (Node.ent sarvavidya)
    , Claim.identity vyakarana adhividya ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Grammar is a practical tool for mastering the other sciences more effectively.'
   Why rejected: Reduces vyakarana to an instrumental property or manifestation rather than recognizing its ontological identity with adhividya (metadisciplinary power). This sort error loses the verse's central metaphysical claim about grammar's absolute status. -/
def vyakarana_tool : Entity := ⟨"vyākaraṇa", Sorta.property⟩
def instrumental_tool : Reading :=
  { claims := [ Claim.relation "aids" (Node.ent vyakarana_tool) (Node.ent sarvavidya) ] }
theorem instrumental_tool_inadequate : ¬ contract.Adequate instrumental_tool := by decide
#guard contract.licenses instrumental_tool = false
theorem instrumental_tool_sort_error : vyakarana_tool ≠ vyakarana := by decide

/- 'Grammar is the most important science, standing at the apex of a hierarchy of disciplines.'
   Why rejected: Treats adhividya as a property (comparative rank) rather than recognizing it as power (metadisciplinary authority that encompasses all). This sort error makes the identity between vyakarana and adhividya appear merely prudential rather than essential. -/
def adhividya_rank : Entity := ⟨"adhividyā", Sorta.property⟩
def hierarchical_rank : Reading :=
  { claims := [ Claim.identity vyakarana adhividya_rank ] }
theorem hierarchical_rank_inadequate : ¬ contract.Adequate hierarchical_rank := by decide
#guard contract.licenses hierarchical_rank = false
theorem hierarchical_rank_sort_error : adhividya_rank ≠ adhividya := by decide

/- "Grammar metaphorically 'heals' speech through stylistic convention, but speech defects are not real pathologies."
   Why rejected: Evacuates the therapeutic relation of ontological force. The commentary insists: 'if speech is Brahman then disordered speech is disordered being, and correcting it is not pedantry but cure.' The therapy is not poetic but real. -/
def vangmala_conventional : Entity := ⟨"vāṅmala", Sorta.property⟩
def metaphorical_medicine : Reading :=
  { claims := [ Claim.relation "cikitsa" (Node.ent vyakarana) (Node.ent vangmala_conventional) ] }
theorem metaphorical_medicine_inadequate : ¬ contract.Adequate metaphorical_medicine := by decide
#guard contract.licenses metaphorical_medicine = false
theorem metaphorical_medicine_sort_error : vangmala_conventional ≠ vangmala := by decide

end Counterexamples

end VakyaVallari.Verses.V1_14
