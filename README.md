# google-java-format
[![Build Status](https://github.com/vandmo/google-java-format/actions/workflows/test-and-release.yaml/badge.svg)](https://github.com/vandmo/google-java-format/actions/workflows/test-and-release.yaml)
[![Docker Hub](https://img.shields.io/docker/v/vandmo/google-java-format)](https://hub.docker.com/r/vandmo/google-java-format)

Dockerization of https://github.com/google/google-java-format

Examples:

```sh
docker run --rm -v ${PWD}:/local vandmo/google-java-format google-java-format -i /local/SomeFile.java
```

```sh
docker run --rm -v ${PWD}:/local vandmo/google-java-format find /local/ -name '*.java' -exec google-java-format -i {} \;
```
