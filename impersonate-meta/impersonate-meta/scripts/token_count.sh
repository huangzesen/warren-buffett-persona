#!/usr/bin/env bash
#
# token_count.sh — Estimate token count for persona documents
#
# Usage: ./scripts/token_count.sh <persona-dir>
#
# Counts words in all .md and .bib files under <persona-dir>,
# estimates tokens as words × 1.3 (standard rough estimate for English text),
# and outputs a formatted table: file, words, estimated tokens.
#
# Flags any file exceeding 10,000 estimated tokens as LARGE.
#
set -euo pipefail

PERSONA_DIR="${1:-}"
if [ -z "$PERSONA_DIR" ]; then
    echo "ERROR: Usage: $0 <persona-dir>"
    exit 2
fi
if [ ! -d "$PERSONA_DIR" ]; then
    echo "ERROR: Persona directory not found: $PERSONA_DIR"
    exit 2
fi

echo "=== Token Count Report ==="
echo "Persona dir : $PERSONA_DIR"
echo ""
printf "%-72s %8s %10s %s\n" "File" "Words" "Tokens" "Flag"
printf "%-72s %8s %10s %s\n" "----" "-----" "------" "----"

TOTAL_WORDS=0
TOTAL_TOKENS=0
LARGE_FLAG=0

while IFS= read -r -d '' f; do
    relpath="${f#$PERSONA_DIR/}"
    words=$(wc -w < "$f" | tr -d ' ')
    tokens=$(echo "scale=0; $words * 1.3 / 1" | bc)
    flag=""
    if [ "$tokens" -gt 10000 ]; then
        flag=" ⚡LARGE"
        LARGE_FLAG=1
    fi
    printf "%-72s %8s %10s %s\n" "$relpath" "$words" "$tokens" "$flag"
    TOTAL_WORDS=$((TOTAL_WORDS + words))
    TOTAL_TOKENS=$((TOTAL_TOKENS + tokens))
done < <(find "$PERSONA_DIR" -type f \( -name '*.md' -o -name '*.bib' \) ! -name '*bib-full*' -print0 | sort -z)

echo ""
printf "%-72s %8s %10s\n" "--- TOTAL ---" "$TOTAL_WORDS" "$TOTAL_TOKENS"
echo ""
echo "Estimation method: tokens ≈ words × 1.3 (rough English-text heuristic)"
echo "For exact tokenization, use an LLM tokenizer or tiktoken."

if [ "$LARGE_FLAG" -eq 1 ]; then
    echo ""
    echo "⚠️  Large files detected (>10K estimated tokens). Consider splitting"
    echo "   or pruning to avoid context window pressure."
fi
