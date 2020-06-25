FROM openjdk:8-jdk-alpine

MAINTAINER Mikael Vandmo <mikael@vandmo.se>

RUN \
 apk --no-cache add bash findutils && \
 cd /opt && \
 wget https://github.com/google/google-java-format/releases/download/google-java-format-1.8/google-java-format-1.8-all-deps.jar && \
 echo "08e05e8843faf78a080963336d0afc0945f9b0010495d3990a7c8e8916f85affc8ca2a05f4384173b8dd8cc2e0fb9b11f7ba4d1d3ef88976210aa6ba1ed55d37  google-java-format-1.8-all-deps.jar" | sha512sum -c - && \
 echo -e "#!/bin/sh\n\njava -jar /opt/google-java-format-1.8-all-deps.jar \"\$@\"" > /usr/local/bin/google-java-format && \
 chmod +x /usr/local/bin/google-java-format
