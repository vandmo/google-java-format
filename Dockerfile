FROM eclipse-temurin:17@sha256:8bc13a6c14b467113cc621810809dba4b1a3c199537f3088c03545790efb4391

MAINTAINER Mikael Vandmo <mikael@vandmo.se>

ENV GOOGLE_JAVA_FORMAT_VERSION=1.18.0
ENV GOOGLE_JAVA_FORMAT_JAR_FILENAME=google-java-format-${GOOGLE_JAVA_FORMAT_VERSION}-all-deps.jar
ENV GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH=/opt/${GOOGLE_JAVA_FORMAT_JAR_FILENAME}
ENV GOOGLE_JAVA_FORMAT_JAR_SHA512=c82ea7aec61af2d9eea49b4940c330048e4ee71c6fd81d53c4d81207b5c0f99dfeef3ca402bdbcde950333db7baa85084f0c6ca06c0eee3438f6338421a8f1b7

ADD https://github.com/google/google-java-format/releases/download/v${GOOGLE_JAVA_FORMAT_VERSION}/${GOOGLE_JAVA_FORMAT_JAR_FILENAME} ${GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH}
ADD google-java-format.sh /usr/local/bin/google-java-format
RUN \
 cd /opt && \
 echo "${GOOGLE_JAVA_FORMAT_JAR_SHA512} ${GOOGLE_JAVA_FORMAT_JAR_FILENAME}" | sha512sum -c - && \
 chmod +x /usr/local/bin/google-java-format

ENTRYPOINT []
CMD ["/usr/local/bin/google-java-format"]
