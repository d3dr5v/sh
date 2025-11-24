#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <search term>"
  exit 1
fi

SEARCH_TERM="$1"

response=$(curl -s \
  -H "Authorization: Bot ${KAGI_API_KEY}" \
  -H "Content-Type: application/json" \
  --data "{\"query\": \"wikipedia ${SEARCH_TERM}\"}" \
  https://kagi.com/api/v0/fastgpt)

matches=$(echo "$response" | rg -oP '"url":"\Khttps://en\.wikipedia\.org[^"]*')

urls=()
while IFS= read -r url; do
  urls+=("$url")
done < <(echo "$matches")

for url in "${urls[@]}"; do
  echo "url: $url"
done

if [ "${#urls[@]}" -gt 0 ]; then
  elinks "${urls[0]}"
else
  echo "No found in the response."
fi

