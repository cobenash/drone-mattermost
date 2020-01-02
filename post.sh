#!/bin/sh

curl \
  -X "POST" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${PLUGIN_TOKEN}" \
  -d '{"channel_id": "'${PLUGIN_CHANNEL_ID}'", "message":"'${PLUGIN_MSG}'"}' \
  "${PLUGIN_URL}/api/v4/posts"

print "test"