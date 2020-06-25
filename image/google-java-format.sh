#!/bin/bash
set -eu -o pipefail

java -jar /opt/google-java-format-1.8-all-deps.jar "$@"
