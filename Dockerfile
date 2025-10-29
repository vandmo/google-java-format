FROM eclipse-temurin:25@sha256:3a35a62d3ece346cfde11b08fafdc3f99d3946d31d5ebc15d678b44a67c3b9ec

LABEL org.opencontainers.image.authors="Mikael Vandmo <mikael@vandmo.se>"

ENV GOOGLE_JAVA_FORMAT_VERSION=1.32.0
ENV GOOGLE_JAVA_FORMAT_JAR_FILENAME=google-java-format-${GOOGLE_JAVA_FORMAT_VERSION}-all-deps.jar
ENV GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH=/opt/${GOOGLE_JAVA_FORMAT_JAR_FILENAME}
ENV GOOGLE_JAVA_FORMAT_JAR_SHA512=d9c328b7e405e3a1de7be1e459d510a05f1118495533a51b9965179769138b0d2b7db203c9ffc439f47c6c3ae9e8ac6ce24d925485db99a5751f9a829418c3a2

ADD https://github.com/google/google-java-format/releases/download/v${GOOGLE_JAVA_FORMAT_VERSION}/${GOOGLE_JAVA_FORMAT_JAR_FILENAME} ${GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH}
COPY google-java-format.sh /usr/local/bin/google-java-format

# hadolint ignore=DL3003,DL4006,SC3040
RUN <<EOT /usr/bin/env bash
  set -eu -o pipefail
  cd /opt
  echo "${GOOGLE_JAVA_FORMAT_JAR_SHA512} ${GOOGLE_JAVA_FORMAT_JAR_FILENAME}" | sha512sum -c -
  chmod +r "${GOOGLE_JAVA_FORMAT_JAR_FILENAME}"
  chmod +x /usr/local/bin/google-java-format
EOT


ENTRYPOINT []
CMD ["/usr/local/bin/google-java-format"]
