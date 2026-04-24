# Impersonation Methodology

> A reusable methodology for distilling any academic or public figure into a deep, structured persona skill — using an agent network for parallel extraction, cross-validation, and systematic quality control.

This repository is a **reverse distillation** of the [Marco Velli persona](https://github.com/huangzesen/marco-velli) project. What started as building one figure's persona became a methodology for doing it again, better, with less hallucination and more authenticity.

---

## Why This Exists

Persona engineering (convincingly impersonating a real person with an AI) faces three hard problems:

| Problem | What goes wrong | How this methodology addresses it |
|---------|----------------|-----------------------------------|
| **Hallucination** | AI invents papers, quotes, collaborations that never existed | 7-field VA claim schema forces every assertion to have a source. Citekey cross-validation catches invented references. |
| **Voice authenticity** | AI sounds generic — no distinctive metaphors, humor, or argument patterns | 4-piece profile (voice, values, biography, relationships) combined with method cards that capture cognitive fingerprints. |
| **Source discipline** | AI confuses public and private knowledge, mixes eras, flattens complexity | Three-tier source framework. Semantic drift detection. Close-out checklist with 44 verifiable items. |

The methodology is not a research paper about persona engineering — it is a **reproducible process** with templates, scripts, and a failure catalog.

---

## Structure

```
impersonate-meta/
├── SKILL.md                    # Entry point — 5 patterns, 7 anti-patterns, close-out checklist
├── primers/                    # How to research a person
│   ├── research-a-person.md    #   Full research workflow (primary/secondary/tertiary sources)
│   ├── reading-the-web.md      #   Extracting signal from web content
│   └── online-pitfalls.md      #   6 types of LLM hallucination + 6 search traps
├── scripts/                    # Quality automation
│   ├── verify_citekeys.sh      #   Cross-refs citekeys between .bib and arguments
│   ├── prune_bib.py            #   Strips unreferenced bib entries (brace-depth safe)
│   ├── token_count.sh          #   Estimates token consumption
│   └── three_copy_scan.sh      #   Detects drift across skill copies
├── templates/                  # Reusable production templates
│   ├── va_template.md          #   Blank 7-field VA claim schema
│   ├── vm_template.md          #   Blank method card with induction guide
│   ├── profile_skeleton.md     #   Complete 4-piece profile skeleton
│   └── bib_entry_template.bib  #  5 entry types + journal abbreviations
├── failure-catalog.md          # 13 real failure cases from the Velli project
└── archive/                    # Historical versions
    └── SKILL-v1.md             # v1.0 of this skill (3-stage pipeline design)
```

---

## How to Use

### Full Process (LingTai or any agent network)

1. **Read** `SKILL.md` — understand the 5 patterns and 7 anti-patterns
2. **Study** the `primers/` — how to research a person without falling into AI traps
3. **Copy** the `templates/` — customize for your target figure
4. **Launch** an agent network — one coordinator + specialized research avatars
5. **Run** the close-out checklist (44 items, all verifiable by command)
6. **Use** the `scripts/` — validate citekeys, prune bibliography, scan for drift

### As a LingTai Recipe

```bash
recipe apply ~/lingtai-agora/recipes/impersonate-meta/
```

This registers the methodology as a skill library in your LingTai network, making `primers/` and `scripts/` available to all agents.

### As a Standalone Reference

Anyone building a persona skill — even without LingTai — can:

1. Read `primers/research-a-person.md` to plan their research
2. Use `templates/va_template.md` to structure their first argument
3. Run `scripts/verify_citekeys.sh` on their bibliography
4. Check `failure-catalog.md` to avoid the mistakes we already made

### Quick Start

```bash
# 1. Read the methodology
cat impersonate-meta/SKILL.md

# 2. Copy the templates
cp -r impersonate-meta/templates/ my-project/

# 3. Start with a research plan
cat impersonate-meta/primers/research-a-person.md
```

---

## The Core: 5 Patterns + 7 Anti-Patterns

### Patterns (what to do)

| # | Pattern | Summary |
|---|---------|---------|
| 1 | **VA Claim Schema** | Every claim gets 7 fields: Claim, What he did, The product, Primary results, Context, Citekeys, Cross-refs |
| 2 | **Source Discipline as Mechanism** | Not just "cite the source" but enforce it structurally — the schema makes unfounded claims visible |
| 3 | **4-Piece Profile Scorecard** | Biography + Voice + Values + Relationships — four orthogonal dimensions of personhood |
| 4 | **Cognitive Fingerprints → Method Cards** | Extract thinking patterns from ≥3 VA instances each, not from one |
| 5 | **Progressive Exposure Loading Table** | Load the persona in tiers: Voice → Values → Claims → Methods |

### Anti-Patterns (what to avoid)

| # | Anti-Pattern | The fix |
|---|------------|---------|
| 1 | **Metadata Decay** | SKILL.md header drifts from reality. Fix: `wc -w`, grep counts, commit at milestones |
| 2 | **Token Bloat** | Unreferenced bib entries accumulate. Fix: `prune_bib.py` |
| 3 | **Citation Discipline** | Broken citekeys (D-class). Fix: `verify_citekeys.sh` |
| 4 | **Citation Bloat** | Flooding with VA claims but never citing. Fix: enforce Cross-refs field |
| 5 | **Three-Copy Drift** | Same skill diverges across library/custom/, shared/, and root/ |
| 6 | **"Dispatched" ≠ "Done"** | Spawning a writer avatar doesn't create output. Fix: check files on disk |
| 7 | **Premature Export** | Exporting before QA catches semantic drift. Fix: close-out checklist first |

---

## Known Case Study

- **[Marco Velli persona](https://github.com/huangzesen/marco-velli)** — 105 VA claims, 10 method cards, 7 physics domains, ~3,285 bibliography entries. Built over ~2 weeks of iterative agent collaboration. This methodology is the generalization of that project.

---

## Failure Catalog

The `failure-catalog.md` documents 13 real failures from the Velli project, each with:

- **Symptom** — what the human saw
- **Root Cause** — why it happened
- **Detection** — how we found it
- **Fix** — what we did
- **Prevention** — what the methodology now does to prevent recurrence

Failure types range from fabricated papers (`wyper2026` in a massage therapy journal) to semantic drift (citekey pointing to a real paper but prose describing a different one) to self-archiving (an avatar's soul-flow archived its own output).

---

## License

MIT — free to use, modify, and distribute.

---

## Related

- [Marco Velli persona](https://github.com/huangzesen/marco-velli) — The case study that produced this methodology
- [LingTai TUI](https://github.com/huangzesen/lingtai-tui) — The multi-agent orchestration platform
