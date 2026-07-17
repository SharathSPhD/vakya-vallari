/- Verse 1.97 — generated from data/contracts/1.97.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_97

open VakyaVallari

def grahana : Entity := ⟨"grahaṇa", Sorta.cognition⟩
def grahya : Entity := ⟨"grāhya", Sorta.manifestation⟩
def yogyata : Entity := ⟨"yogyatā", Sorta.property⟩
def sphota : Entity := ⟨"sphota", Sorta.linguisticItem⟩
def dhvani : Entity := ⟨"dhvani", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.predication "siddha" yogyata
    , Claim.predication "niyata" yogyata
    , Claim.relation "yogyate" (Node.ent grahana) (Node.ent grahya)
    , Claim.relation "yogyate" (Node.ent sphota) (Node.ent dhvani)
    , Claim.relation "vyanjya-vyanjaka" (Node.ent dhvani) (Node.ent sphota) ]
  , denials := [ Claim.relation "asraya" (Node.ent dhvani) (Node.ent sphota) ] }

def accepted : Reading :=
  { claims := [ Claim.relation "yogyate" (Node.ent grahana) (Node.ent grahya)
    , Claim.relation "yogyate" (Node.ent sphota) (Node.ent dhvani)
    , Claim.predication "siddha" yogyata
    , Claim.predication "niyata" yogyata
    , Claim.relation "vyanjya-vyanjaka" (Node.ent dhvani) (Node.ent sphota) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- 'The word is assembled or composed from the right combination of phonemes according to a structural principle.'
   Why rejected: The commentary explicitly rejects this: 'without conceding that the word is assembled from that pattern: fit, not composition.' The point is that yogyatā (fitness) explains the manifestation of sphota by sounds without making the word composed of sounds. Asserting asraya (grounding-in) from sounds to sphota contradicts this denial. -/
def compositional_assembly : Reading :=
  { claims := [ Claim.relation "asraya" (Node.ent dhvani) (Node.ent sphota) ] }
theorem compositional_assembly_inadequate : ¬ contract.Adequate compositional_assembly := by decide
#guard contract.contradicts compositional_assembly = true

/- 'The fitness between sound and word-meaning is derived from or explained by causal processes or learned associations.'
   Why rejected: The verse insists that yogyatā is siddha (established) and niyata (fixed)—bedrock properties that cannot be derived or explained further. To derive fitness from causes would contradict these essential predicates and violate the 'primitive' status the commentary assigns to this relation. -/
def derived_fitness : Reading :=
  { claims := [ Claim.predication "hetusamuppanna" yogyata ] }
theorem derived_fitness_inadequate : ¬ contract.Adequate derived_fitness := by decide
#guard contract.licenses derived_fitness = false

end Counterexamples

end VakyaVallari.Verses.V1_97
