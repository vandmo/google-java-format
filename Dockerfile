FROM openjdk:16-jdk-slim@sha256:7ac95ea98fe9de8da6f31e78666b34063ec60bc7667d62106e2c3759846a19dc

MAINTAINER Mikael Vandmo <mikael@vandmo.se>

ADD https://github.com/google/google-java-format/releases/download/v1.10.0/google-java-format-1.10.0-all-deps.jar /opt/google-java-format-1.10.0-all-deps.jar
ADD google-java-format.sh /usr/local/bin/google-java-format
RUN \
 cd /opt && \
 echo "60833aef0713bc45dbe56930c6492fd5e01aab9c57fbc783a3a9ed9f6c9d1ebc34013c733bea804c89985d9ac2f48700715b76c36fa7d6186d9cd7e52cc5aaef  google-java-format-1.10.0-all-deps.jar" | sha512sum -c - && \
 chmod +x /usr/local/bin/google-java-format
 
CMD ["/usr/local/bin/google-java-format"]
