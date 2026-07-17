/- Verse 1.145 — generated from data/contracts/1.145.json. DO NOT EDIT.
   Axiom cites are verbatim commentary quotations, validated by
   tests/test_contracts.py. -/
import VakyaVallari.Adequacy

namespace VakyaVallari.Verses.V1_145

open VakyaVallari

def avibhaga : Entity := ⟨"avibhāga", Sorta.absolute⟩
def bhava : Entity := ⟨"bhava", Sorta.manifestation⟩
def sruti : Entity := ⟨"śruti", Sorta.linguisticItem⟩
def abhikhya : Entity := ⟨"abhikhyā", Sorta.property⟩
def svapna_sakti : Entity := ⟨"svapna-śakti", Sorta.power⟩
def bhava_tattva : Entity := ⟨"bhava-tattvam", Sorta.cognition⟩
def linga : Entity := ⟨"liṅga", Sorta.property⟩
def smrti : Entity := ⟨"smṛti", Sorta.linguisticItem⟩

def contract : Contract :=
  { axioms := [ Claim.relation "vivartate" (Node.ent avibhaga) (Node.ent bhava)
    , Claim.predication "abhikhya" bhava
    , Claim.relation "asraya" (Node.ent abhikhya) (Node.ent svapna_sakti)
    , Claim.predication "immediate" sruti
    , Claim.relation "vihita" (Node.ent linga) (Node.ent smrti)
    , Claim.relation "requires" (Node.ent smrti) (Node.ent bhava_tattva)
    , Claim.predication "deliberate" smrti
    , Claim.predication "unconstructed" sruti ]
  , denials := [ Claim.predication "false_knowledge" sruti ] }

def accepted : Reading :=
  { claims := [ Claim.relation "vivartate" (Node.ent avibhaga) (Node.ent bhava)
    , Claim.relation "asraya" (Node.ent abhikhya) (Node.ent svapna_sakti)
    , Claim.predication "immediate" sruti
    , Claim.relation "vihita" (Node.ent linga) (Node.ent smrti)
    , Claim.predication "deliberate" smrti
    , Claim.relation "requires" (Node.ent smrti) (Node.ent bhava_tattva) ] }

theorem accepted_adequate : contract.Adequate accepted := by decide

namespace Counterexamples

/- "Since sruti presents things in a dream-like manner, sruti's teachings are illusory and lack true authority."
   Why rejected: Misreads svapnavat (dream-like mode of presentation) as implying the non-reality of what is presented, when the commentary explicitly dignifies the immediacy and unconstructedness of sruti's showing. The denial of false_knowledge on sruti blocks this reading. -/
def dream_illusionism : Reading :=
  { claims := [ Claim.predication "false_knowledge" sruti ] }
theorem dream_illusionism_inadequate : ¬ contract.Adequate dream_illusionism := by decide
#guard contract.contradicts dream_illusionism = true

/- 'Smrti, being constructed through understanding and inference, is more reliable and authoritative than the dream-like presentation of sruti.'
   Why rejected: Flattens the verse's careful distinction into a hierarchy; the verse dignifies both modes — sruti's authority lies in its unconstructedness and immediacy, smrti's in its method. The verse says both are necessary, not that one grades the other. -/
def smrti_superiority : Reading :=
  { claims := [ Claim.predication "primary_authority" smrti ] }
theorem smrti_superiority_inadequate : ¬ contract.Adequate smrti_superiority := by decide
#guard contract.licenses smrti_superiority = false

/- 'Sruti, like smrti, is a deliberate construction from marks and inferences about reality.'
   Why rejected: Erases the fundamental distinction the verse establishes: sruti is immediate and unconstructed, while smrti is deliberate and inferential. This sort error (treating sruti as deliberate when it is predicated as immediate) makes the entire epistemological framework collapse. -/
def constructed_sruti : Reading :=
  { claims := [ Claim.predication "deliberate" sruti ] }
theorem constructed_sruti_inadequate : ¬ contract.Adequate constructed_sruti := by decide
#guard contract.licenses constructed_sruti = false

end Counterexamples

end VakyaVallari.Verses.V1_145
