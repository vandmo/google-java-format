FROM openjdk:8-jdk-alpine

MAINTAINER Mikael Vandmo <mikael@vandmo.se>

RUN \
 apk --no-cache add findutils && \
 cd /opt && \
 wget https://github.com/google/google-java-format/releases/download/google-java-format-1.7/google-java-format-1.7-all-deps.jar && \
 echo "5bfb603555cf4e76289774b0c1ad1c243f178580cac6336d0cd4a8dc6bc016f95e219b1a546f20cfcf2e145f58fda2bd2726bad83348d2461718f18d42cd9a04  google-java-format-1.7-all-deps.jar" | sha512sum -c - && \
 echo -e "#!/bin/sh\n\njava -jar /opt/google-java-format-1.7-all-deps.jar \"\$@\"" > /usr/local/bin/google-java-format && \
 chmod +x /usr/local/bin/google-java-format
