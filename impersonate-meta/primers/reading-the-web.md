# Reading the Web: A Primer for Impersonate-Meta v2

> **Audience:** AI agent performing extraction and impersonation
> **Purpose:** Systematically read web sources to capture a person's authentic voice, positions, and evolution over time
> **Version:** 2.0

---

## Table of Contents

1. [Why Read the Web Systematically](#1-why-read-the-web-systematically)
2. [Content Type Identification](#2-content-type-identification)
3. [Systematic Extraction Methodology](#3-systematic-extraction-methodology)
4. [The Criticality of Timestamps](#4-the-criticality-of-timestamps)
5. [Screenshots, Video, and Audio Sources](#5-screenshots-video-and-audio-sources)
6. [Extraction Template / Checklist](#6-extraction-template--checklist)
7. [Common Pitfalls](#7-common-pitfalls)

---

## 1. Why Read the Web Systematically

Impersonate-meta v2 reconstructs a **dynamic portrait** of a person — not a static biography. People evolve. Their opinions shift. Their emphasis changes. Their vocabulary matures. A quote from 1998 and a quote from 2024 may contradict each other, and **both are true** if understood in context.

The goal of reading the web is not to extract "facts about X." The goal is to extract:

- **What did this person say, and when?**
- **In what forum, to what audience?**
- **What changed? What stayed constant?**
- **What is their authentic voice — the turns of phrase, the characteristic arguments, the recurrent metaphors?**

Every source is a data point in a time series. Treat it as such.

---

## 2. Content Type Identification

Not all web pages are equal. Different genres require different extraction strategies. Classify the source **before** you extract.

### 2.1 Preprint / Academic Paper

**How to identify:**
- URL contains `arxiv.org`, `biorxiv.org`, `hal.science`, `researchgate.net`, or a `.pdf` extension
- Structured abstract, introduction, methods, results, discussion sections
- Citation markers like `[1]`, `(Author, 2020)`
- Multiple authors listed with affiliations
- DOI present (10.xxxx/xxxxx)

**What to extract:**
- Title, full author list, arXiv ID or DOI
- Abstract (especially the claims made)
- Key quotes from introduction and conclusion — these are where the author stakes their position most explicitly
- Figures/tables referenced (figure captions often contain compressed arguments)
- Acknowledgments section (funding, collaborations)
- Date: preprint date on arXiv, submission date, publication date — **these may differ**

**Caveat:** A preprint is *not* peer-reviewed. Its claims may be withdrawn or corrected in the published version. Always check: has a later version appeared in a journal? If so, prefer the published version for established claims, but the preprint for raw, unfiltered opinions.

### 2.2 Peer-Reviewed Journal Article

**How to identify:**
- Hosted on `nature.com`, `science.org`, `cell.com`, `wiley.com`, `springer.com`, `pnas.org`, `agu.org`, `aas.org` (journals page)
- Has a DOI and a "Published: YYYY-MM-DD" or "Received: / Accepted:" line
- Usually behind paywall or has an open-access badge
- Structured with formal section headings
- "Editor's Summary" or "Press Release" may accompany it

**What to extract:**
- Everything from preprint extraction, **plus:**
- The published date (often differs from preprint date by months or years)
- Supplementary materials — often contain additional data or extended discussion not in main text
- Peer review history if available (some journals publish reviewer comments)

**Reliability:** High for factual claims made within scope. Lower for speculative interpretations (discussion sections are more speculative than results).

### 2.3 Conference Abstract / Presentation

**How to identify:**
- Hosted on conference program sites (e.g., `agu.confex.com`, `iafastro.directory`, `meetingorganizer.copernicus.org`)
- Has session number, presentation time, and venue
- Usually 250–500 words
- Bullet-style or very concise
- May include "This work was presented at..."

**What to extract:**
- Title, author(s), conference name, session, date of presentation
- The *single key claim* or finding
- Any bolded or italicized emphasis
- "Future work" statements — these often become the author's next paper

**Caveat:** Conference abstracts are brief and not peer-reviewed in the same way as journal articles. A claim made in an abstract may later be refined or retracted in the full paper. Useful for tracking *what the person was working on* at a given time.

### 2.4 Podcast Transcript

**How to identify:**
- Shows as "transcript" on the page or in metadata
- Contains speaker labels (e.g., "Host:", "Guest:", "Interviewer:")
- Often has timestamps in `[HH:MM:SS]` format
- May have a "listen now" or "play" button at the top
- Platform indicators: `spotify.com`, `apple.com/podcast`, `youtube.com` (with transcript), or specific podcast pages

**What to extract:**
- Guest name, host name, podcast title, episode title
- Publication date of the episode
- **Every substantive quote** — podcasts are where people speak most freely
- Spontaneous language, hesitations ("I think," "you know," "the thing is") — these reveal authentic voice
- Offhand remarks that would never appear in a paper
- Corrections or clarifications ("Actually, let me rephrase that...")

**Reliability:** High for capturing authentic voice and current thinking. Low for precision (people misspeak). Always cross-check specific factual claims made verbally.

### 2.5 News Article / Reporting

**How to identify:**
- Journalist's byline visible
- "News" or "Science News" section
- Includes "said in an interview," "according to," or other third-person framing
- Quotation marks around direct quotes
- URL suggests a news outlet: `nytimes.com`, `washingtonpost.com`, `nature.com/news`, `science.org/content/article`, `newscientist.com`, `bbc.com/news`

**What to extract:**
- The direct quotes (surrounded by quotation marks) — these are the most reliable signal of what the person said
- The journalist's framing paraphrases — these may misrepresent. Extract them as **second-hand**, not direct.
- Date of the article
- Context: why was this person interviewed? (a new paper? a controversy? a prize?)
- Photograph captions — often contain additional context

**Reliability:** Medium. The journalist selects which quotes to include. Always check if the article quotes the person directly or paraphrases. Paraphrasing accuracy varies enormously by publication.

### 2.6 Personal Essay / Blog / Newsletter

**How to identify:**
- First-person narrative voice ("I think," "In my experience")
- Personal website URL (`firstnamelastname.com`, `medium.com/@username`, `substack.com`)
- Informal or semi-formal tone
- May include personal photographs, no structured sections
- Comment section enabled

**What to extract:**
- The full text — this is the person writing in their own voice, unfiltered
- Date (blog posts usually have a clear date at the top)
- Any admissions of uncertainty, changes of mind, or "I used to think X, but now I think Y"
- Links they include — these show what they're reading and engaging with
- Response to comments (if present) — often reveals more than the original post

**Reliability:** High for authentic voice and opinions. Low for factual claims — personal blogs don't go through fact-checking. But for understanding *how a person thinks*, this is the gold standard.

### 2.7 Interview (Text)

**How to identify:**
- Usually titled "Q&A with..." or "Interview with..." or "A Conversation with..."
- Alternating question-answer format
- Interviewer name and affiliation
- May be hosted on a university website, magazine, or journal

**What to extract:**
- All answers in full — these are direct from the subject
- Questions matter too: what the interviewer chose to ask reveals what the public discourse considers important at that time
- Date and venue (e.g., "Interview by Nature Physics, March 2023")
- Biographical note at the end

**Reliability:** High. The person has time to formulate responses and usually reviews the transcript before publication.

### 2.8 Social Media / Threads

**How to identify:**
- Platform-specific UI: `x.com` (Twitter), `mastodon.social`, `threads.net`, `linkedin.com`
- Short-form content, often with engagement metrics
- Username and handle clearly displayed
- May be a threaded series of posts

**What to extract:**
- The exact text of each post
- Timestamp (platform shows "Mar 15, 2024" or "3h ago" — capture the absolute date, not relative)
- What the post is responding to (quote tweet or reply context)
- Hashtags — they indicate what conversation the person is participating in

**Reliability:** Low to medium. Social media is performative, reactive, and informal. But it captures *immediate* reactions and can reveal opinions before they're polished for publication. Essential for tracking fast-breaking opinions.

### 2.9 Press Release / Institution News

**How to identify:**
- Institutional URL: `www.nasa.gov`, `www.esa.int`, `news.mit.edu`, `www.eurekalert.org`, `www.newswise.com`
- Written by a communications officer, not the scientist
- "For immediate release" at the top
- Quotes attributed to the scientist but clearly solicited and often edited

**What to extract:**
- The scientist's direct quotes (again, quotation marks)
- The institution's framing of the finding — this tells you how the work is being *sold* to the public
- Embargo date if visible (suggests coordination with journal publication)

**Reliability:** Medium. The quote is real but was given in a formal context and may be sanitized. The framing is the institution's, not the scientist's.

### 2.10 Wikipedia Page

**How to identify:**
- `en.wikipedia.org` URL
- Structured infobox, table of contents, references numbered `[1]` through `[n]`
- "This article has multiple issues" banners
- Edit history and talk page tabs

**What to extract:**
- Use Wikipedia as a **map** to find primary sources, not as a primary source itself
- The references section is the most valuable part — it points to the original articles, interviews, and books
- The article text gives a consensus view, which is useful context
- Talk page discussions can reveal controversies and disagreements

**Reliability:** Low for direct quotes (Wikipedia paraphrases). High for identifying what sources exist. Never quote Wikipedia directly for impersonation.

---

## 3. Systematic Extraction Methodology

Every extraction follows the same pipeline. Do not skip steps.

### Step 1: Source Metadata (The Who-What-Where-When)

Before reading a single word of content, capture the source's metadata:

| Field | Required? | Examples |
|-------|-----------|----------|
| URL | Always | `https://www.nature.com/articles/s41567-024-02589-2` |
| Title | Always | "Turbulence and wave heating in the solar wind" |
| Author(s) | Always | Velli, M.; Cranmer, S.R.; ... |
| Publication date | Always | 2024-11-15 |
| Content type | Always | preprint | journal | interview | podcast | blog | news |
| Venue | Always | Nature Physics | arXiv:2408.12345 | The Guardian |
| Publisher / host | Often | Springer Nature | self-published |
| DOI / identifier | If available | 10.1038/s41567-024-02589-2 |
| Language | If not English | zh-CN (note for translation) |
| Access status | If relevant | open access | paywalled |

### Step 2: Speaker Attribution (Who Said What)

If the target person is not the sole author, carefully attribute:

- **Is the target the primary author?** Quote from introduction/conclusion most reliable.
- **Is the target a co-author?** The quote may represent the group's view, not the individual's.
- **Is the target quoted by a journalist?** Capture the journalist's *framing* separately from the *quote*.
- **Is the target a podcast guest?** The spontaneous remarks are more personal than prepared statements.

For any quote you extract, you must be able to answer: "Did this person actually say these exact words, or is it a paraphrase?"

### Step 3: Quote Extraction Protocol

When extracting a quote, record:

```
Quote: "The precise wording..."
Speaker: [name]
Timestamp: [YYYY-MM-DD, or YYYY, or "circa YYYY"]
Source: [URL or DOI]
Context: [one sentence describing what prompted this statement]
Confidence: [direct quote | journalist paraphrase | AI transcription | machine translation]
```

**Never** extract a quote without its timestamp. See Section 4.

### Step 4: Reliability Assessment

For each source, assign a reliability level:

| Level | Label | When |
|-------|-------|------|
| 1 | **Direct, reviewed** | Interview transcript (approved), published paper, written essay — the person saw and approved the words |
| 2 | **Direct, unreviewed** | Podcast transcript, live talk recording, social media — the person spoke/wrote but did not approve a transcript |
| 3 | **Second-hand, reputable** | Journalist quote in a major newspaper, press release — likely accurate but filtered through an editor |
| 4 | **Second-hand, uncertain** | Blog summary, Wikipedia paraphrase, forum post — multiple layers of indirection |
| 5 | **Machine mediated** | Auto-generated transcript, machine translation — expect errors |

### Step 5: Voice Signature Capture

Beyond factual claims, extract **how** the person speaks/writes:

- **Recurrent metaphors:** Does this scientist always talk about "dance" of particles? "Battle" between forces? "Symphony" of waves?
- **Characteristic hedging:** "I suspect," "it seems plausible," "we have strong evidence that" — these reveal confidence level
- **Pet concepts:** Ideas they return to across multiple sources
- **Annoyances:** What do they consistently push back against?
- **Discipline-specific jargon:** Terms they use naturally vs. terms they explain (explaining suggests the term is new or the audience is non-specialist)

---

## 4. The Criticality of Timestamps

### 4.1 Why Every Quote Must Have a Timestamp

This is the single most important rule in impersonate-meta v2.

**People change their minds.** A person who held Position A in 2005 may hold Position B in 2025, and both are authentic expressions of their thinking at those times. A portrait that collapses across time is not a portrait — it is a caricature.

**Scientific consensus shifts.** What was frontier speculation in 1998 is textbook in 2018. A scientist who said "we have no evidence for X" in 1998 and "X is well established" in 2018 is not inconsistent — they are describing different states of knowledge.

**Context changes.** A quote from a job talk given while applying for a professorship may be more conservative than a quote from a retirement lecture. The incentive structure matters.

### 4.2 Worked Example: Marco Velli on Solar Wind Heating

To illustrate why timestamps matter, consider the evolution of Marco Velli's views on solar wind heating mechanisms. This is a real scientific trajectory:

**1993 — Early work on Alfvén waves**
- Context: PhD / early career at Arcetri Observatory, Florence
- Position: Solar wind heating is primarily driven by **Alfvén wave turbulence** in the corona. Wave reflection and nonlinear interactions transfer energy from large-scale waves to small scales where dissipation occurs.
- Key paper: Velli, M. (1993). "On the reflection of Alfvén waves in the solar wind." *Astronomy & Astrophysics*
- Reliability: Direct (peer-reviewed)
- Characteristic phrasing: Uses language of "reflection," "turbulent cascade," "wave dissipation"

**2003—2005 — Refinement and the switchback picture**
- Context: At Università di Firenze, working with Ulysses data
- Position: Still centered on wave turbulence, but now incorporating observations of **switchbacks** (large deflections in the magnetic field). Begins to argue that the observed heating cannot be explained by waves alone — something else is needed.
- Key paper: Velli, M. et al. (2005). "Solar wind dynamics and turbulence." *Living Reviews in Solar Physics*
- Shift: More emphasis on **intermittency** and coherent structures, not just waves

**2014 — The switchback heating model**
- Context: NASA Solar Probe Plus (now Parker Solar Probe) is in development; Velli is heavily involved as theory lead
- Position: Proposes that switchbacks themselves may be a heating mechanism. The bending and straightening of magnetic field lines converts magnetic energy into thermal energy. This is a **new mechanism** not present in the 1993 picture.
- Shift from 1993: Previously, heating was all about waves cascading to small scales. Now, there is a role for **large-scale magnetic field line dynamics**.
- Key talk: Velli, M. "Wave heating vs. switchback heating in the solar wind." AGU Fall Meeting 2014, SH33A-07

**2023 — Multi-mechanism synthesis**
- Context: Parker Solar Probe data is in full flow, Velli is at UCLA
- Position: Heating is due to **multiple mechanisms working together**: (a) Alfvén wave turbulence, (b) switchback reconnection/relaxation, (c) cyclotron resonance with ion populations. No single mechanism dominates. The relative importance varies with distance from the Sun and solar wind type.
- Explicit acknowledgment of earlier views: In interviews (e.g., the "Parker Solar Probe: A Journey to the Sun" podcast, 2023), Velli says: "I used to think the wave picture was sufficient. But the data from PSP has forced us to reconsider. The heating puzzle is more complex, and more interesting, than we imagined."
- Key paper: Zank, G.P., Velli, M., et al. (2023). "The multi-scale nature of solar wind heating." *Space Science Reviews*
- Shift from 2014: Not just switchbacks, not just waves — a **synthesis** that acknowledges all mechanisms

**What this teaches us:**

| Year | Position | Evidence |
|------|----------|----------|
| 1993 | Waves only | Theory, no in-situ data near Sun |
| 2014 | Waves + switchbacks | Ulysses data, theoretical modeling |
| 2023 | Multiple mechanisms, distance-dependent | Parker Solar Probe direct measurements |

If you quoted Velli only from 1993, you would represent him as a "wave heating advocate." If you quoted him only from 2023, you would miss the intellectual journey. **The impersonation must capture both the current position AND the trajectory.**

### 4.3 Handling Ambiguous or Missing Timestamps

Sometimes a source has no clear date. Follow this priority:

1. **Explicit date on the page** → Use it
2. **Page metadata** → Check HTML `<meta name="date">` or JSON-LD structured data
3. **URL contains date** → e.g., `/2024/03/15/...` — use cautiously
4. **Archive.org** → Check Wayback Machine for earliest capture
5. **Cross-references** → If the text mentions "last week's discovery of X" and X was published on a known date, the text is from shortly after that date
6. **Last resort** → Use "circa YYYY" based on context clues

**Never** assign a timestamp by guessing. If you cannot determine the date, mark the quote as `untimestamped` and flag it for human review.

---

## 5. Screenshots, Video, and Audio Sources

### 5.1 The Fundamental Problem

Text on a web page is machine-readable. Video, audio, and images are not. When a person appears on a video or podcast, their words exist as **spoken audio**, not as extracted text (unless a transcript is provided). This introduces two failure modes:

1. **The quote is accurate but the context is lost** — tone, hesitation, laughter, emphasis
2. **The quote is inaccurate because the transcript (auto-generated or human) contains errors**

### 5.2 Handling Video Sources

When extracting from a video (YouTube, TED, conference recording, Zoom interview):

**Required metadata:**
- URL (with timestamp parameter if possible): `https://www.youtube.com/watch?v=abc123&t=15m30s`
- Title / speaker / event / date
- Total duration (context for how much was said)
- Who created the transcription (you? the platform? a third party?)

**Transcription quality levels:**

| Type | Reliability | Notes |
|------|-------------|-------|
| Human-verified transcript (published) | High | Speaker likely approved this |
| Human-generated (by you or an assistant) | Medium-High | Depends on transcriber's care |
| Auto-generated (YouTube, Otter.ai, Whisper) | Low-Medium | Expect errors with technical terms, names, accents |
| Machine translation + auto-transcription | Very Low | Double error source |

**Always note transcription method** when extracting from video/audio.

### 5.3 The YouTube / Podcast Protocol

For any video or podcast source:

1. **Record the exact URL** — not just the page, but the timestamp where the quote begins
2. **Listen to the quote in context** — what came before? What came after? The same sentence can have different meanings depending on preceding questions
3. **Check the comments** — sometimes the speaker or their team posts corrections or clarifications in the comments section
4. **Note any cuts or edits** — "This interview has been edited for length and clarity" means words were removed. The quote may be real but decontextualized.

### 5.4 Screenshot vs. Text

Sometimes you encounter a screenshot of text (e.g., a tweet screenshot embedded in an article, or a slide from a presentation posted as an image).

**Rule:** A screenshot is **not** extractable text. It must be treated as an image until OCR is applied. And even after OCR:

- OCR may introduce errors, especially with mathematical notation, unusual fonts, or colored text
- The original source (e.g., the tweet, the slide) should be located and extracted directly if possible
- A screenshot may be selectively cropped — the person posting the screenshot controls the framing

**Protocol for screenshots:**
1. Attempt to find the original source (reverse image search, URL from alt text)
2. If original is found, extract from there
3. If original is not found, treat as low-reliability and flag it

### 5.5 The Special Case of Translated Content

If a source is in a language other than the target's primary language:

- Was the person speaking in their native language and translated by someone else? (Common in international conferences)
- Was the person speaking English but their words appear translated into another language? (News articles often do this)
- Machine translation can introduce subtle errors — "I think" vs. "I know" vs. "I suspect" may all be mapped to the same translated word

**Always note the original language and the translation method.**

---

## 6. Extraction Template / Checklist

Copy this template for every source you process. Fill all fields. If a field is not applicable, write `N/A`.

```
================================================================================
EXTRATION RECORD
================================================================================

--- MANDATORY METADATA ---

URL(s):                 [Full URL; if multiple, list all]
Title:                  [Full title of the source]
Date of source:         [YYYY-MM-DD if known; YYYY if approximate; "circa YYYY" if uncertain]
Date accessed:          [YYYY-MM-DD]
Content type:           [preprint | journal | conference | podcast | interview | 
                         news | blog | social-media | press-release | wikipedia | other]
Target person:          [Full name as appears in source]
Role of target:         [primary author | co-author | interviewee | quoted source | subject]
Venue / publication:    [Journal name, conference name, podcast name, newspaper name]
Language:               [original language of source]

--- RELIABILITY ASSESSMENT ---

Directness level:       [1-5, see section 3 Step 4]
Transcription:          [human-reviewed | auto-generated | manual-by-agent | 
                         machine-translated | not-applicable-text]
Verification status:    [not-yet-verified | cross-checked-with-original | 
                         cross-checked-with-secondary-source]
Notes on reliability:   [Any specific concerns about this source's accuracy]

--- CONTENT EXTRACTION ---

TL;DR of source:        [2-3 sentences summarizing what this source is about]

KEY QUOTES (list each with full protocol):

Quote 1:
  Text:                 "[Exact wording]"
  Speaker:              [Name]
  Timestamp:            [YYYY-MM-DD]
  Context:              [What prompted this statement?]
  Confidence:           [direct | journalist-paraphrase | auto-transcribed | translated]

Quote 2:
  Text:                 "..."
  Speaker:              
  Timestamp:            
  Context:              
  Confidence:           

[Add more quotes as needed]

KEY CLAIMS (claims made by the target, not direct quotes):

Claim 1:
  Paraphrase:           [One-sentence summary of what they claimed]
  Evidence level:       [explicit-statement | implication | speculation | anecdote]
  Supporting quote(s):  [Reference to Quote 1, Quote 2 above]

Claim 2:
  ...

--- VOICE SIGNATURE ---

Recurrent metaphors:    [e.g., "solar wind as a dance," "turbulence as a symphony"]
Characteristic phrases: [e.g., "I suspect," "the data seem to indicate," "fascinatingly"]
Jargon markers:         [Terms used without explanation — assume domain expertise]
Emotional register:     [enthusiastic | measured | skeptical | humorous | terse]
Audience awareness:     [Do they explain basic concepts? Assume specialist knowledge?]

--- TEMPORAL TRACKING ---

Does this source express a view that DIFFERS from earlier sources?
  [ ] Yes, explicit change of mind stated
  [ ] Yes, implicit shift (compare with earlier quote)
  [ ] No, consistent with earlier views
  [ ] No prior sources to compare
  Details:              [If yes, describe the nature of the shift]

Does this source express a view that is LATER contradicted?
  (This can only be answered when later sources exist)
  [ ] Yes, later source contradicts this
  [ ] No
  [ ] Unknown / not yet checked

--- SUGGESTED FOLLOW-UP ---

What is missing from this source?     [Questions not asked, topics not covered]
What should we look for next?         [Specific papers, interviews, periods]
Cross-check needed?                   [Any claim that seems unlikely or unverified]

================================================================================
```

### Quick-Reference Checklist (condensed)

Before finalizing an extraction, verify:

- [ ] URL recorded
- [ ] Date of source found and recorded (not just date accessed)
- [ ] Content type classified
- [ ] Directness level assigned (1–5)
- [ ] At least one direct quote extracted (if available)
- [ ] Each quote has: text, speaker, timestamp, context, confidence
- [ ] Voice signature notes made (metaphors, phrasing, register)
- [ ] Temporal tracking: does this agree with or contradict earlier sources?
- [ ] Transcription method noted (for video/audio)
- [ ] Screenshots resolved to original source or flagged as unverifiable
- [ ] Reliability concerns documented

---

## 7. Common Pitfalls

### Pitfall 1: Timestamp Confusion
**Problem:** Recording the date you accessed the page instead of the date the source was published.
**Solution:** Always look for "Published:", "Posted:", "Presented:", "Recorded:" on the page. The access date goes in `date accessed`, not `date of source`.

### Pitfall 2: Quote Decontextualization
**Problem:** Extracting a spicy quote without capturing what prompted it.
**Solution:** Always capture the preceding question, the preceding paragraph, or the context that elicited the statement. A quote without context is noise.

### Pitfall 3: Assuming Consistency
**Problem:** Assuming a person's views are internally consistent across all sources.
**Solution:** If two sources from the same period seem to contradict each other, dig deeper. The contradiction may be apparent (different audiences, different aspects of the same issue) or real (the person is conflicted). Both are interesting.

### Pitfall 4: Overweighting the Most Recent Source
**Problem:** Treating the most recent source as the "correct" or "final" view.
**Solution:** The most recent view is the **current** view, not necessarily the most insightful view. Sometimes a person's earlier, more speculative thoughts contain more originality before they were tempered by peer review or institutional constraints.

### Pitfall 5: Transcript Overconfidence
**Problem:** Treating an auto-generated transcript as equivalent to a written text.
**Solution:** Auto-transcription of scientific/technical content has error rates of 10–30% for specialized terminology. A scientist's name, a technical term, or a number is likely wrong. Always cross-check critical quotes against the audio.

### Pitfall 6: Not Distinguishing the Person from the Institution
**Problem:** Attributing institutional press releases to the individual scientist.
**Solution:** A press release quote is often drafted by the communications office and approved by the scientist. It's authentic but sanitized. Contrast with off-the-cuff remarks in podcasts or interviews.

### Pitfall 7: Ignoring the Audience
**Problem:** Treating a statement made to a specialist audience the same as one made to the general public.
**Solution:** A scientist speaking to other scientists will use precise, hedged language. The same scientist speaking to a journalist will simplify and may sound more confident. Both are real, but they represent different registers of communication.

### Pitfall 8: Translation Naivety
**Problem:** Treating a translated quote as equivalent to the original.
**Solution:** Every translation is an interpretation. If the original language is not English and the source provides a translation, note that. If possible, find the original language source. Pay attention to culturally-specific metaphors that don't survive translation.

---

## Appendix: Quick Content Type Decision Tree

```
Is the text written by the target person?
  ├── Yes → Is it formal?
  │   ├── Yes → Peer-reviewed paper or preprint
  │   └── No → Blog, personal essay, social media
  └── No → Is the target person quoted directly?
      ├── Yes → Interview, news article, press release
      └── No → Is the target person the subject?
          ├── Yes → Wikipedia, biography, institutional profile
          └── No → Review, commentary, third-party analysis

Is the content spoken (audio/video)?
  ├── Is there a human-reviewed transcript?
  │   ├── Yes → Treat as Level 1 or 2 source
  │   └── No → Treat as Level 5 (machine-mediated) until verified
  └── Is the original recording available?
      ├── Yes → Best to extract from recording directly
      └── No → Rely on transcript with reduced confidence
```

---

*End of primer. When in doubt, follow the checklist. When the checklist is complete, the impersonation will be faithful to the person — not frozen in time, but alive with the arc of their thinking.*
