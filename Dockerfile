FROM openjdk:17-slim@sha256:d78b76268a76f7f4d872faf78fdfff71e207cfd474f960572c3ab146e2640506

MAINTAINER Mikael Vandmo <mikael@vandmo.se>

ADD https://github.com/google/google-java-format/releases/download/v1.12.0/google-java-format-1.12.0-all-deps.jar /opt/google-java-format-1.12.0-all-deps.jar
ADD google-java-format.sh /usr/local/bin/google-java-format
RUN \
 cd /opt && \
 echo "8c0d9263c477df4f575b050c16ef4dfe5a7932bf1baddd7b6e2af66aad431a7ed1288aae9d45f75ae5403585be74eb82ed090d513491418ad240c1faa0bcf8c6 google-java-format-1.12.0-all-deps.jar" | sha512sum -c - && \
 chmod +x /usr/local/bin/google-java-format

CMD ["/usr/local/bin/google-java-format"]
