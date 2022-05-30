#!/bin/bash
set -eu -o pipefail

java -jar "${GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH}" "$@"
