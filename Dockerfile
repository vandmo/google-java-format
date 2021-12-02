FROM openjdk:17-slim@sha256:d78b76268a76f7f4d872faf78fdfff71e207cfd474f960572c3ab146e2640506

MAINTAINER Mikael Vandmo <mikael@vandmo.se>

ENV GOOGLE_JAVA_FORMAT_VERSION=1.12.0
ENV GOOGLE_JAVA_FORMAT_JAR_FILENAME=google-java-format-${GOOGLE_JAVA_FORMAT_VERSION}-all-deps.jar
ENV GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH=/opt/${GOOGLE_JAVA_FORMAT_JAR_FILENAME}
ENV GOOGLE_JAVA_FORMAT_JAR_SHA512=8c0d9263c477df4f575b050c16ef4dfe5a7932bf1baddd7b6e2af66aad431a7ed1288aae9d45f75ae5403585be74eb82ed090d513491418ad240c1faa0bcf8c6

ADD https://github.com/google/google-java-format/releases/download/v${GOOGLE_JAVA_FORMAT_VERSION}/${GOOGLE_JAVA_FORMAT_JAR_FILENAME} ${GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH}
ADD google-java-format.sh /usr/local/bin/google-java-format
RUN \
 cd /opt && \
 echo "${GOOGLE_JAVA_FORMAT_JAR_SHA512} ${GOOGLE_JAVA_FORMAT_JAR_FILENAME}" | sha512sum -c - && \
 chmod +x /usr/local/bin/google-java-format

CMD ["/usr/local/bin/google-java-format"]
