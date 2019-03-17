#!/bin/bash

HOOK_URL="https://raw.githubusercontent.com/meriadec/local-ci/master/hooks/post-commit"
HOOK_FILE=.git/hooks/post-commit

echo "-- fetching hook from $HOOK_URL"
curl "$HOOK_URL" > "$HOOK_FILE" 2>/dev/null

echo "-- changing mode for $HOOK_FILE"
chmod +x "$HOOK_FILE"

echo "-- install successful"
