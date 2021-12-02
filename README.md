# google-java-format
![release](https://github.com/vandmo/google-java-format/actions/workflows/test-and-build.yaml/badge.svg)

Dockerization of https://github.com/google/google-java-format

Examples:

```sh
docker run --rm -v ${PWD}:/local vandmo/google-java-format google-java-format -i /local/SomeFile.java 
```

```sh
docker run --rm -v ${PWD}:/local vandmo/google-java-format find /local/ -name '*.java' -exec google-java-format -i {} \;
```
