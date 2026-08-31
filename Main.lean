import Ledger

open Ledger

def main : IO Unit := do
  IO.println (summarizeFamily "Objective Collapse" ObjectiveCollapse.all)
  IO.println ""
  IO.println (summarizeFamily "Simulation Theory" SimulationTheory.all)
  IO.println ""
  match falsificationRate ObjectiveCollapse.all with
  | some r => IO.println s!"Objective Collapse falsification rate (of falsifiable claims): {r}"
  | none   => IO.println "Objective Collapse: no falsifiable claims on record"
  match falsificationRate SimulationTheory.all with
  | some r => IO.println s!"Simulation Theory falsification rate (of falsifiable claims): {r}"
  | none   => IO.println "Simulation Theory: no falsifiable claims on record"
