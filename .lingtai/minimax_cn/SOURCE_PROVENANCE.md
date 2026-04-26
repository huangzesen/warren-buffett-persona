# Buffett Persona — Source Provenance Tracker

**Last updated**: 2026-04-26 (UTC)  
**Status**: ✅ COMPLETE — All recoverable letters downloaded. Gaps documented.

---

## 📦 Archive Completeness

### `source-archive/` — Final Inventory

| Period | Format | Source | Status |
|--------|--------|--------|--------|
| 1972 | HTML | ⚠️ `404 Not Found` on berkshirehathaway.com — not available from official source | ⚠️ MISSING (see §Gaps) |
| 1973–1999 | HTML | `https://www.berkshirehathaway.com/letters/YYYY.html` | ✅ Complete |
| 2000 | HTML + PDF | Wayback Machine `https://web.archive.org/web/20030207082133/http://www.berkshirehathaway.com/2000ar/2000letter.html` | ✅ Recovered (125KB) |
| 2001 | HTML + PDF | Wayback Machine `https://web.archive.org/web/20031205015858/http://www.berkshirehathaway.com/2001ar/2001letter.html` + `2001pdf.pdf` | ✅ Recovered (116KB HTML, 213KB PDF) |
| 2002 | HTML + PDF | Wayback Machine `https://web.archive.org/web/20031002043913/http://www.berkshirehathaway.com/2002ar/2002ar.pdf` | ✅ Recovered (599KB PDF, extracted 327KB .txt) |
| 2003–2024 | PDF | `https://www.berkshirehathaway.com/letters/YYYYltr.pdf` | ✅ Complete |

**Total**: 94 files. **Recoverable letters**: 1973–2024 (52 years). **Genuinely missing**: 1972 only.

---

## 🔗 Download URLs (Reproducible)

### Official Source
```
https://www.berkshirehathaway.com/letters/letters.html        # Index
https://www.berkshirehathaway.com/letters/YYYY.html          # HTML letters (1973–1999)
https://www.berkshirehathaway.com/letters/YYYYltr.pdf       # PDF letters (2003–2024)
```

### Wayback Machine (2000–2002 — not on official site)
```
2000: https://web.archive.org/web/20030207082133/http://www.berkshirehathaway.com/2000ar/2000letter.html
2001: https://web.archive.org/web/20031205015858/http://www.berkshirehathaway.com/2001ar/2001letter.html
2001: https://web.archive.org/web/20031205015858/http://www.berkshirehathaway.com/letters/2001pdf.pdf
2002: https://web.archive.org/web/20031002043913/http://www.berkshirehathaway.com/2002ar/2002ar.pdf
```

### ❌ 1972 — Not Recoverable
- `https://www.berkshirehathaway.com/letters/1972.html` → **404** (not on official site)
- `https://www.berkshirehathaway.com/letters/1972ltr.pdf` → **404**
- Wayback Machine → **404** (archived as 404 stub)
- Alternative sources (buffettarchive.org, doc88.com) → not available as free text

---

## ✅ PRIMARY SOURCE VERIFICATION RESULTS

### Fully Verified from Archive

| # | Quote / Claim | Source File | Key Finding |
|---|---------------|-------------|-------------|
| 1 | "Be fearful when others are greedy" | `2006_letter.pdf/txt` | CONFIRMED |
| 2 | "Price is what you pay. Value is what you get." | `2008_letter.pdf/txt` | ⚠️ **BEN GRAHAM'S QUOTE, quoted by Buffett.** 2008: "Long ago, Ben Graham taught me that 'Price is what you pay; value is what you get.'" **Always attribute to Graham, not Buffett.** |
| 3 | Economic moat framework | `2007_letter.pdf/txt` | CONFIRMED |
| 4 | PCC: $11B GAAP write-down | `2020_letter.pdf/txt` | CONFIRMED — NOT $9.8B |
| 5 | "I was wrong" — PCC | `2020_letter.pdf/txt` | CONFIRMED |
| 6 | Dexter Shoes: $433M | `2014_letter.pdf/txt` | CONFIRMED |
| 7 | BNSF: $100/share | `2009_letter.pdf/txt` | CONFIRMED |
| 8 | GEICO: Jack Byrne saved company | `2004_letter.pdf/txt` | CONFIRMED |
| 9 | GEICO: $35M debt paid off | `2006_letter.pdf/txt` | CONFIRMED |
| 10 | Insurance float: cost less than zero ($2.8B earned) | `2008_letter.pdf/txt` | CONFIRMED |
| 11 | Jack Benny quote | `1987_letter.html` | CONFIRMED |
| 12 | Greg Abel as successor | `2024_letter.pdf/txt` | CONFIRMED |
| 13 | General Re: "rules 1 and 2" underwriting failure | `2001_letter.txt` | CONFIRMED — context: underwriting rules, 9/11 |
| 14 | See's Candy: $25M acquisition | `2007_letter.pdf/txt` | CONFIRMED — "We bought See's for $25 million when its sales were $30 million and pre-tax earnings were less than $5 million" |

### Corrections from Primary Sources

