FROM openjdk:15-jdk-slim@sha256:227f91fd119194b2f200ba6e54e9a87ca6ff4ade6d32060eb87defdee8585aa0

MAINTAINER Mikael Vandmo <mikael@vandmo.se>

ADD https://github.com/google/google-java-format/releases/download/google-java-format-1.9/google-java-format-1.9-all-deps.jar /opt/google-java-format-1.9-all-deps.jar
ADD google-java-format.sh /usr/local/bin/google-java-format
RUN \
 cd /opt && \
 echo "6aed9db6149df8ec6f3d7c00ff04659477dd147a4305d207d0821bb3547cdd3d65fa7d74828a12bbec38370490542d58bb03accf0e10330652decfda2c749ee6  google-java-format-1.9-all-deps.jar" | sha512sum -c - && \
 chmod +x /usr/local/bin/google-java-format
 
CMD ["/usr/local/bin/google-java-format"]
