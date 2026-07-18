/- Verse 1.95 — generated from data/contracts/1.95.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_95

open VakyaVallari

def sphota : Entity := ⟨"śphoṭa", Sorta.absolute⟩
def sabda : Entity := ⟨"śabda", Sorta.linguisticItem⟩
def jati : Entity := ⟨"jāti", Sorta.power⟩
def asraya : Entity := ⟨"āśraya", Sorta.manifestation⟩
def gatvam : Entity := ⟨"gatvam", Sorta.power⟩
def gau : Entity := ⟨"gau", Sorta.manifestation⟩
def anitya : Entity := ⟨"anitya", Sorta.manifestation⟩

def contract : Contract :=
  { axioms := [ Claim.relation "vyakti" (Node.ent jati) (Node.ent asraya)
    , Claim.predication "nitya" jati
    , Claim.predication "aparinami" gatvam
    , Claim.predication "nitya" sphota ]
  , denials := [ Claim.predication "anitya" sphota
    , Claim.predication "anitya" jati ]
  , reported := [] }

def accepted : Reading :=
  { claims := [ Claim.predication "nitya" jati
    , Claim.relation "vyakti" (Node.ent jati) (Node.ent asraya) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'To manifest the eternal word (sphota) through sounds would drag it into time and make it transient.'
   Why rejected: Asserts that manifestation of eternal things necessarily makes them temporal. The verse refutes this through the precedent of eternal universals: cowhood is manifested whenever a cow appears, yet cowhood neither arrives nor departs. The manifestation relation does not transmit transience to what is manifested. -/
def eternal_temporalized_sphota : Reading :=
  { claims := [ Claim.predication "anitya" sphota ] }
theorem eternal_temporalized_sphota_inadequate : ¬ contract.Adequate eternal_temporalized_sphota := by decide
#guard contract.contradicts eternal_temporalized_sphota = true

/- 'Manifestation of eternal universals would render them subject to temporal change, arriving and departing with their substrates.'
   Why rejected: Asserts that manifestation of eternals makes them transient. The commentary directly refutes this: cowhood is manifested by the cow standing, yet 'cowhood neither arrives nor departs.' The axiom of eternals excludes the anitya property. -/
def eternal_temporalized_jati : Reading :=
  { claims := [ Claim.predication "anitya" jati ] }
theorem eternal_temporalized_jati_inadequate : ¬ contract.Adequate eternal_temporalized_jati := by decide
#guard contract.contradicts eternal_temporalized_jati = true

/- 'The manifestation of universals by substrates shows that universals are mere properties dependent on their substrates, not eternal principles.'
   Why rejected: Confuses manifestation (occurrence of apprehension) with ontological dependence (sort error: power vs property). The commentary emphasizes that cowhood is eternally real and neither arrives nor departs when the substrate appears or disappears. Manifestation is an epistemic/phenomenal relation, not an ontological one. -/
def gatvam_property : Entity := ⟨"gatvam", Sorta.property⟩
def substrate_manifests_property : Reading :=
  { claims := [ Claim.predication "ontologically_dependent" gatvam_property ] }
theorem substrate_manifests_property_inadequate : ¬ contract.Adequate substrate_manifests_property := by decide
#guard contract.licenses substrate_manifests_property = false
theorem substrate_manifests_property_sort_error : gatvam_property ≠ gatvam := by decide

end Counterexamples

end VakyaVallari.Verses.V1_95
