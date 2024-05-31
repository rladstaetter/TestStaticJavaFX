#!/bin/bash

JP=$HOME/demo1
T=$JP/target
export MAVEN_HOME=/home/saptarshi-sarkar/Downloads/maven-3.9.6/bin && export PATH=/home/saptarshi-sarkar/Downloads/maven-3.9.6/bin:$PATH
export GRAALVM_HOME=~/Downloads/graalvm-22 && export PATH=~/Downloads/graalvm-22/bin:$PATH
export PATH=~/Downloads/musl/bin:$PATH
mvn -f $JP/pom.xml clean install
echo "Running native-image"
native-image \
--no-fallback \
--static \
--libc=musl \
--verbose \
--enable-preview \
--module-path $T/demo1-1.0-SNAPSHOT.jar:$T/modules \
--module org.example.demo1/org.example.demo1.HelloApplication \
-H:+UnlockExperimentalVMOptions \
-H:+ReportExceptionStackTraces \
-H:Name=$T/Demo
# :/home/saptarshi-sarkar/.gluon/substrate/openjfx-22.0.1_linux-x64_bin-sdk/javafx-sdk-22.0.1/lib
# --add-modules javafx.base,javafx.graphics,javafx.controls,javafx.fxml \
#--native-compiler-options=-L/home/saptarshi-sarkar/.gluon/substrate/openjfx-22.0.1_linux-x64_bin-sdk/javafx-sdk-22.0.1/lib
#-H:CCompilerPath=/home/saptarshi-sarkar/Downloads/musl/lib/
#,/home/saptarshi-sarkar/.gluon/substrate/openjfx-22.0.1_linux-x64_bin-sdk/javafx-sdk-22.0.1/lib
#,/home/saptarshi-sarkar/Downloads/graalvm-22/lib

# --initialize-at-build-time=org.sqlite.util.ProcessRunner \
# -cp "$HOME/.m2/repository/org/xerial/sqlite-jdbc/3.45.3.0/sqlite-jdbc-3.45.3.0.jar" \

#cp $T/SimpleOTP $HOME/JavaBASH/
