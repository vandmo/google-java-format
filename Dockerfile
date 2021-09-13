FROM openjdk:16-jdk-slim@sha256:f74e140721bffb24b1317df8c8b4ea30c7dd2c068b563e89d4c6f033ebbdad12

MAINTAINER Mikael Vandmo <mikael@vandmo.se>

ADD https://github.com/google/google-java-format/releases/download/v1.11.0/google-java-format-1.11.0-all-deps.jar /opt/google-java-format-1.11.0-all-deps.jar
ADD google-java-format.sh /usr/local/bin/google-java-format
RUN \
 cd /opt && \
 echo "cf32b1f2f2a5939c4166e7ae6a3474287ed6b06da1425a8b52cfbb32b5d78dafc3f4d017a9bbb508a197bcee162449c90ab32cc4da4ec96cf84cbddbbad8dc92 google-java-format-1.11.0-all-deps.jar" | sha512sum -c - && \
 chmod +x /usr/local/bin/google-java-format
 
CMD ["/usr/local/bin/google-java-format"]
