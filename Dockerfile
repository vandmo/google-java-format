FROM eclipse-temurin:17@sha256:b78349c8894d78a492bfc5388ed0d54c1f3255e3a42d32b74ed8d1216c59fd37

LABEL org.opencontainers.image.authors="Mikael Vandmo <mikael@vandmo.se>"

ENV GOOGLE_JAVA_FORMAT_VERSION=1.25.2
ENV GOOGLE_JAVA_FORMAT_JAR_FILENAME=google-java-format-${GOOGLE_JAVA_FORMAT_VERSION}-all-deps.jar
ENV GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH=/opt/${GOOGLE_JAVA_FORMAT_JAR_FILENAME}
ENV GOOGLE_JAVA_FORMAT_JAR_SHA512=70acecf006ab02a463d7bc589fa29a08d03d563a86cc7ba8b527718240236a7a1d7051718230643d1fccd14802de58a455491906987a1445e65fcf0f56380e5d

ADD https://github.com/google/google-java-format/releases/download/v${GOOGLE_JAVA_FORMAT_VERSION}/${GOOGLE_JAVA_FORMAT_JAR_FILENAME} ${GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH}
ADD google-java-format.sh /usr/local/bin/google-java-format
RUN \
 cd /opt && \
 echo "${GOOGLE_JAVA_FORMAT_JAR_SHA512} ${GOOGLE_JAVA_FORMAT_JAR_FILENAME}" | sha512sum -c - && \
 chmod +x /usr/local/bin/google-java-format

ENTRYPOINT []
CMD ["/usr/local/bin/google-java-format"]
