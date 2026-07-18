/- Verse 1.11 — generated from data/contracts/1.11.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_11

open VakyaVallari

def brahman : Entity := ⟨"brahman", Sorta.absolute⟩
def vyakarana : Entity := ⟨"vyākaraṇa", Sorta.linguisticItem⟩
def vedangas : Entity := ⟨"vedāṅgas", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asanna" (Node.ent vyakarana) (Node.ent brahman)
    , Claim.predication "uttama_tapas" vyakarana
    , Claim.relation "prathamam" (Node.ent vyakarana) (Node.ent vedangas)
    , Claim.predication "ascesis" vyakarana ]
  , denials := [ Claim.predication "propaedeutic" vyakarana ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.relation "asanna" (Node.ent vyakarana) (Node.ent brahman)
    , Claim.predication "uttama_tapas" vyakarana
    , Claim.relation "prathamam" (Node.ent vyakarana) (Node.ent vedangas) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Grammar is the highest technical discipline for analyzing speech, which serves as preparation for spiritual practice.'
   Why rejected: The commentary explicitly denies that grammar is 'preparation for' spiritual practice, stating instead 'analysing speech is a spiritual discipline, not a preparation for one'. This reading violates the denial and misconstrues grammar's nature as technique rather than ascesis. -/
def propaedeutic_misreading : Reading :=
  { claims := [ Claim.predication "propaedeutic" vyakarana ] }
theorem propaedeutic_misreading_inadequate : ¬ contract.Adequate propaedeutic_misreading := by decide
#guard contract.contradicts propaedeutic_misreading = true

/- 'Brahman is the principle nearest to grammar, and grammar constitutes the highest austerity.'
   Why rejected: Reverses the asymmetrical relation of proximity: grammar approaches Brahman as the ultimate, not the reverse. The axiom establishes vyakarana asanna brahman (grammar near Brahman), not brahman asanna vyakarana. Reversing this direction is not entailed by the axioms. -/
def brahman_near_grammar : Reading :=
  { claims := [ Claim.relation "asanna" (Node.ent brahman) (Node.ent vyakarana) ] }
theorem brahman_near_grammar_inadequate : ¬ contract.Adequate brahman_near_grammar := by decide
#guard contract.licenses brahman_near_grammar = false

end Counterexamples

end VakyaVallari.Verses.V1_11
