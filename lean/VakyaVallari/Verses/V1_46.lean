/- Verse 1.46 — generated from data/contracts/1.46.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_46

open VakyaVallari

def sabda : Entity := ⟨"śabda", Sorta.absolute⟩
def buddhi : Entity := ⟨"buddhi", Sorta.cognition⟩
def sruti : Entity := ⟨"śruti", Sorta.linguisticItem⟩
def agni : Entity := ⟨"agni", Sorta.absolute⟩
def arani : Entity := ⟨"araṇi", Sorta.manifestation⟩
def jvala : Entity := ⟨"jvala", Sorta.manifestation⟩
def prakirya : Entity := ⟨"prakīrya", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.relation "asraya" (Node.ent sabda) (Node.ent buddhi)
    , Claim.relation "karana" (Node.ent sabda) (Node.ent sruti)
    , Claim.relation "asraya" (Node.ent agni) (Node.ent arani)
    , Claim.relation "karana" (Node.ent agni) (Node.ent jvala)
    , Claim.predication "parinamate_deny" sabda
    , Claim.predication "asananta" sabda ]
  , denials := [ Claim.identity sabda sruti
    , Claim.identity agni jvala
    , Claim.relation "parinamate" (Node.ent sabda) (Node.ent sruti) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent sabda) (Node.ent buddhi)
    , Claim.relation "karana" (Node.ent sabda) (Node.ent sruti)
    , Claim.relation "asraya" (Node.ent agni) (Node.ent arani)
    , Claim.relation "karana" (Node.ent agni) (Node.ent jvala) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The word transforms into sounds through articulation.'
   Why rejected: Asserts parinama (real transformation of substance) rather than vivarta (appearance without loss of unity). The commentary explicitly denies this: 'The flame is not created by the churning ex nihilo — it was in the wood in potentia.' The word remains whole in the speaker; articulation releases it without constituting transformation. -/
def parinama_transformation : Reading :=
  { claims := [ Claim.relation "parinamate" (Node.ent sabda) (Node.ent sruti) ] }
theorem parinama_transformation_inadequate : ¬ contract.Adequate parinama_transformation := by decide
#guard contract.contradicts parinama_transformation = true

/- 'The word just is the audible sounds, manifested through articulation.'
   Why rejected: Collapses the distinction the verse insists on: 'separately' (prthak) guards that inner word and sounds are not identical, 'as fire-in-wood is not the visible blaze.' The word has potentiality without identity to its manifestations. -/
def identity_sabda_sruti : Reading :=
  { claims := [ Claim.identity sabda sruti ] }
theorem identity_sabda_sruti_inadequate : ¬ contract.Adequate identity_sabda_sruti := by decide
#guard contract.contradicts identity_sabda_sruti = true

/- 'The audible sounds produce or generate the word from scratch.'
   Why rejected: Inverts causation backward. The commentary makes clear: 'the sounds do not create the word; they release and transmit what was already whole within the speaker.' The word is latent in the speaker's intellect before uttering; sounds manifest it without constituting it. -/
def sounds_produce_word : Reading :=
  { claims := [ Claim.relation "karana" (Node.ent sruti) (Node.ent sabda) ] }
theorem sounds_produce_word_inadequate : ¬ contract.Adequate sounds_produce_word := by decide
#guard contract.licenses sounds_produce_word = false

/- 'The word-property manifests as audible sounds.'
   Why rejected: Sort error: demotes sabda from absolute (unchanging principle) to property. The entire simile structure depends on sabda being a constant, unmodified principle latent in the speaker, like fire latent in the wood — not a variable property. -/
def sabda_prop : Entity := ⟨"śabda", Sorta.property⟩
def sabda_as_property : Reading :=
  { claims := [ Claim.relation "karana" (Node.ent sabda_prop) (Node.ent sruti) ] }
theorem sabda_as_property_inadequate : ¬ contract.Adequate sabda_as_property := by decide
#guard contract.licenses sabda_as_property = false
theorem sabda_as_property_sort_error : sabda_prop ≠ sabda := by decide

end Counterexamples

end VakyaVallari.Verses.V1_46
