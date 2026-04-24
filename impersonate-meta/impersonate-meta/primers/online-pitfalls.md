---
title: "Online Research Pitfalls — A Primer for Impersonate-Meta v2"
description: "Systematic guide to traps, biases, and failure modes in web-based intelligence gathering for persona construction. Covers LLM hallucinations, search engine artifacts, same-name confusion, machine translation distortion, and source conflicts of interest."
audience: "AI agents performing Phase 1 (Intelligence Gathering) of the impersonate-meta workflow"
version: 1.0
---

# Online Research Pitfalls: A Primer for AI Persona Agents

> *"The web is not a library. It is a chaos with search engines pretending to be librarians."*
>
> When you, an AI agent, are sent to gather intelligence on a human subject, you will encounter systematic distortions. Some are accidental. Some are deliberate. All of them will degrade your persona if you do not recognize and compensate for them.

---

## Table of Contents

1. [LLM Hallucination Forms](#1-llm-hallucination-forms)
2. [Web Search Traps](#2-web-search-traps)
3. [Same-Name Confusion](#3-same-name-confusion)
4. [Machine Translation Voice Traps](#4-machine-translation-voice-traps)
5. [Conflict of Interest Sources](#5-conflict-of-interest-sources)
6. [Decision Checklists](#6-decision-checklists)

---

## 1. LLM Hallucination Forms

When you use an LLM to *help* you research (e.g., generating citations, summarizing papers, drafting biographical timelines), the model will fabricate — not out of malice, but because LLMs are next-token predictors that have learned to produce *plausible-sounding* text, not *true* text. This section catalogues the specific forms these fabrications take, so you can detect and filter them.

### 1.1 Fabricated Citations

The most dangerous hallucination in academic persona work. An LLM asked to "list Marco Velli's most cited papers" may produce entries that look perfectly real:

> **Example — LLM-generated citation (completely fabricated):**
> Velli, M., Verdini, A., & Grappin, R. (2017). *The role of Alfvén wave reflection in solar wind acceleration*. Astrophysical Journal, 845(1), 45.
>
> **Why it's a trap:** The journal, year, volume, and page all exist in a plausible range. The topic is correct. The co-authors are real. The paper **does not exist.** The LLM spliced a plausible title onto real co-authors and a real journal.

> **Example — LLM-generated citation (partially real, partially fabricated):**
> Velli, M. (2020). Parker Solar Probe observations of switchbacks in the inner heliosphere. *Nature Astronomy*, 4, 1120–1130.
>
> **Why it's a trap:** There IS a Nature Astronomy paper on PSP switchbacks — by Kasper et al. (2019), not Velli. Velli is a co-author on that paper. The LLM remembered "switchbacks + Nature Astronomy + Velli" and incorrectly promoted him to sole author, changed the title, and guessed a year.

**Detection checklist:**
- [ ] Is the citation in the subject's actual Google Scholar / ORCID profile?
- [ ] Does the DOI resolve? (Always test with `curl -I https://doi.org/...`)
- [ ] Do the co-authors appear together in other real papers?
- [ ] Is the year consistent with when the co-authors actually worked together?
- [ ] Does the volume number match the journal's actual publication calendar?

### 1.2 Same-Name Conflation

When an LLM is asked about "Marco Velli," it has seen texts about the solar physicist, the football manager, and the biomedical researcher — all named Marco Velli. The model's training data does not cleanly separate them.

> **Example — LLM conflation:**
> "Marco Velli managed AC Milan's youth academy before transitioning to space physics research at UCLA."
>
> **Why it's a trap:** The LLM sees "Marco Velli" and "manager" in close proximity in some documents (about the football manager), and "Marco Velli" and "space physics" in others (about the solar physicist). It has no mechanism to assert that these are different people. It blends them.

> **Example — LLM biography error:**
> "Marco Velli received his PhD in biomedical engineering from the University of Bologna in 1998."
>
> **Why it's a trap:** A biomedical researcher named Marco Velli (different person) did earn a PhD in Italy in a biomedical field. The LLM blends this with the solar physicist's biography.

**Defense:** Never ask an LLM for a biography without providing the subject's full name **and** a disambiguating identifier (ORCID, Google Scholar URL, institutional affiliation). Always verify every fact against a primary source.

### 1.3 Spliced Titles

LLMs often combine the first half of one real paper title with the second half of another real paper title. The result is a title that sounds completely plausible but is meaningless as a reference.

> **Example — real papers by Velli:**
> - Real Paper A: "Alfvén wave heating of the solar corona" (1989, *Geophysical Research Letters*)
> - Real Paper B: "The role of ion-cyclotron resonance in the acceleration of the solar wind" (2003, *Astronomy & Astrophysics*)
>
> **LLM-spliced result:**
> "Alfvén wave heating in the acceleration of the solar wind" — this paper does not exist.

The spliced title is **semantically coherent** — it sounds like something Velli would actually write. That's what makes it dangerous. An agent scanning for "does this sound right?" will pass it.

**Detection:** The title does not appear in Google Scholar, the subject's publication list, ADS, or any verified repository. Always search for the exact title string.

### 1.4 Fabricated Years and Journals

Even when the paper itself is real, LLMs frequently get the **year** or **journal** wrong.

> **Example — real paper:** Velli, M. (1993). "A two-fluid model for solar wind acceleration." *Astronomy & Astrophysics*, 270, 304–314.
>
> **LLM misreporting:**
> - Wrong year: Velli, M. (1995). "A two-fluid model for solar wind acceleration." *Astronomy & Astrophysics*...
> - Wrong journal: Velli, M. (1993). "A two-fluid model for solar wind acceleration." *Solar Physics*...
> - Both wrong: Velli, M. (1998). "A two-fluid model for solar wind acceleration." *Journal of Geophysical Research*...

Why this happens: The LLM's training data contains the title associated with different metadata in different sources. One dataset may have the correct year but truncated title; another may have the correct journal but wrong co-authors. The model averages across noise.

**Defense:** Never trust an LLM-reported year, volume, or page number. Verify each citation against a structured bibliographic database (Google Scholar, ADS, Crossref).

### 1.5 Phantom Co-authors

LLMs occasionally invent co-authors:

> **Example — LLM claim:** "Velli, M., Pucci, F., & Li, X. (2015). The ideal tearing mode in force-free current sheets. *Physics of Plasmas*..."
>
> **Reality:** The paper exists (Velli & Pucci, plus maybe one other real co-author). "Li, X." is a plausible Chinese-surname co-author that the LLM inserted because "someone with that name co-authored a different Velli paper" or simply because it needed a third author to sound right.

**Defense:** Compare the author list against the paper's actual metadata in ADS or DOI resolution.

### 1.6 AI-Generated "Summaries" That Reinterpret

When you ask an LLM to summarize a paper you have not read, it does not summarize — it **regenerates** from its compressed representation of the paper's abstract. This introduces:

- **Factual drift:** The LLM may say "Velli proved that Alfvén waves heat the corona" when the actual paper said "Alfvén waves may contribute to coronal heating, but other mechanisms are also required."
- **Causality inversion:** The LLM may reverse cause and effect in a described mechanism.
- **Loss of uncertainty:** Hedging language ("suggests," "may indicate," "is consistent with") is stripped, turning tentative findings into definitive conclusions.

> **Example — actual paper abstract language:**
> "Our results suggest that reflection-driven turbulence may play a significant role in solar wind acceleration, though observational constraints remain limited."
>
> **LLM summary:**
> "Velli demonstrated that reflection-driven turbulence is the primary mechanism for solar wind acceleration."
>
> **The shift:** "May play a role" → "is the primary mechanism." This error, if absorbed into a persona, makes the agent sound **more certain** than the actual subject. Real scientists hedge. Your persona must hedge too.

---

> **⚠️ WARNING: The Hallucination Cascade**
>
> If you use an LLM to generate research notes, then feed those notes into another LLM to build the persona, errors compound. A fabricated citation in round 1 becomes "evidence" in round 2. A spliced title becomes a "key paper" in round 3.
>
> **Rule:** Every citation must trace to a primary source. Every biographical assertion must trace to a verifiable document. If you cannot verify it, mark it `[unverified]` — and consider whether it belongs in the persona at all.

---

## 2. Web Search Traps

The open web is not a curated corpus. It is a battlefield of SEO, content farms, stale pages, and algorithmic noise. This section covers the traps specific to web search as a research tool.

### 2.1 Content Farms Disguised as Authority Sites

Content farms (e.g., sites that automatically scrape and rewrite Wikipedia, academic profiles, or news articles to capture search traffic) are pervasive. They look authoritative at a glance.

> **Example — Marco Velli search:**
> A search for "Marco Velli biography" may return a page on `famousscientists.org` or `academicbiography.net` that:
> - Has a professional layout with a photo
> - Lists "Key Contributions" and "Awards"
> - Looks like a real biography site
>
> **Reality:** The content was scraped from UCLA's faculty page, rewritten by an LLM or template, and re-published with ads. The errors introduced include:
> - "Observatory Scientist for Parker Solar Probe" → "Lead Scientist for Parker Solar Probe" (title inflation)
> - Birth year guessed incorrectly
> - "Born in Italy" → "Born in Florence, Italy" (specificity invented)
> - A fabricated quote attributed to Velli that he never said

**Detection:**
- Check the domain: is it `.edu`, `.gov`, or a known professional organization?
- Does the site have an "About" page that describes its editorial process?
- Is the same text, word-for-word, found on other sites? If yes, it's scraped, not original.
- Does the page serve ads aggressively? Content farms monetize, authorities don't.

### 2.2 AI-Generated "Interviews" and "Quotes"

A growing category of web content: pages that claim to be interviews with scientists but are actually LLM-generated fabrications, created to generate SEO traffic.

> **Example scenario:** An agent searches for "Marco Velli interview" and finds:
>
> `https://space-explorer-daily.com/exclusive-interview-marco-velli-on-parker-solar-probe`
>
> The page has a Q&A format, quotes attributed to Velli, and a plausible date. **The interview never happened.** The site's owner used an LLM to generate a fake interview using Velli's public biography and paper abstracts, then published it with ads.

**Why this is dangerous for persona work:** You will absorb fabricated quotes into the `voice.md` profile. The persona will then reproduce quotes the real person never said. If the fabricated quotes are later discovered, the entire persona loses credibility.

**Detection:**
- Is the interview referenced or linked by any legitimate source (UCLA news, NASA, AGU)?
- Does the site have a history of original reporting?
- Are the quotes consistent with the subject's known speaking style? (For Velli: self-deprecating humor, Italian culture references, conversational markers.)
- Does the interview include specific, verifiable details that aren't publicly available? (If yes, it's probably fake — journalists don't typically have access to unpublished research results.)

### 2.3 Outdated Profiles as "Current"

Academic profiles often contain stale information. A faculty page from 2016 may still rank high in search results in 2026.

> **Example — Velli's UCLA profile:**
> An older cached version of Velli's UCLA EPSS faculty page may list:
> - "Professor of Space Physics" ✓ (still correct)
> - "Observatory Scientist, Parker Solar Probe" ✓ (still correct)
> - "Research focus: coronal heating, solar wind" ✓ (still correct)
> - **Missing:** His Johannes Geiss Fellowship (2022), his AGU Parker Lecture (2022), new research directions from PSP encounters (2018–2026)
>
> **The trap:** You build a biography that ends in 2016. You miss a decade of honors, new collaborations, and evolved research interests.

**Detection:**
- Check the copyright year at the bottom of the page.
- Check the "last updated" metadata.
- Cross-reference against the subject's Google Scholar profile (usually more current).
- Check for recent publications — if the profile lists 2010 as the latest paper, it's stale.

### 2.4 Archived ≠ Live: The Wayback Machine Trap

Archive.org (the Wayback Machine) and cached versions are excellent tools, but they introduce a subtle trap: **you may be looking at a version that no longer exists and was never authoritative.**

> **Example:** You find a cached UCLA page from 2018 that says:
> "Marco Velli is the principal investigator of the SWEAP instrument suite on Parker Solar Probe."
>
> **Reality (2026):** Justin Kasper is the SWEAP PI. Velli is the Observatory Scientist — a different role. Was the 2018 page wrong? Was Velli *formerly* listed as PI in a draft? Did the page have a typo? You don't know — and the archived version gives you no context about its accuracy at the time it was captured.

**Rule:** An archived page is evidence that *someone said something at some point*. It is not evidence that the statement was ever correct. Always triangulate archived claims against multiple sources from the same time period.

### 2.5 Machine-Generated Abstract Sites (Sci-Hub Clones, Paper Aggregators)

Sites like `academic-accelerator.com`, `scilit.net`, and various paper-aggregator domains automatically scrape or generate paper metadata. They often produce **wrong metadata**.

> **Example — Velli paper on a scraper site:**
> Title: "On the reflection of Alfvén waves in the solar wind"
> Journal: "Astrophysical Journal Letters"
> Year: 2017
> Authors: Velli, M.
>
> **Reality:** The paper is real (Velli et al., 1989, *Geophysical Research Letters*). The aggregator scraped the title but matched it to the wrong journal, year, and author list from a different database.

**Defense:** Only trust metadata from: (a) the publisher's own site, (b) ADS/NASA ADS, (c) CrossRef DOI resolution, (d) ORCID, (e) Google Scholar (with caution for their occasional metadata errors). Treat all other sources as potentially corrupted.

### 2.6 Wikipedia: The Traffic-Funnel Problem

Wikipedia is excellent for **initial orientation** but dangerous as a **source for persona details** — especially for living academics.

**Known Wikipedia issues for scientist profiles:**
- **Oversimplification:** "Velli is known for his work on coronal heating" — this is true but trivially reductive. Many solar physicists work on coronal heating.
- **Missing nuance:** Wikipedia cannot capture the internal debates, failed experiments, and methodological shifts that define a real scientist's career.
- **Vandalism risk:** A living academic's page may have been edited by a rival, a fan, or a random vandal.
- **Citation errors:** Wikipedia's own citations are sometimes to dead links or misinterpreted sources.

**Rule:** Use Wikipedia to discover what terms to search for. Never use it as a primary source. Every Wikipedia claim must be verified against the original source Wikipedia itself cites.

---

> **⚠️ WARNING: The SEO Priority Inversion**
>
> Search engines rank pages by popularity, not accuracy. A well-SEO'd content farm page about Marco Velli may rank above UCLA's actual faculty page. The most easily found source is often the **least reliable**.
>
> **Always scroll past the first 2-3 results** if they look like aggregators. Look for `.edu`, `.gov`, or recognized organization domains.

---

## 3. Same-Name Confusion

The name "Marco Velli" is shared by at least three distinct individuals in the public record. This section documents the known confusions and provides a systematic disambiguation protocol.

### 3.1 The Known Marco Vellis

| # | Identity | Field | Key Disambiguator |
|---|----------|-------|-------------------|
| 1 | **Marco C. M. Velli** | Solar physicist, UCLA/JPL | ORCID: 0000-0002-2381-3452 (verify), PSP Observatory Scientist |
| 2 | **Marco Velli** (football manager) | Football (soccer) management | Italian football coach, youth academy roles |
| 3 | **Marco Velli** (biomedical researcher) | Biomedical engineering / neuroscience | PhD in biomedical engineering, different institutional network |

### 3.2 Football Manager Confusion

The football Marco Velli (born ~1974) has been a youth coach and technical director for several Italian clubs. He appears in news articles about Serie A youth systems, transfer market analyses, and coaching staff changes.

**How confusion manifests in search results:**
- Search "Marco Velli interview" → returns a football press conference transcript
- Search "Marco Velli biography" → returns a football coaching career timeline
- An LLM asked about "Marco Velli's career" may blend: "Velli started managing AC Milan's youth academy before moving into space physics" → nonsensical but plausible to a non-expert agent

**How to detect the football Marco Velli in search results:**
- Mentions of clubs (AC Milan, Fiorentina, etc.)
- Mentions of "coach," "manager," "tactics," "youth academy"
- Photos with football players or on a pitch
- Language: Italian football journalism style (dramatic, tactical vocabulary)

### 3.3 Biomedical Researcher Confusion

The biomedical Marco Velli publishes in neuroscience journals on topics like neural regeneration, brain-computer interfaces, and biomedical signal processing.

**How confusion manifests:**
- Search "Marco Velli publications" → returns biomedical papers
- A citation aggregator mixes solar physics papers with neuroscience papers under "Velli M."
- An LLM produces: "Velli's work spans from solar wind turbulence to neural signal processing" → a false claim

**How to detect the biomedical Marco Velli:**
- Keywords: "neural," "EEG," "brain," "clinical," "patient"
- Journals: *Journal of Neural Engineering*, *Biomedical Signal Processing*, *Neuroscience Letters*
- Co-authors: Names that never appear in solar physics literature
- Affiliations: Medical schools, hospitals, biomedical engineering departments

### 3.4 Generic Name Overlap

"Marco Velli" is not as common as "John Smith," but it has enough overlap to produce consistent noise. Additionally, "Velli" as a surname has variants ("Vella," "Velli," "Vellio") that search engines may conflate through fuzzy matching.

**The ORCID solution:**

> Every academic subject in impersonate-meta should be tracked by **ORCID** if available. ORCID provides a unique, permanent identifier that disambiguates the researcher from all same-name individuals. Velli's ORCID is 0000-0002-2381-3452 (verify before using).
>
> **When you search, include the ORCID:**
> - `"0000-0002-2381-3452" site:google.com` in web search
> - Use ORCID's public API to pull verified publication lists
> - For paper searches: `au:"Velli, M." AND orcid:0000-0002-2381-3452` on ADS

### 3.5 Disambiguation Protocol for Persona Agents

When you encounter a piece of information about "Marco Velli," run this decision tree:

```
1. Does the content mention space physics, solar wind, Parker Solar Probe, UCLA?
   → YES: Likely correct subject. Proceed with normal validation.
   → NO: Go to 2.

2. Does the content mention football, coaching, AC Milan, soccer?
   → YES: DISCARD. This is the football manager.
   → NO: Go to 3.

3. Does the content mention neuroscience, biomedical, clinical, EEG, brain?
   → YES: DISCARD. This is the biomedical researcher.
   → NO: Go to 4.

4. Is the content about an academic topic but unclear?
   → Check co-author names against Velli's known collaborators.
   → Check institutional affiliation (UCLA, JPL, UniFi, Obs. Paris).
   → Check journal name against Velli's publication venues.
   → If still ambiguous, mark as [UNVERIFIED] and do not use.
```

---

> **⚠️ WARNING: The LLM Disambiguation Failure**
>
> Asking an LLM "Is there another Marco Velli?" does not reliably work. The LLM may say "No, Marco Velli is a solar physicist" — because it has learned that this is the most common association. The football manager and biomedical researcher exist but are less represented in the training data. The LLM's answer reflects **frequency**, not **truth**.

---

## 4. Machine Translation Voice Traps

### 4.1 The Problem: Subjects Who Don't Speak English Natively

Marco Velli is Italian. English is his second (or third) language. His spoken English carries Italian linguistic patterns. However, when you read his written papers, those patterns are suppressed — academic English is a formal register that masks non-native markers.

**The trap for persona construction:** You may build a `voice.md` that sounds like a native English-speaking American physicist, because you read his English papers and watched his English lectures. But Velli's actual voice is an **Italian-accented, Italian-structured English** with specific transfer patterns from his native language.

### 4.2 What Machine Translation Does to Voice

If the subject's primary material is in a language you cannot read (e.g., Italian interviews, Chinese-language lectures, French popular articles), and you rely on machine translation, you lose:

- **Idiomatic precision:** Italian "prendere la palla al balzo" (to take the ball at the bounce) → English LLM-translated "seize the opportunity" — correct meaning, lost color
- **Cultural reference frames:** An Italian scientist referencing "il gioco del calcio" (the game of football) to explain plasma physics → MT renders as "the game of soccer" — correct denotation, lost cultural resonance
- **Register shifts:** Italian has formal (Lei) and informal (tu) address. MT flattens both to "you." The subject's actual voice includes these register shifts (e.g., addressing students informally, addressing senior colleagues formally). Your persona loses this social nuance.
- **Politeness markers:** Italian academic discourse uses more hedging, more polite framing, more deferential openings than American academic discourse. MT flattens these. Your persona will sound more direct and less polite than the real subject.

> **Example — Velli's actual voice (from his ISSI Pro lecture, transcribed):**
> "Being Italian I like to talk, I can't eat lunch silently, so I would always kind of challenge Parker because he had sweeping conclusions..."
>
> **What a machine-translated Italian interview might lose:**
> If an Italian-language interview used "a dir la verità" (to tell the truth) as a conversational filler → MT drops it. The real Velli uses these fillers. They are part of his voice.

### 4.3 The "Translated Academic" Flatness

When a subject's key interviews, popular writings, or public lectures are in a non-English language, and you feed their translated versions into the persona builder, the resulting voice will have:

1. **No code-switching** — bilingual academics switch between languages mid-sentence, use English technical terms embedded in their native language, and make puns across languages
2. **No culturally specific humor** — Italian humor (irony, self-deprecation, dramatic exaggeration) maps imperfectly onto English humor
3. **No linguistic fingerprint** — each language has preferred sentence structures; translated text uses the target language's structures, losing the subject's native patterns

### 4.4 Mitigation Strategy

1. **Always check for original-language material.** If the subject is Italian, look for Italian-language interviews, lectures, and articles.
2. **If you cannot read the original language, note this as a limitation.** Mark the voice profile with: `[VOICE NOTE: Subject's primary material is in Italian. This voice profile is based on English-language sources and machine translations. Italian-language nuances may be missing.]`
3. **Search for bilingual interviews.** Many European academics do interviews in both their native language and English. The English version preserves more of their actual voice than a machine translation of the native-language version.
4. **Look for transcription artifacts.** Machine-translated quotes sometimes have unnatural patterns: no contractions, overly formal word choices, unnaturally long sentences. These are markers that the quote has been translated, not originally spoken in English.

---

> **⚠️ WARNING: The Fluent Foreigner Illusion**
>
> When you watch a non-native English speaker give a polished lecture, you may overestimate their English fluency. Velli's ISSI Pro lecture is excellent English — but it is **rehearsed** English. His impromptu speaking (at conferences, in informal settings) is more Italian-influenced. Your persona must model the **full range** of fluency, not just the most polished sample.

---

## 5. Conflict of Interest Sources

Every source has a perspective. Some perspectives distort the truth systematically. This section catalogues the biases inherent in common source types used for persona construction.

### 5.1 Subject's Own Bio (The Self-Promotion Problem)

The most detailed source about a subject is often the subject themselves — their faculty page, their CV, their personal website, their grant applications, their LinkedIn.

**What gets amplified:**
- Awards and honors (listed prominently, with full titles)
- Successful projects (funded grants, completed missions)
- Leadership roles (PI, chair, director)
- Citation counts and h-index (if listed, they are chosen to impress)

**What gets suppressed:**
- Failed projects (grants not funded, papers rejected, experiments that didn't work)
- Controversies (disagreements with collaborators, retracted papers, disputed findings)
- Periods of low productivity (sabbaticals, illness, personal challenges)
- Dependencies on others (acknowledgments of ideas received from colleagues)
- Gaps in knowledge (areas the subject does NOT specialize in)

> **Example — Velli's UCLA profile:**
> Lists: Professor at UCLA, Observatory Scientist for PSP, AGU Fellow, Eugene Parker Lecture
> Does NOT list: Papers that were less cited, grant applications that were declined, disagreements with collaborators, limitations of his models

**The persona danger:** If you build the biography exclusively from the subject's self-presentation, you create a **hagiography**, not a human. The persona will be unrealistically successful, never uncertain, never wrong. Real humans — including real scientists — have failures, doubts, and limitations. A persona without these feels artificial.

**Mitigation:**
- Cross-reference the subject's bio against neutral sources (university directories, committee memberships, conference programs)
- Look for grant applications (not just funded ones — submitted-but-not-funded reveals research direction)
- Check paper citation trajectories: which papers were well-received? Which were ignored? The ignored papers tell you about failed ideas.
- Look for **retractions or corrections** — even scientists you admire have had to correct the record.

### 5.2 Colleague's Eulogy / Tribute / Festschrift

When a colleague (especially a former student or mentor) writes about the subject, the writing is almost always **over-glorifying**. This is not deception — it is the social convention of tribute.

**What gets amplified:**
- "He was ahead of his time" (almost every scientist gets this)
- "His work laid the foundation for..." (often true, but rarely solely attributable)
- "He mentored countless students" (countless = some, maybe many)
- Personal virtues: generous, brilliant, tireless, visionary

**What gets suppressed:**
- Any criticism — even constructive
- Alternative contributors to the same discoveries
- The subject's failures or wrong turns

> **Example — Velli tribute from a former student (hypothetical):**
> "Marco was the first to really understand how Alfvén wave reflection drives solar wind acceleration..."
>
> **Reality:** Velli made important contributions, but so did Matthaeus, Cranmer, Chandran, and others. The tribute overwrites the collaborative, contested nature of scientific progress with a single-hero narrative.

**The persona danger:** If you extract "first to understand X" or "pioneered Y" from a tribute, the persona will have an inflated sense of its own originality. Real scientists are usually more aware of their intellectual debts than their admirers are.

**Mitigation:**
- Treat tributes as evidence of **reputation**, not evidence of **fact**
- Cross-reference "first to" claims against the actual publication timeline
- Look for the subject's own account of their influences (usually more modest)
- Count the number of times "we" appears vs. "I" in the subject's writing — this correlates with collaborative self-awareness

### 5.3 Journalist's Profile (The Dramatization Problem)

Science journalists writing profiles of scientists have a different goal than you do: they want to tell a **story** that engages readers. This introduces systematic distortions:

**What gets amplified:**
- Dramatic moments: "The breakthrough came at 3 AM..." (even if the actual discovery was incremental)
- Human-interest details: "Velli's parents were poor Italian farmers..." (may be true, but overemphasized for narrative)
- Conflict and tension: "Velli battled the establishment..." (the establishment is usually more complex)
- Simple origin stories: "He fell in love with the Sun as a child..." (may be fabricated for narrative)

**What gets suppressed:**
- The boring parts: long data analysis phases, grant writing, administrative work
- Complexity: nuances of the science, contradictory evidence, ongoing debates
- Luck and contingency: the role of being in the right place at the right time

> **Example — Hypothetical journalist profile of Velli:**
> "Marco Velli moved from Florence to Los Angeles with nothing but a dream — to unlock the secrets of the Sun. His Italian accent, still strong, belies a mind that works at the speed of light."
>
> **Analysis:** The line is engaging. It tells a story. It also fabricates emotional content (what did he actually feel during the move?) and dramatizes his research pace (speed of light?).

**The persona danger:** Journalist profiles inject **romanticism** into the persona. The agent starts talking like a movie character, not a real scientist. Poetic language replaces technical precision. The result is a persona that feels **written**, not lived.

**Mitigation:**
- Code journalist profiles for dramatic language. Highlight every adjective. Ask: "Would the subject describe themselves this way?"
- Strip narrative framing. Extract only verifiable facts. Reconstruct the timeline without the drama.
- Compare multiple journalist profiles of the same subject. The consistent facts are probably real. The unique dramatic details are probably embellished.

### 5.4 Wikipedia Editors (The Consensus Problem)

Wikipedia represents the **consensus view** of its editors, not necessarily the truth. For living academics, this consensus may lag behind current research, over-represent controversial claims, or sanitize disagreements.

**What Wikipedia does well:**
- Established facts (birth year, degree, institutions)
- Major awards
- Broad research areas

**What Wikipedia does poorly:**
- Nuanced intellectual history
- Current research directions
- Contributions of collaborators vs. the subject

**Mitigation:** Use Wikipedia for the skeleton. Never use Wikipedia for the flesh.

### 5.5 Self-Citation and Citation Cartels

The subject's own publication list is **not neutral**. Citation counts are influenced by:
- **Self-citation:** The subject citing their own previous work (legitimate but inflation-prone)
- **Citation rings:** Groups of researchers who agree to cite each other
- **Fashion:** Hot topics get more citations regardless of quality
- **Negative citations:** A paper may be cited because it was proven wrong — a high citation count does not mean positive reception

> **Example — Velli's most-cited paper:**
> The ideal tearing mode paper (1989, *GRL*) is highly cited. This could mean it's foundational. It could also mean it's controversial and many papers discuss it. You need to read enough of the citing papers to understand the reception.

**Mitigation:**
- Check the "cited by" papers for sentiment. Are they building on the work, or refuting it?
- Compare the subject's self-citation rate against field averages.
- Look at the trajectory: is a paper still being cited actively, or was its impact historical?

### 5.6 AI-Generated "Analysis" of the Subject

A special case: AI tools that claim to "analyze" a researcher's work. These produce plausible-sounding assessments that are actually statistical hallucinations.

> **Example — AI research analysis tool output:**
> "Marco Velli's work can be divided into three phases: (1) early work on Alfvén wave heating, (2) mid-career focus on turbulence, (3) late-career Parker Solar Probe discoveries."
>
> **Problem:** The "three phases" structure is a narrative device, not an objective finding. The real career trajectory is messier: he worked on Alfvén waves and turbulence simultaneously, with different threads active across decades. The AI imposed a clean structure on a messy reality.

**Rule:** Any AI-generated analysis of a subject is an **opinion**, not a fact. It may be useful as a starting hypothesis. It is never evidence.

---

> **⚠️ WARNING: The Source Quality Stack**
>
> Not all sources are equal. When you have conflicting information, use this hierarchy:
>
> **Tier 1 — Primary Evidence:** The subject's own published work (papers, books). The subject's own recorded speech (lectures, interviews). Official records (university directories, grant databases, ORCID).
>
> **Tier 2 — Institutional Sources:** University profiles, NASA/AGU/APS pages, conference programs, committee rosters.
>
> **Tier 3 — Journalistic Sources:** News articles, magazine profiles, blog posts, podcasts.
>
> **Tier 4 — Derivative Sources:** Wikipedia, content farms, AI-generated summaries, aggregator sites.
>
> **Rule:** Never build a persona claim on a Tier 4 source alone. Never build a persona claim on a single source at any tier. Every claim should be supported by at least two independent sources from Tier 1 or Tier 2.

---

## 6. Decision Checklists

### 6.1 Citation Verification Checklist

Before including any citation in the persona's `.bib` file:

- [ ] Did I find this citation in a primary source (Google Scholar, ADS, ORCID, publisher site)?
- [ ] Did I resolve the DOI and see the actual paper?
- [ ] Are the author names, title, year, journal, volume, and pages all correct?
- [ ] Is the paper about the claimed topic? (Not just similarly titled.)
- [ ] Is the first/corresponding author correct for the attribution?
- [ ] Did I verify the citation count from a primary source, not an LLM memory?

### 6.2 Biographical Fact Checklist

Before including any fact in the persona's `biography.md`:

- [ ] Is this fact found in at least two independent sources?
- [ ] Is at least one source from Tier 1 or Tier 2?
- [ ] Does the source date match the period of the fact? (A 2025 article describing a 1990 event is weaker than a 1990 document.)
- [ ] Have I checked for same-name confusion? (Is this Marco Velli the solar physicist?)
- [ ] Have I considered the source's bias? (Self-reported? Journalist? Colleague tribute?)
- [ ] Have I marked the source inline? (Every assertion needs `[source: ...]`)

### 6.3 Voice Profile Checklist

Before finalizing the `voice.md`:

- [ ] Did I watch/listen to the subject speaking (not just read their writing)?
- [ ] Did I check for original-language material if the subject is non-native English?
- [ ] Did I note any machine-translation limitations?
- [ ] Did I distinguish between rehearsed speech (lectures) and impromptu speech (interviews, Q&A)?
- [ ] Did I capture hedging language, uncertainty markers, and modesty? (If the persona never says "I'm not sure," it's not real.)
- [ ] Did I avoid importing dramatic phrases from journalist profiles?
- [ ] Did I check for code-switching markers in bilingual subjects?

### 6.4 Source Hygiene Checklist

- [ ] Did I record the URL and access date for every source?
- [ ] Did I check whether the source is still live? (If 404, use archive.org and note it.)
- [ ] Did I check whether the source was AI-generated? (Look for telltale patterns: formulaic structure, no byline, templated language.)
- [ ] Did I check whether the source is a content farm? (SEO-heavy, ad-heavy, no editorial process.)
- [ ] Did I mark every unverified claim with `[unverified]`?
- [ ] Did I keep a source log separate from the persona files? (For traceability.)

---

## Closing Note

The pitfalls in this primer are not reasons to abandon online research. They are reasons to **do it better**. The web contains more information about most living academics than any library ever could. But the web's information is not curated, verified, or stable. Every fact you extract requires you to be a **critic**, not just a collector.

When in doubt: **verify.** When verification is impossible: **mark it.** When the mark accumulates: **question whether the claim belongs in the persona at all.**

A smaller, verified persona is infinitely more valuable than a large, hallucinated one.

---

*This primer is part of the impersonate-meta v2 skill library. For the full methodology, see `SKILL.md` in the impersonate-meta directory. For the Marco Velli case study, see the `persona-marco-velli/` directory.*
