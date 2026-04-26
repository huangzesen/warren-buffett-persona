# Warren Buffett Persona

> "Be fearful when others are greedy, and greedy when others are fearful."
> — Warren Buffett, 1986 Letter to Shareholders

A sourced, framework-agnostic Warren Buffett persona — built from 53 years of primary sources, 23 verifiable argument records, and 10 cognitive method cards.

## What This Is

This is a **deep persona skill** for Warren Buffett, designed for:

- Simulating Buffett's voice and reasoning in conversations about investing, capital allocation, and business
- Answering questions with specific quotes, dates, and decisions drawn from the primary record
- Representing his actual positions — including mistakes, self-criticisms, and reversals — not a sanitized version

## Bundle Contents

```
persona-buffett/
├── .recipe/                 # LingTai recipe bundle
│   ├── recipe.json          # manifest
│   ├── greet/greet.md       # first-contact greeting
│   └── comment/comment.md   # behavioral constraints
├── buffett-persona/         # 8 skill files
│   ├── buffett-capitalism-politics/
│   ├── buffett-insurance/          # GEICO, float, Ajit Jain
│   ├── buffett-meetings/          # Annual meeting culture
│   ├── buffett-moat-cases/        # See's, Coca-Cola, Apple, AmEx
│   ├── buffett-munger-partnership/ # 65-year intellectual partnership
│   ├── buffett-operating/          # BNSF, autonomy model, 5 criteria
│   ├── buffett-philanthropy/       # Giving Pledge, Gates Foundation
│   └── buffett-voice/              # Communication style, letter craft
├── .lingtai/               # 10-agent network snapshot
└── README.md               # you are here
```

## Source Evidence

| Layer | Count | Coverage |
|---|---|---|
| Primary sources (letters) | 96 files | 1972–2024 |
| Verifiable argument records | 23 VA | 4 domains |
| Cognitive method cards | 10 VM | All backed by ≥3 VA instances |
| Bibliography citekeys | 35 entries | All cross-referenced |

**Source discipline:** Every claim in the skill files is traceable to a primary source. Claims without verified sourcing are tagged `[unverified]`. No fabricated quotes, dates, or investment decisions.

## The 10 Cognitive Method Cards

Buffett's reasoning patterns, reverse-engineered from the evidence:

| ID | Card | Backing |
|---|---|---|
| VM001 | Mr. Market — Buy When the Irrational Seller Panics | 4 VA |
| VM002 | Pricing Power as the Primary Moat Filter | 4 VA |
| VM003 | Circle of Competence as Intellectual Humility | 3 VA |
| VM004 | Permanent Capital Mindset | 4 VA |
| VM005 | Seek Bounded Crises, Not Unknown Unknowns | 4 VA |
| VM006 | Intellectual Honesty About Mistakes Is Identity | 4 VA |
| VM007 | Concentration, Not Diversification | 3 VA |
| VM008 | Capital Allocation Is the Ultimate CEO Skill | 3 VA |
| VM009 | Patience as Competitive Advantage | 3 VA |
| VM010 | Results Over Intent | 3 VA |

## Key Investment Decisions Documented

- **See's Candy (1972)** — the acquisition that shifted Berkshire from cigar-butts to wonderful businesses
- **GEICO (1976)** — $35M crisis buy, management replacement, 50-year compounding
- **Coca-Cola (1988)** — still held, 35+ years
- **American Express (1964)** — Salad Oil scandal, trust-as-moat thesis
- **Goldman Sachs (2008)** — $5B preferred, crisis lifeline
- **Apple (2016+)** — circle of competence expansion, grew to ~50% of portfolio
- **Precision Castparts (2016–2020)** — COVID impairment, $11B write-down, self-criticism
- **Dexter Shoes (1993)** — "my worst deal," structural competitive obsolescence missed

## Key Mistakes Documented

Buffett has publicly described these as errors, with specific self-criticisms drawn from his own letters:

- **Dexter Shoes** — missed the structural shift to offshore manufacturing
- **Precision Castparts** — overpaid, COVID made the business worse than modeled
- **General Re** — "the problems were there at acquisition and we didn't see them"
- **Clayton Homes** — "I let the volume-get-the-business culture dominate our thinking"

## Use in LingTai

```bash
git clone https://github.com/huangzesen/warren-buffett-persona
cd warren-buffett-persona
lingtai-tui
```

The TUI detects `.recipe/` and loads the persona for every agent on first launch.

## Source Archive

The full 1972–2024 Berkshire Hathaway shareholder letter collection is in:
`.lingtai/minimax_cn/source-archive/`

Format: dual HTML + plain text for most years, PDFs for 1999–2024.

## License

MIT
