# TestStaticJavaFX
This is a project where I was attempting to create a static binary of a JavaFX project using only GraalVM

## Requirements
- JDK version 22
- GraalVM version 22
- `musl` and `zlib` - For setup, read [this docs provided by graalVM](https://www.graalvm.org/latest/reference-manual/native-image/guides/build-static-executables/)
- `make` and `configure`

## How to build static binary?
> [!IMPORTANT]
> Change the required paths in the `native.sh` file before running it.

- Run `mvn clean install` in the root of the project. This will create a Jar and put the jar of the required modules in the `target/modules` directory.
- Next, run `native.sh` file which will invoke the native image to build a static binary.
- The binary gets created successfully.

## Problem faced while running it
When I try to run the static executable built earlier, I encounter the following error 👇
```sh
```
