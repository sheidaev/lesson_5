#!/bin/bash

# Завантаження змінних
source keys.env

RESPONSE=$(curl -s -H "$AUTH_HEADER" "$TARGET_URL")

if echo "$RESPONSE" | grep -q "$SEARCH_ELEMENT"; then
  echo "✅ Test passed: елемент знайдено"
  exit 0
else
  echo "❌ Test failed: елемент НЕ знайдено"
  exit 1
fi


