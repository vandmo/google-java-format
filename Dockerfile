FROM eclipse-temurin:25@sha256:83f4a7fc27df94dcc7b8de04d14cbbba8da14406f921e966969c3b09000aa507

LABEL org.opencontainers.image.authors="Mikael Vandmo <mikael@vandmo.se>"

ENV GOOGLE_JAVA_FORMAT_VERSION=1.37.0
ENV GOOGLE_JAVA_FORMAT_JAR_FILENAME=google-java-format-${GOOGLE_JAVA_FORMAT_VERSION}-all-deps.jar
ENV GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH=/opt/${GOOGLE_JAVA_FORMAT_JAR_FILENAME}
ENV GOOGLE_JAVA_FORMAT_JAR_SHA512=0ec5c14b23a87dd9dfc66d877c9bcbcd43e045b17a1454aa9d5606f6e586c79a2abe7c84fafcde2765b580329146fca13de38f22bbe9946fac78f3817bf7aa19

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
