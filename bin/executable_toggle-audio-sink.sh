#!/bin/bash

# NOTE: This is an absolutely wonky way to do it.
# wpctl does not output in a parse-able format, so here we go.

HEADPHONE_NODE_ID="$(wpctl status --nick | grep -A 10 -i 'Sinks:' | grep -i Headphones | grep -iv microphone | grep -o '\s[0-9]*\.\s' | sed 's/\s*\(.*\)\.\s*/\1/g' | head -1)"
SPEAKER_NODE_ID="$(wpctl status --nick | grep -A 10 -i 'Sinks:' | grep -v 'Sources:' -A 100 | grep -i 'USB Audio' | grep -iv microphone | grep -o '\s[0-9]*\.\s' | sed 's/\s*\(.*\)\.\s*/\1/g' | head -1)"
DEFAULT_NODE_ID="$(wpctl status | grep -o '\*\s*[0-9]*' | grep -o '[0-9]*' | head -1)"

NEXT_NODE_ID=""
if [ "${DEFAULT_NODE_ID}" == "${HEADPHONE_NODE_ID}" ]; then
  NEXT_NODE_ID="${SPEAKER_NODE_ID}"
fi

if [ "${DEFAULT_NODE_ID}" == "${SPEAKER_NODE_ID}" ]; then
  NEXT_NODE_ID="${HEADPHONE_NODE_ID}"
fi

if [ -z "${NEXT_NODE_ID}" ]; then
  echo "Unable to figure out the next node id."
  exit 1
fi

wpctl set-default "${NEXT_NODE_ID}"
