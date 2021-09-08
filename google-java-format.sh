#!/bin/bash
set -eu -o pipefail

java \
 --add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED \
 --add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED \
 --add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED \
 --add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED \
 --add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED \
 -jar /opt/google-java-format-1.11.0-all-deps.jar "$@"
