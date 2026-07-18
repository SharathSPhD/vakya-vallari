/- Verse 1.142 — generated from data/contracts/1.142.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_142

open VakyaVallari

def vaikhari : Entity := ⟨"vaikharī", Sorta.linguisticItem⟩
def madhyama : Entity := ⟨"madhyamā", Sorta.linguisticItem⟩
def pasyanti : Entity := ⟨"paśyantī", Sorta.linguisticItem⟩
def param_padam : Entity := ⟨"param padam", Sorta.absolute⟩
def sabda : Entity := ⟨"śabda", Sorta.absolute⟩
def tirtha : Entity := ⟨"tīrtha", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.predication "is_audible" vaikhari
    , Claim.predication "is_unsounded" madhyama
    , Claim.predication "is_undivided" pasyanti
    , Claim.predication "aneka_tirtha_bheda" vaikhari
    , Claim.predication "aneka_tirtha_bheda" madhyama
    , Claim.predication "aneka_tirtha_bheda" pasyanti
    , Claim.predication "is_supreme" param_padam
    , Claim.relation "transcends" (Node.ent param_padam) (Node.ent pasyanti)
    , Claim.identity param_padam sabda ]
  , denials := [ Claim.predication "is_ultimate" pasyanti ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "aneka_tirtha_bheda" vaikhari
    , Claim.predication "aneka_tirtha_bheda" madhyama
    , Claim.predication "aneka_tirtha_bheda" pasyanti
    , Claim.relation "transcends" (Node.ent param_padam) (Node.ent pasyanti)
    , Claim.predication "is_supreme" param_padam ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'Four entirely distinct and non-hierarchical levels of speech exist: vaikhari, madhyama, pasyanti, and a separate para-vac level.'
   Why rejected: The verse speaks of the 'param padam of the threefold vac', suggesting a summit or culmination of the three-level hierarchy rather than an additional level standing apart from them. The commentary leaves this ambiguous on purpose—whether param padam is pasyanti's absolute aspect or the later-systematized para-vac—but the karika's syntax supports the minimal reading of param padam as the pinnacle of the existing three. -/
def para_vac_separate : Entity := ⟨"para-vāc", Sorta.linguisticItem⟩
def para_vac_fourth_level : Reading :=
  { claims := [ Claim.relation "non_hierarchical" (Node.ent para_vac_separate) (Node.ent pasyanti) ] }
theorem para_vac_fourth_level_inadequate : ¬ contract.Adequate para_vac_fourth_level := by decide
#guard contract.licenses para_vac_fourth_level = false

/- 'Vaikhari, madhyama, and pasyanti are three unrelated modes of speech with no connection between them.'
   Why rejected: The commentary establishes each as a stage in a unified gradient: 'the sabda-tattva of 1.1 stands at the summit of an accessible gradient — which makes the return-path of 1.131 (union by the word's perfecting) a climb through one's own speaking, from voice through mind to vision.' This explicit description of ascent through the levels contradicts a reading that treats them as disconnected. -/
def denies_hierarchy : Reading :=
  { claims := [ Claim.predication "is_independent" vaikhari ] }
theorem denies_hierarchy_inadequate : ¬ contract.Adequate denies_hierarchy := by decide
#guard contract.licenses denies_hierarchy = false

/- 'The three levels of speech—vaikhari, madhyama, and pasyanti—constitute the final, ultimate reality; there is no station beyond them.'
   Why rejected: The verse's central assertion, marked as 'adbhuta' (wonder), is precisely that there IS a supreme station (param padam) beyond the threefold speech. To deny the existence of param padam directly contradicts the verse's primary claim. -/
def denies_supremacy : Reading :=
  { claims := [ Claim.predication "is_ultimate" pasyanti ] }
theorem denies_supremacy_inadequate : ¬ contract.Adequate denies_supremacy := by decide
#guard contract.contradicts denies_supremacy = true

end Counterexamples

end VakyaVallari.Verses.V1_142
