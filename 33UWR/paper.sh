#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <doi>"
  exit 1
fi

urlencode() {
  local input="$1"
  printf '%s' "$input" | jq -s -R -r @uri
}

DOI="$1"
ENCODED_DOI=$(urlencode "$DOI")

response=$(curl -v -s "https://annas-archive.org/scidb/${ENCODED_DOI}" \
  -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:134.0) Gecko/20100101 Firefox/134.0" \
  -H "Accept: text/html" \
  -H "Accept-Language: en-US,en;q=0.5" \
  -H "Referer: https://annas-archive.org/" \
  -H "Alt-Used: annas-archive.org" \
  -H "Connection: keep-alive" \
  -H "Upgrade-Insecure-Requests: 1" \
  -H "Sec-Fetch-Dest: document" \
  -H "Sec-Fetch-Mode: navigate" \
  -H "Sec-Fetch-Site: same-origin" \
  -H "Priority: u=0, i")

echo $response >> debug

matches=$(echo "$response" | rg -oP '<a href="\K[^"]*(?=">Download</a>)')

urls=()
while IFS= read -r url; do
  urls+=("$url")
done < <(echo "$matches")

for url in "${urls[@]}"; do
  echo "url: $url"
done

if [ "${#urls[@]}" -gt 0 ]; then
  download_url="${urls[0]}"
  echo "Downloading from: $download_url"
  curl -o "/Users/david/@/pdf/paper.pdf" "$download_url" --compressed
else
  echo "No 'Download' link found in the response."
fi

