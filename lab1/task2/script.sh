#!/usr/bin/env bash

DIR="data_analysis"
CSV="faculty_2.csv"
TRIM="s/^[[:space:]]*//; s/[[:space:]]*$//"

rm -rf "$DIR"
mkdir -p "$DIR"

get_themes() {
    cut -d',' -f3 "$CSV" | tr '+' '\n' | sed "$TRIM" | grep -v '^$'
}

get_names() {
    cut -d',' -f1 "$CSV" | sed "$TRIM" | grep -v '^$'
}

get_themes | sort -u > "$DIR/research_themes.txt"
wc -l < "$DIR/research_themes.txt" >> "$DIR/research_themes.txt"

get_themes | sort | uniq -c | awk '$1 > 6 && $1 < 10 { $1=""; sub(/^ /, ""); print }' > "$DIR/medium_groups.txt"

grep "Computer Security" "$CSV" | grep "Philosophy" | grep "Biomedicine" > "$DIR/joined.csv"

get_names | sort -k2,2 -k1,1 > "$DIR/sorted_names.txt"

echo "Анализ завершен. Результаты в директории: $DIR"