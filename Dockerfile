FROM eclipse-temurin:17@sha256:710bbe5d41a4c48ecd1e8d5be5f05d49132a102ab70961006d0675ed8b387d86

LABEL org.opencontainers.image.authors="Mikael Vandmo <mikael@vandmo.se>"

ENV GOOGLE_JAVA_FORMAT_VERSION=1.34.1
ENV GOOGLE_JAVA_FORMAT_JAR_FILENAME=google-java-format-${GOOGLE_JAVA_FORMAT_VERSION}-all-deps.jar
ENV GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH=/opt/${GOOGLE_JAVA_FORMAT_JAR_FILENAME}
ENV GOOGLE_JAVA_FORMAT_JAR_SHA512=3eac55d8dfa9b0ff0b5e908f0802a819abac145497f5e5f3b55ae537a71227dc7eff040e811f78e38660a62ca0864238aabe1dca7a769a6596f8f33a5eba4687

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
