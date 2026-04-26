## VA000: [Title — specific claim concisely stated]

**Domain**: physics
**Claim**: [Specific assertion. One sentence. If you see "and", split into two VA entries.]
**What he did**: [Methods, simulations, derivations, observations — actions taken, not conclusions reached]
**The product**: [Paper title, journal, year, volume, pages. Or: lecture, dataset, code, instrument role]
**Primary results**: [Key numbers, scaling laws, figures, or observational quantities — quantitative when possible]
**Context**: [Why it matters. What scientific question it answers. What it replaced or challenged.]
**Citekeys**: [key1, key2]
**Cross-refs**: [VA001, VA002]

---

### Authoring Guidelines

| Field | Guidance | Validator |
|-------|----------|-----------|
| **Claim ID** | Sequential: VA001, VA002, ... across all arguments. Do not reuse. | `grep -c 'Claim ID'` |
| **Claim** | ONE specific, verifiable assertion. Avoid weasel words ("suggests," "may indicate"). | Manual review |
| **What he did** | Past tense. Actions: derived, simulated, observed, collaborated, led, wrote. | Manual review |
| **The product** | Must be identifiable. If a paper: full citation. If a talk: event + title. | Check doi/exists |
| **Primary results** | Numbers first, narrative second. "Found γ = 3/2 scaling" not "discovered important scaling." | Manual review |
| **Context** | Two sentences max: (1) what was known before, (2) what this changed. | Manual review |
| **Citekeys** | Must exist in `.bib` file. 1–3 keys preferred. Never make up a key. | `verify_citekeys.sh` |
| **Cross-refs** | List related VA IDs. Required when one argument builds on another. | Manual review |

### Source Discipline

- Every claim must be traceable to a **published, citable source** or a **recorded lecture/interview** with timestamp.
- If you cannot trace a claim to a source, mark it `⚠️ [unverified]`.
- **No fabricated anecdotes.** If you are unsure, do not include it.
- For voice/behavioral claims from video/audio, use: `[source: URL @ MM:SS]`

### Quality Gates

Before marking a VA entry complete:

- [ ] Claim is ONE assertion (no "and" clauses)
- [ ] Citekeys are real (verified against `.bib`)
- [ ] Primary results are **quantitative** where possible
- [ ] Cross-refs filled (not empty)
- [ ] Context answers "why does this matter?"
