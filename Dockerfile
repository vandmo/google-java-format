FROM eclipse-temurin:17@sha256:9abcadc8097bcf1f834786b9ac9e94ed55a3f70a79e2f894fc3df729cc7b907f

LABEL org.opencontainers.image.authors="Mikael Vandmo <mikael@vandmo.se>"

ENV GOOGLE_JAVA_FORMAT_VERSION=1.30.0
ENV GOOGLE_JAVA_FORMAT_JAR_FILENAME=google-java-format-${GOOGLE_JAVA_FORMAT_VERSION}-all-deps.jar
ENV GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH=/opt/${GOOGLE_JAVA_FORMAT_JAR_FILENAME}
ENV GOOGLE_JAVA_FORMAT_JAR_SHA512=dd719b02ea647631a30cd51d733d3a3f73a2f8de92cfbd9bb4f2d23270137f94327794997fc9e0efb3346769b4bd8a40dfec1c527735f9974950fa693a3eee7a

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
