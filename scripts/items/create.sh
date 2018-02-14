#!/bin/bash

API="http://localhost:4741"
URL_PATH="/items"
TITLE="a dang title"
DESC="a dang desc"
TOKEN="hjz0Z+XMYFB1sNuWQQzMaagV9xRnaX949fwlgJZbYmU=--DzaYDLPkuBrCY9i2QFNuH13Xl5ffpdQ8wxkV4ntkgoA="

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "item": {
      "title": "'"${TITLE}"'",
      "description": "'"${DESC}"'"
    }
  }'

echo
