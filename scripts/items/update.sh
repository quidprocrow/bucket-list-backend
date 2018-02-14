#!/bin/bash

API="http://localhost:4741"
URL_PATH="/items"

TITLE="A FREAKING NEW TITLE"
DESC="AN EVEN BETTER DESCRIPTION"
ID="5a83691298bd3325d70dab17"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "item": {
      "title": "'"${TITLE}"'",
      "description": "'"${DESC}"'"
    }
  }'

echo
