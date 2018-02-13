#!/bin/bash

API="http://localhost:4741"
URL_PATH="/items"
TITLE="a dang title"
DESC="a dang desc"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "item": {
      "title": "'"${TITLE}"'",
      "description": "'"${DESC}"'"
    }
  }'

echo
