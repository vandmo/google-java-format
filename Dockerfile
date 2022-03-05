FROM openjdk:17-slim@sha256:fe29809457bee56bef9ee57920bb2c34e23dabdce806b70567ec49743f586311

MAINTAINER Mikael Vandmo <mikael@vandmo.se>

ENV GOOGLE_JAVA_FORMAT_VERSION=1.14.0
ENV GOOGLE_JAVA_FORMAT_JAR_FILENAME=google-java-format-${GOOGLE_JAVA_FORMAT_VERSION}-all-deps.jar
ENV GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH=/opt/${GOOGLE_JAVA_FORMAT_JAR_FILENAME}
ENV GOOGLE_JAVA_FORMAT_JAR_SHA512=20c6dc7f54d8559996e1d38e5c0f27cea20e629a7d5643fef9d71176db4c1a0648931cfdabfff4950a00e317a6e20870e4b51c6022e5cd0e3c6b00db405514d7

ADD https://github.com/google/google-java-format/releases/download/v${GOOGLE_JAVA_FORMAT_VERSION}/${GOOGLE_JAVA_FORMAT_JAR_FILENAME} ${GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH}
ADD google-java-format.sh /usr/local/bin/google-java-format
RUN \
 cd /opt && \
 echo "${GOOGLE_JAVA_FORMAT_JAR_SHA512} ${GOOGLE_JAVA_FORMAT_JAR_FILENAME}" | sha512sum -c - && \
 chmod +x /usr/local/bin/google-java-format

CMD ["/usr/local/bin/google-java-format"]
