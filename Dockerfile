FROM eclipse-temurin:20@sha256:f2f82ba81dae08f785bd1e37bd0597b7e514408d1f08d6676a0cba170568b776

MAINTAINER Mikael Vandmo <mikael@vandmo.se>

ENV GOOGLE_JAVA_FORMAT_VERSION=1.16.0
ENV GOOGLE_JAVA_FORMAT_JAR_FILENAME=google-java-format-${GOOGLE_JAVA_FORMAT_VERSION}-all-deps.jar
ENV GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH=/opt/${GOOGLE_JAVA_FORMAT_JAR_FILENAME}
ENV GOOGLE_JAVA_FORMAT_JAR_SHA512=7ae1966474d095dd52d4a2aae58696700ed9d3be05868eccdcc570eb408877177090c4abc40a0f2533d557330f7144a5e478af2c793a8b5658c728ad5c469493

ADD https://github.com/google/google-java-format/releases/download/v${GOOGLE_JAVA_FORMAT_VERSION}/${GOOGLE_JAVA_FORMAT_JAR_FILENAME} ${GOOGLE_JAVA_FORMAT_JAR_ABSOLUTE_PATH}
ADD google-java-format.sh /usr/local/bin/google-java-format
RUN \
 cd /opt && \
 echo "${GOOGLE_JAVA_FORMAT_JAR_SHA512} ${GOOGLE_JAVA_FORMAT_JAR_FILENAME}" | sha512sum -c - && \
 chmod +x /usr/local/bin/google-java-format

ENTRYPOINT []
CMD ["/usr/local/bin/google-java-format"]
