#!/bin/bash

API="http://localhost:4741"
URL_PATH="/items"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --data '{
    "item": {
      "title": "'"${TITLE}"'",
      "description": "'"${DESC}"'"
    }
  }'

echo
