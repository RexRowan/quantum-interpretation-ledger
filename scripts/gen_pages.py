#!/usr/bin/env python3
"""Regenerate docs/index.html (the GitHub Pages site) from manifest.yaml.

Usage: python scripts/gen_pages.py

manifest.yaml remains the single source of truth. This script only adds a
family grouping (QM interpretation vs. simulation-theory signature) on top
of each entry's `class`, purely for page layout — that grouping mirrors
README.md's "Axiom-set families" section and isn't stored in the manifest
itself. Run this after editing manifest.yaml; CI checks the file is in
sync (see CONTRIBUTING.md).
"""
import datetime
import html
import pathlib
import sys

try:
    import yaml
except ImportError:
    sys.exit("PyYAML required: pip install pyyaml --break-system-packages")

ROOT = pathlib.Path(__file__).resolve().parent.parent
MANIFEST = ROOT / "manifest.yaml"
OUT = ROOT / "docs" / "index.html"

FAMILY_BY_CLASS = {
    "no-collapse": "QM interpretations",
    "objective-collapse": "QM interpretations",
    "objective-collapse-gravity": "QM interpretations",
    "observer-dependent-facts": "QM interpretations",
    "hidden-variables": "QM interpretations",
    "lattice-discretization": "Simulation-theory signatures",
    "computational-constraint": "Simulation-theory signatures",
    "philosophical-argument": "Simulation-theory signatures",
}

FAMILY_ORDER = ["QM interpretations", "Simulation-theory signatures"]

STATUS_META = {
    "falsified": ("falsified", "var(--verdigris)", "A Lean theorem derives a contradiction from this axiom-set plus a cited experimental result."),
    "pending": ("pending", "var(--brass)", "Falsifiable in principle; no Lean formalization exists yet."),
    "constrained": ("constrained", "var(--rust)", "A relevant experimental result exists in the literature but isn't yet encoded as a Lean falsification."),
    "out-of-scope": ("out of scope", "var(--slate)", "Not falsifiable by this method (e.g. empirically equivalent to standard QM); tracked for completeness."),
}


def esc(s: str) -> str:
    return html.escape(s, quote=False)


def entry_html(e: dict) -> str:
    status = e["status"]
    label, color, _ = STATUS_META.get(status, (status, "var(--slate)", ""))
    basis = e.get("theorem") or e.get("note", "")
    theorem_line = ""
    if e.get("theorem"):
        theorem_line = f'<div class="entry-theorem">{esc(e["theorem"])}</div>'
    return f"""
      <div class="entry">
        <div class="entry-head">
          <span class="dot" style="background:{color}"></span>
          <span class="entry-name">{esc(e['name'])}</span>
          <span class="entry-status" style="color:{color}">{label}</span>
        </div>
        {theorem_line}
        <p class="entry-note">{esc(e.get('note', ''))}</p>
      </div>"""


def class_html(cls: str, entries: list[dict]) -> str:
    rows = "\n".join(entry_html(e) for e in entries)
    return f"""
    <section class="class-group">
      <h3>{esc(cls)}</h3>
      {rows}
    </section>"""


def family_html(family: str, entries: list[dict]) -> str:
    by_class: dict[str, list[dict]] = {}
    for e in entries:
        by_class.setdefault(e["class"], []).append(e)
    classes = "\n".join(class_html(c, es) for c, es in by_class.items())
    return f"""
  <section class="family">
    <h2>{esc(family)}</h2>
    {classes}
  </section>"""


