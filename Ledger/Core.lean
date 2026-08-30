namespace Ledger

/-- An interpretation of quantum mechanics, encoded as its distinguishing
axioms. Parameterized models (CSL, GRW, ...) extend this with their own
fields — see `Ledger.Interpretations.CSL` for the pattern. -/
structure Interpretation where
  name : String
  hasCollapse : Bool
  isLocal : Bool
  isDeterministic : Bool
  deriving Repr

/-- The falsification pattern used throughout this repo: an interpretation
is falsified relative to an asserted experimental hypothesis `P` if the
combination of its axioms and `P` derives `False`.

`P` is never derived by this repo — it's an asserted premise sourced from
a specific entry in the survey database. Lean can't measure anything;
formalizing that an experiment happened is a modeling choice, not a proof. -/
def Falsified (_I : Interpretation) (P : Prop) : Prop := P → False

end Ledger
