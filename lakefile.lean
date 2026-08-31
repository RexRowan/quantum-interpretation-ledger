import Lake
open Lake DSL

package «quantum-interpretation-ledger» where
  -- no extra config needed yet

@[default_target]
lean_lib «Ledger» where

@[default_target]
lean_exe «ledger» where
  root := `Main
