#!/bin/bash

# Завантаження авторизаційного заголовка з keys.env
source keys.env

URL="https://qa.ithobby.com.ua/"

STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" -H "$AUTH_HEADER" "$URL")

if [ "$STATUS_CODE" -eq 200 ]; then
  echo "✅ Test passed: HTTP $STATUS_CODE"
  exit 0
else
  echo "❌ Test failed: HTTP $STATUS_CODE"
  exit 1
fi


