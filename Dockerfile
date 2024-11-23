FROM eclipse-temurin:17@sha256:7e8fa4fb285fb51adc6ca630e5bdcd5aec97bb1d7cdb55c443054ccac6627897

LABEL org.opencontainers.image.authors="Mikael Vandmo <mikael@vandmo.se>"

ENV GOOGLE_JAVA_FORMAT_VERSION=1.25.0
ENV GOOGLE_JAVA_FORMAT_JAR_FILENAME=google-java-format-${GOOGLE_JAVA_FORMAT_VERSION}-all-deps.jar
ENV GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH=/opt/${GOOGLE_JAVA_FORMAT_JAR_FILENAME}
ENV GOOGLE_JAVA_FORMAT_JAR_SHA512=bbf00cfc513191400c08daa72aa182ab00ab8d2f2924953ba3154753a7b439b33a7f41771a09108e060133a21b8c67d0a5e3aae65dcf16ef6a20984514f7ea5d

ADD https://github.com/google/google-java-format/releases/download/v${GOOGLE_JAVA_FORMAT_VERSION}/${GOOGLE_JAVA_FORMAT_JAR_FILENAME} ${GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH}
ADD google-java-format.sh /usr/local/bin/google-java-format
RUN \
 cd /opt && \
 echo "${GOOGLE_JAVA_FORMAT_JAR_SHA512} ${GOOGLE_JAVA_FORMAT_JAR_FILENAME}" | sha512sum -c - && \
 chmod +x /usr/local/bin/google-java-format

ENTRYPOINT []
CMD ["/usr/local/bin/google-java-format"]