def build_page(entries: list[dict]) -> str:
    counts = {"falsified": 0, "pending": 0, "constrained": 0, "out-of-scope": 0}
    for e in entries:
        counts[e["status"]] = counts.get(e["status"], 0) + 1
    total = len(entries)
    tally = (
        f"{total} claims tracked: {counts['falsified']} falsified, "
        f"{counts['constrained']} constrained, {counts['pending']} pending, "
        f"{counts['out-of-scope']} out of scope."
    )

    by_family: dict[str, list[dict]] = {}
    for e in entries:
        fam = FAMILY_BY_CLASS.get(e["class"], "Other")
        by_family.setdefault(fam, []).append(e)

    families_html = "\n".join(
        family_html(fam, by_family[fam]) for fam in FAMILY_ORDER if fam in by_family
    )
    # any classes not in the map fall through here
    leftover = [fam for fam in by_family if fam not in FAMILY_ORDER]
    if leftover:
        families_html += "\n".join(family_html(fam, by_family[fam]) for fam in leftover)

    legend_items = "\n".join(
        f'<span class="legend-item"><span class="dot" style="background:{color}"></span>{label}</span>'
        for label, color, _ in STATUS_META.values()
    )

    generated = datetime.date.today().isoformat()

    return f"""<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>quantum-interpretation-ledger</title>
<meta name="description" content="A formal falsification checker, in Lean 4, for interpretations of quantum mechanics and simulation-theory signatures.">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Spectral:wght@400;500;600&family=IBM+Plex+Mono:wght@400;500&display=swap" rel="stylesheet">
<style>
  :root {{
    --ink: #11151A;
    --ink-raised: #171C22;
    --paper: #DAD9D3;
    --paper-dim: #9AA0A6;
    --rule-red: #8B3A3A;
    --verdigris: #6FC3A8;
    --brass: #D8B24A;
    --rust: #C97A48;
    --slate: #8B93A0;
  }}
  * {{ box-sizing: border-box; }}
  html {{ background: var(--ink); }}
  body {{
    margin: 0;
    background: var(--ink);
    color: var(--paper);
    font-family: 'Spectral', Georgia, serif;
    line-height: 1.6;
    -webkit-font-smoothing: antialiased;
  }}
  a {{ color: var(--paper); }}
  a:focus-visible, button:focus-visible {{ outline: 2px solid var(--brass); outline-offset: 2px; }}
  .page {{
    max-width: 760px;
    margin: 0 auto;
    padding: 3.5rem 1.5rem 5rem 2.25rem;
    border-left: 2px solid var(--rule-red);
    margin-left: max(1rem, calc(50% - 380px - 2px));
  }}
  @media (max-width: 820px) {{
    .page {{ margin-left: 1rem; padding-left: 1.5rem; }}
  }}
  header h1 {{
    font-weight: 600;
    font-size: 2rem;
    margin: 0 0 0.4rem 0;
    letter-spacing: -0.01em;
  }}
  header p.tagline {{
    margin: 0 0 1.4rem 0;
    color: var(--paper-dim);
    max-width: 60ch;
  }}
  .tally {{
    font-family: 'IBM Plex Mono', ui-monospace, monospace;
    font-size: 0.85rem;
    color: var(--paper-dim);
    margin: 0 0 1.6rem 0;
  }}
  .legend {{
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
    font-family: 'IBM Plex Mono', ui-monospace, monospace;
    font-size: 0.78rem;
    color: var(--paper-dim);
    margin-bottom: 2.6rem;
    padding-bottom: 1.6rem;
    border-bottom: 1px solid #262C33;
  }}
  .legend-item {{ display: inline-flex; align-items: center; gap: 0.45rem; }}
  .dot {{
    display: inline-block;
    width: 8px;
    height: 8px;
    border-radius: 50%;
    flex: none;
  }}
  .family {{ margin-bottom: 2.8rem; }}
  .family h2 {{
    font-size: 1.15rem;
    font-weight: 600;
    margin: 0 0 1.2rem 0;
    color: var(--paper);
  }}
  .class-group {{ margin-bottom: 1.8rem; }}
  .class-group h3 {{
    font-family: 'IBM Plex Mono', ui-monospace, monospace;
    font-weight: 400;
    font-size: 0.78rem;
    color: var(--paper-dim);
    margin: 0 0 0.9rem 0;
  }}
  .entry {{
    padding: 0.9rem 0 0.9rem 0;
    border-bottom: 1px solid #1D232B;
  }}
  .entry:last-child {{ border-bottom: none; }}
  .entry-head {{
    display: flex;
    align-items: baseline;
    gap: 0.55rem;
    flex-wrap: wrap;
  }}
  .entry-name {{ font-weight: 500; font-size: 1.02rem; }}
  .entry-status {{
    font-family: 'IBM Plex Mono', ui-monospace, monospace;
    font-size: 0.75rem;
    margin-left: auto;
  }}
  .entry-theorem {{
    font-family: 'IBM Plex Mono', ui-monospace, monospace;
    font-size: 0.78rem;
    color: var(--verdigris);
    margin-top: 0.35rem;
  }}
  .entry-note {{
    margin: 0.5rem 0 0 0;
    color: var(--paper-dim);
    font-size: 0.94rem;
    max-width: 68ch;
  }}
  footer {{
    margin-top: 3.5rem;
    padding-top: 1.6rem;
    border-top: 1px solid #262C33;
    font-family: 'IBM Plex Mono', ui-monospace, monospace;
    font-size: 0.78rem;
    color: var(--paper-dim);
  }}
  footer a {{ color: var(--paper-dim); text-decoration-color: #3A4048; }}
  footer p {{ margin: 0.3rem 0; }}
</style>
</head>
<body>
  <div class="page">
    <header>
      <h1>quantum-interpretation-ledger</h1>
      <p class="tagline">A formal falsification checker, written in Lean 4, for interpretations of quantum mechanics and simulation-theory signatures. An entry closes only when a Lean theorem derives a contradiction from its axioms plus a cited experimental result &mdash; nothing here is marked falsified on informal argument alone.</p>
      <p class="tally">{esc(tally)}</p>
    </header>

    <div class="legend">
      {legend_items}
    </div>
{families_html}

    <footer>
      <p>Generated {generated} from <a href="../manifest.yaml">manifest.yaml</a>, the single source of truth for status.</p>
      <p><a href="https://github.com/RexRowan/quantum-interpretation-ledger">github.com/RexRowan/quantum-interpretation-ledger</a></p>
    </footer>
  </div>
</body>
</html>
"""


def main() -> None:
    entries = yaml.safe_load(MANIFEST.read_text())
    OUT.parent.mkdir(exist_ok=True)
    OUT.write_text(build_page(entries))
    print(f"Regenerated {OUT}")


if __name__ == "__main__":
    main()
