#!/usr/bin/env python3
"""Regenerate the table in RESULTS.md from manifest.yaml.

Usage: python scripts/gen_results.py

Replaces everything between the BEGIN/END TABLE markers in RESULTS.md.
Run this after updating manifest.yaml; CI checks the file is in sync.
"""
import pathlib
import sys

try:
    import yaml
except ImportError:
    sys.exit("PyYAML required: pip install pyyaml --break-system-packages")

ROOT = pathlib.Path(__file__).resolve().parent.parent
MANIFEST = ROOT / "manifest.yaml"
RESULTS = ROOT / "RESULTS.md"

STATUS_SYMBOL = {
    "falsified": "✅ Falsified",
    "pending": "⏳ Pending",
    "constrained": "⚠️ Constrained",
    "out-of-scope": "🚫 Out of scope",
}

BEGIN = "<!-- BEGIN TABLE -->"
END = "<!-- END TABLE -->"


def build_table(entries: list[dict]) -> str:
    lines = [
        BEGIN,
        "| Interpretation | Class | Status | Basis / theorem |",
        "|---|---|---|---|",
    ]
    for e in entries:
        status = STATUS_SYMBOL.get(e["status"], e["status"])
        basis = e.get("theorem") or e.get("note", "")
        lines.append(f"| {e['name']} | {e['class']} | {status} | {basis} |")
    lines.append(END)
    return "\n".join(lines)


def main() -> None:
    entries = yaml.safe_load(MANIFEST.read_text())
    table = build_table(entries)

    text = RESULTS.read_text()
    if BEGIN not in text or END not in text:
        sys.exit(f"Markers {BEGIN}/{END} not found in {RESULTS}")

    before = text.split(BEGIN)[0]
    after = text.split(END)[1]
    RESULTS.write_text(before + table + after)
    print(f"Regenerated {RESULTS}")


if __name__ == "__main__":
    main()
