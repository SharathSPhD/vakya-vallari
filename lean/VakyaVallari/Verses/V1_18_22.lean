/- Verse 1.18-22 — generated from data/contracts/1.18-22.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_18_22

open VakyaVallari

def param_brahman : Entity := ⟨"param brahman", Sorta.absolute⟩
def vac_uttama : Entity := ⟨"vāc uttama", Sorta.absolute⟩
def bheda : Entity := ⟨"bheda", Sorta.manifestation⟩
def jyotis : Entity := ⟨"jyotiḥ", Sorta.manifestation⟩
def tamasi : Entity := ⟨"tamasī", Sorta.property⟩
def aloka : Entity := ⟨"aloka", Sorta.property⟩
def murti : Entity := ⟨"mūrti", Sorta.manifestation⟩
def vyapara : Entity := ⟨"vyāpāra", Sorta.power⟩
def darsana : Entity := ⟨"darśana", Sorta.cognition⟩
def nimitta : Entity := ⟨"nimitta", Sorta.linguisticItem⟩
def aksara : Entity := ⟨"akṣara", Sorta.linguisticItem⟩
def yoga : Entity := ⟨"yoga", Sorta.power⟩
def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def varnas : Entity := ⟨"varṇas", Sorta.linguisticItem⟩
def vedas : Entity := ⟨"vedas", Sorta.linguisticItem⟩
def prakriya : Entity := ⟨"prakriyā", Sorta.linguisticItem⟩
def vyakarana : Entity := ⟨"vyākaraṇa", Sorta.power⟩

def contract : Contract :=
  { axioms := [ Claim.identity vac_uttama param_brahman
    , Claim.relation "vivartate" (Node.ent param_brahman) (Node.ent jyotis)
    , Claim.relation "sabda_purva" (Node.ent yoga) (Node.ent sabda)
    , Claim.relation "asraya" (Node.ent vac_uttama) (Node.ent varnas)
    , Claim.relation "agama" (Node.ent vyakarana) (Node.ent param_brahman)
    , Claim.predication "eka" param_brahman ]
  , denials := [ Claim.predication "aloka_matra" param_brahman
    , Claim.predication "tamasi_matra" param_brahman ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.identity vac_uttama param_brahman
    , Claim.relation "sabda_purva" (Node.ent yoga) (Node.ent sabda)
    , Claim.relation "asraya" (Node.ent vac_uttama) (Node.ent varnas)
    , Claim.relation "agama" (Node.ent vyakarana) (Node.ent param_brahman)
    , Claim.predication "eka" param_brahman ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- "The highest form of speech is merely a linguistic structure that underlies all the world's words."
   Why rejected: Reduces vac_uttama from absolute reality to a mere linguistic property. The commentary insists that the ultimate IS language (word-essence), not a linguistic quality of something else. The sort error (property vs absolute) makes the identity claim categorically false. -/
def vac_structure : Entity := ⟨"speech structure", Sorta.linguisticItem⟩
def linguistic_structure_reductionism : Reading :=
  { claims := [ Claim.identity vac_structure param_brahman ] }
theorem linguistic_structure_reductionism_inadequate : ¬ contract.Adequate linguistic_structure_reductionism := by decide
#guard contract.licenses linguistic_structure_reductionism = false

/- 'Brahman directly transforms itself into the differentiated world through the operation of grammatical derivational procedures.'
   Why rejected: Asserts parinama (real transformation) instead of vivarta (appearance without loss of unity). The verse emphasizes that param_brahman remains one despite being divided by prakriya-bhedas; it does not undergo real transformation into them. -/
def parinama_transformation : Reading :=
  { claims := [ Claim.relation "parinamate" (Node.ent param_brahman) (Node.ent prakriya) ] }
theorem parinama_transformation_inadequate : ¬ contract.Adequate parinama_transformation := by decide
#guard contract.licenses parinama_transformation = false

/- 'True knowledge of Brahman requires abandoning all language and discursive thought, transcending the word-based approach.'
   Why rejected: Contradicts the central methodological claim (axiom 3) that yoga is sabda-purva, grounded in and preceded by the word. The path is not away from language but through language itself. The verse's entire architecture emphasizes that the word-led yoga is the means. -/
def language_abandonment_path : Reading :=
  { claims := [ Claim.predication "sabda_tyaga" yoga ] }
theorem language_abandonment_path_inadequate : ¬ contract.Adequate language_abandonment_path := by decide
#guard contract.licenses language_abandonment_path = false

/- 'The Vedic sounds and derivational procedures are distinct realities that merely reflect upon or approximate the highest speech, but are not fundamentally identical with it.'
   Why rejected: Contradicts axiom 4 (varnas asrita vac_uttama). The verse is explicit that the sounds of all four Vedas hold their stations IN that highest speech, not outside it. They are not separate reflections but housed within the undifferentiated One. -/
def vedas_external : Entity := ⟨"Vedas as external", Sorta.linguisticItem⟩
def vedas_separate_realism : Reading :=
  { claims := [ Claim.relation "vibhinna" (Node.ent vedas_external) (Node.ent vac_uttama) ] }
theorem vedas_separate_realism_inadequate : ¬ contract.Adequate vedas_separate_realism := by decide
#guard contract.licenses vedas_separate_realism = false

end Counterexamples

end VakyaVallari.Verses.V1_18_22