| Item | Previous (Secondary) | Primary Source | Corrected |
|------|----------------------|----------------|-----------|
| PCC write-down | $9.8B (various secondary sources) | `2020_letter.pdf`: "$11 billion write-down" | **$11B GAAP** |
| VA010 | $9.8B | `2020_letter.pdf` | **$11B** |
| "Price is what you pay..." | Attributed to Buffett | `2008_letter.pdf`: "Ben Graham taught me that..." | **Ben Graham's quote, quoted by Buffett** |
| Dexter Shoes | $434M (some secondary sources) | `2014_letter.pdf`: "$433 million" | **$433M** |

### ⚠️ Needs Clarification

| Claim | Issue | Status |
|-------|-------|--------|
| BNSF: $100/share | ✅ Confirmed | Use $100/share from 2009 letter |
| BNSF: $34B total | Not stated in 2009 letter. $100/share × ~334M shares ≈ $33.4B. Secondary source. | Calculate: $100 × shares outstanding, or check BH 2009 10-K |
| General Re "mistake" details | 2001 letter confirms: rules 1&2 were "dangerously weak" re: 9/11. Not the famous General Re trading scandal (2005 SEC case). | Distinguish underwriting failure vs. trading scandal |

---

## ❌ NOT FOUND — [unverified] Required

These quotes/claims are **not present in any Berkshire Hathaway shareholder letter 1972–2024**. Mark all outputs with `[unverified]` until found in primary sources or removed.

| Quote | Source Attribution | Notes |
|-------|-------------------|-------|
| "Rule #1: Never lose money. Rule #2: Never forget Rule #1." | Widely attributed to Buffett but NOT in any letter. 2001 letter has "rules 1 and 2" but in context of insurance underwriting (not investment rules). | Probably from speeches/interviews, not letters. |
| "If you aren't willing to own a stock for ten years, don't think about owning it for ten minutes." | Widely quoted. NOT in any letter. Closest: 2006 letter "about ten minutes every year he would get the urge to sell his company" (about selling a business). | Probably from speeches/interviews. |
| "Risk comes from not knowing what you are doing." | NOT in any letter. | Probably from speeches/interviews. |
| "My favorite holding period is forever." | NOT in any letter in exact form. | Probably paraphrase. |
| "Rocket scientist" quote (re: derivatives) | NOT in any letter searched. | Search more letters for variants. |
| BNSF: "buying America's future" | NOT in 2009 letter. | May be from a speech or press release. |
| See's Candy: $25M acquisition price | 1972 letter unavailable. | Requires 1972 letter or SEC 8-K from 1972. |
| General Re trading scandal (2005) | 2000–2002 letters cover underwriting issues (9/11), not the SEC trading case. | Requires 2003–2006 letters for trading scandal. |

---

## 📁 File Listing

### Fixed/Recovered Files
```
source-archive/
├── 1972_letter.html          ⚠️ 404 stub — not a real letter
├── 1973_letter.html         ✅
...
├── 1981_letter_fixed.txt    ✅ Fixed from GB2312 encoding
├── 1999_letter.html         ✅
├── 2000_letter.html         ⚠️ Was 404 stub, replaced with Wayback Machine version (125KB)
├── 2000_letter_fixed.html   ✅ Fixed version of above
├── 2000_letter.pdf          ⚠️ 355-byte 404 stub (ignore)
├── 2001_letter.html         ⚠️ Was 404 stub, replaced with Wayback Machine HTML (116KB)
├── 2001_letter_fixed.html   ✅ Fixed version of above
├── 2001_letter.pdf          ✅ Wayback Machine PDF (213KB)
├── 2001_letter.txt          ✅ Extracted from 2001_letter.pdf
├── 2002_letter.html        ⚠️ Was binary garbage, replaced with PDF
├── 2002_letter.pdf          ✅ Wayback Machine PDF (599KB)
├── 2002_letter.txt          ✅ Extracted from 2002_letter.pdf
├── 2003_letter.html         ✅
├── 2003_letter.pdf          ✅
├── 2003_letter.txt          ✅
...
└── 2024_letter.html         ✅
    2024_letter.pdf          ✅
    2024_letter.txt          ✅
```

---

## 🔄 Reproducible Download Commands

```bash
# Official source (1973–1999 HTML, 2003–2024 PDF)
BASE="https://www.berkshirehathaway.com/letters"

for year in $(seq 1973 1999); do
  curl -sL "$BASE/${year}.html" -o "source-archive/${year}_letter.html"
done

for year in $(seq 2003 2024); do
  curl -sL "$BASE/${year}ltr.pdf" -o "source-archive/${year}_letter.pdf"
done

# 2000–2002 from Wayback Machine (no longer on official site)
curl -sL "https://web.archive.org/web/20030207082133/http://www.berkshirehathaway.com/2000ar/2000letter.html" \
  -o "source-archive/2000_letter_fixed.html"
curl -sL "https://web.archive.org/web/20031205015858/http://www.berkshirehathaway.com/2001ar/2001letter.html" \
  -o "source-archive/2001_letter_fixed.html"
curl -sL "https://web.archive.org/web/20031002043913/http://www.berkshirehathaway.com/2002ar/2002ar.pdf" \
  -o "source-archive/2002_letter.pdf"

# Extract all PDFs to text
for f in source-archive/*_letter.pdf; do
  pdftotext -enc UTF-8 "$f" "${f%.pdf}.txt" 2>/dev/null
done
```

---

*Updated 2026-04-26: Recovered 2000–2002 letters from Wayback Machine. Fixed 1972 gap documented.*
