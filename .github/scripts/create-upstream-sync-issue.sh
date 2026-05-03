#!/usr/bin/env bash

set -euo pipefail

sha="$1"
short="${sha:0:7}"
title="[$(git log -1 --format='%cs' "$sha")] Sync upstream commit ${short}"

if gh issue list --label sync --json title -q '.[] | select(.title | endswith("'"${short}"'")) | .title' | grep -q .; then
  echo "Issue already exists for $sha, skipping"
  exit 0
fi

body="## Upstream commit
- **SHA**: \`${sha}\`
- **Date**: $(git log -1 --format='%cs' "$sha")
- **Author**: $(git log -1 --format='%an' "$sha")
- **Link**: https://github.com/ankitects/anki-manual/commit/${sha}

## Message
$(git log -1 --format='%B' "$sha")"

gh issue create \
  --title "$title" \
  --body "$body" \
  --label sync
echo "Created issue for $sha"
