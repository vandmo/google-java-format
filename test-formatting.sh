#!/usr/bin/env bash
set -eu -o pipefail

# Create a copy of the original file to compare
TEST_FILE="/workspace/test-sample.java"
ORIGINAL_FILE="/tmp/test-sample.original.java"
cp "$TEST_FILE" "$ORIGINAL_FILE"

echo "=== Original file ==="
cat "$ORIGINAL_FILE"

# Format the file
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
