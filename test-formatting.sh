#!/usr/bin/env bash
set -eu -o pipefail

ORIGINAL_FILE="/workspace/test-sample.java"
TEST_FILE="/tmp/test-sample.java"
cp "$ORIGINAL_FILE" "$TEST_FILE"

echo "=== Original file ==="
cat "$ORIGINAL_FILE"

java -jar "${GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH}" --replace "$TEST_FILE"

echo ""
echo "=== Formatted file ==="
cat "$TEST_FILE"

echo ""
echo "=== Diff ==="
if diff -u "$ORIGINAL_FILE" "$TEST_FILE" || true; then
  :
fi

# Assert that the file has changed
if ! diff -q "$ORIGINAL_FILE" "$TEST_FILE" > /dev/null; then
  echo ""
  echo "✓ SUCCESS: File was formatted (content changed as expected)"
  exit 0
else
  echo ""
  echo "✗ FAILURE: File was not formatted (content unchanged)"
  exit 1
fi
