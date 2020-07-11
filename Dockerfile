FROM openjdk:11-jdk-slim@sha256:b577374a385b86572caad3050b122b6aa6dd911cf37421667d248e9d1c638e44

MAINTAINER Mikael Vandmo <mikael@vandmo.se>

ADD https://github.com/google/google-java-format/releases/download/google-java-format-1.8/google-java-format-1.8-all-deps.jar /opt/google-java-format-1.8-all-deps.jar
ADD google-java-format.sh /usr/local/bin/google-java-format
RUN \
 cd /opt && \
 echo "08e05e8843faf78a080963336d0afc0945f9b0010495d3990a7c8e8916f85affc8ca2a05f4384173b8dd8cc2e0fb9b11f7ba4d1d3ef88976210aa6ba1ed55d37  google-java-format-1.8-all-deps.jar" | sha512sum -c - && \
 chmod +x /usr/local/bin/google-java-format
 
CMD ["/usr/local/bin/google-java-format"]
