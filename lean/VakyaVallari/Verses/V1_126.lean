/- Verse 1.126 — generated from data/contracts/1.126.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_126

open VakyaVallari

def caitanya : Entity := ⟨"caitanya", Sorta.absolute⟩
def vagrupata : Entity := ⟨"vāgrupata", Sorta.absolute⟩
def samjna : Entity := ⟨"samjñā", Sorta.cognition⟩
def bahir : Entity := ⟨"bahir", Sorta.property⟩
def antas : Entity := ⟨"antas", Sorta.property⟩
def samsarin : Entity := ⟨"samsārin", Sorta.manifestation⟩
def jati : Entity := ⟨"jāti", Sorta.property⟩
def tanmatram : Entity := ⟨"tanmātram", Sorta.property⟩

def contract : Contract :=
  { axioms := [ Claim.identity caitanya vagrupata
    , Claim.predication "vivartate" caitanya
    , Claim.relation "asraya" (Node.ent samjna) (Node.ent samsarin)
    , Claim.predication "vartate" samjna
    , Claim.relation "avyatikranti" (Node.ent caitanya) (Node.ent tanmatram) ]
  , denials := [ Claim.relation "atikranti" (Node.ent caitanya) (Node.ent tanmatram) ] }

def accepted : Reading :=
  { claims := [ Claim.predication "vivartate" caitanya
    , Claim.identity caitanya vagrupata
    , Claim.relation "asraya" (Node.ent samjna) (Node.ent samsarin) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'This consciousness operates only in human transmigrating beings, in speech and thought.'
   Why rejected: Restricts caitanya to humans alone, ignoring the explicit universalization sarvajatisu ('in all kinds of beings'). The commentary requires extension through animals and all sentient orders to establish word-essence as a feature of consciousness as such, not learned language. -/
def caitanya_human_only : Entity := ⟨"caitanya", Sorta.property⟩
def human_cognitive_exclusivity : Reading :=
  { claims := [ Claim.identity caitanya_human_only caitanya ] }
theorem human_cognitive_exclusivity_inadequate : ¬ contract.Adequate human_cognitive_exclusivity := by decide
#guard contract.licenses human_cognitive_exclusivity = false
theorem human_cognitive_exclusivity_sort_error : caitanya_human_only ≠ caitanya := by decide

/- 'Sentience in beings exceeds and transgresses the measure of word-formedness.'
   Why rejected: Contradicts the core tenet that consciousness does not step beyond the word-measure (tanmatram avyatikrantam). The commentary insists sentience, however dim, remains within word-bounds in all beings. -/
def consciousness_exceeds_measure : Reading :=
  { claims := [ Claim.relation "atikranti" (Node.ent caitanya) (Node.ent tanmatram) ] }
theorem consciousness_exceeds_measure_inadequate : ¬ contract.Adequate consciousness_exceeds_measure := by decide
#guard contract.contradicts consciousness_exceeds_measure = true

/- 'The consciousness of beings is independent from and operates separately from any word-essence or linguistic structure.'
   Why rejected: Asserts independence where the verse and commentary establish coextensiveness and identity. The identity axiom makes this reading's key claim unlicensed. -/
def separation_of_consciousness_and_language : Reading :=
  { claims := [ Claim.relation "bhinnam" (Node.ent caitanya) (Node.ent vagrupata) ] }
theorem separation_of_consciousness_and_language_inadequate : ¬ contract.Adequate separation_of_consciousness_and_language := by decide
#guard contract.licenses separation_of_consciousness_and_language = false

end Counterexamples

end VakyaVallari.Verses.V1_126
