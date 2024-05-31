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
When I try to run the **static executable** built earlier, I encounter the following error 👇
```prolog
Loading library prism_es2 from resource failed: java.lang.UnsatisfiedLinkError: Can't load library: /home/saptarshi-sarkar/.openjfx/cache/22-ea+11/amd64/libprism_es2.so
java.lang.UnsatisfiedLinkError: Can't load library: /home/saptarshi-sarkar/.openjfx/cache/22-ea+11/amd64/libprism_es2.so
	at org.graalvm.nativeimage.builder/com.oracle.svm.core.jdk.NativeLibraries.loadLibraryAbsolute(NativeLibraries.java:105)
	at java.base@22.0.1/java.lang.ClassLoader.loadLibrary(ClassLoader.java:114)
	at java.base@22.0.1/java.lang.Runtime.load0(Runtime.java:852)
	at java.base@22.0.1/java.lang.System.load(System.java:2030)
	at javafx.graphics@22-ea/com.sun.glass.utils.NativeLibLoader.installLibraryFromResource(NativeLibLoader.java:220)
	at javafx.graphics@22-ea/com.sun.glass.utils.NativeLibLoader.loadLibraryFromResource(NativeLibLoader.java:200)
	at javafx.graphics@22-ea/com.sun.glass.utils.NativeLibLoader.loadLibraryInternal(NativeLibLoader.java:142)
	at javafx.graphics@22-ea/com.sun.glass.utils.NativeLibLoader.loadLibrary(NativeLibLoader.java:58)
	at javafx.graphics@22-ea/com.sun.prism.es2.ES2Pipeline.lambda$static$0(ES2Pipeline.java:63)
	at java.base@22.0.1/java.security.AccessController.executePrivileged(AccessController.java:128)
	at java.base@22.0.1/java.security.AccessController.doPrivileged(AccessController.java:319)
	at javafx.graphics@22-ea/com.sun.prism.es2.ES2Pipeline.<clinit>(ES2Pipeline.java:52)
	at java.base@22.0.1/java.lang.Class.ensureInitialized(DynamicHub.java:599)
	at java.base@22.0.1/java.lang.Class.forName(DynamicHub.java:1396)
	at java.base@22.0.1/java.lang.Class.forName(DynamicHub.java:1352)
	at java.base@22.0.1/java.lang.Class.forName(DynamicHub.java:1346)
	at javafx.graphics@22-ea/com.sun.prism.GraphicsPipeline.createPipeline(GraphicsPipeline.java:218)
	at javafx.graphics@22-ea/com.sun.javafx.tk.quantum.QuantumRenderer$PipelineRunnable.init(QuantumRenderer.java:92)
	at javafx.graphics@22-ea/com.sun.javafx.tk.quantum.QuantumRenderer$PipelineRunnable.run(QuantumRenderer.java:125)
	at java.base@22.0.1/java.lang.Thread.runWith(Thread.java:1583)
	at java.base@22.0.1/java.lang.Thread.run(Thread.java:1570)
	at org.graalvm.nativeimage.builder/com.oracle.svm.core.thread.PlatformThreads.threadStartRoutine(PlatformThreads.java:853)
	at org.graalvm.nativeimage.builder/com.oracle.svm.core.thread.PlatformThreads.threadStartRoutine(PlatformThreads.java:829)
Graphics Device initialization failed for :  es2, sw
Error initializing QuantumRenderer: no suitable pipeline found
java.lang.RuntimeException: java.lang.RuntimeException: Error initializing QuantumRenderer: no suitable pipeline found
	at javafx.graphics@22-ea/com.sun.javafx.tk.quantum.QuantumRenderer.getInstance(QuantumRenderer.java:283)
	at javafx.graphics@22-ea/com.sun.javafx.tk.quantum.QuantumToolkit.init(QuantumToolkit.java:253)
	at javafx.graphics@22-ea/com.sun.javafx.tk.Toolkit.getToolkit(Toolkit.java:263)
	at javafx.graphics@22-ea/com.sun.javafx.application.PlatformImpl.startup(PlatformImpl.java:290)
	at javafx.graphics@22-ea/com.sun.javafx.application.PlatformImpl.startup(PlatformImpl.java:162)
	at javafx.graphics@22-ea/com.sun.javafx.application.LauncherImpl.startToolkit(LauncherImpl.java:651)
	at javafx.graphics@22-ea/com.sun.javafx.application.LauncherImpl.launchApplication1(LauncherImpl.java:671)
	at javafx.graphics@22-ea/com.sun.javafx.application.LauncherImpl.lambda$launchApplication$2(LauncherImpl.java:196)
	at java.base@22.0.1/java.lang.Thread.runWith(Thread.java:1583)
	at java.base@22.0.1/java.lang.Thread.run(Thread.java:1570)
	at org.graalvm.nativeimage.builder/com.oracle.svm.core.thread.PlatformThreads.threadStartRoutine(PlatformThreads.java:853)
	at org.graalvm.nativeimage.builder/com.oracle.svm.core.thread.PlatformThreads.threadStartRoutine(PlatformThreads.java:829)
Caused by: java.lang.RuntimeException: Error initializing QuantumRenderer: no suitable pipeline found
	at javafx.graphics@22-ea/com.sun.javafx.tk.quantum.QuantumRenderer$PipelineRunnable.init(QuantumRenderer.java:95)
	at javafx.graphics@22-ea/com.sun.javafx.tk.quantum.QuantumRenderer$PipelineRunnable.run(QuantumRenderer.java:125)
	... 4 more
Exception in thread "main" java.lang.RuntimeException: No toolkit found
	at javafx.graphics@22-ea/com.sun.javafx.tk.Toolkit.getToolkit(Toolkit.java:275)
	at javafx.graphics@22-ea/com.sun.javafx.application.PlatformImpl.startup(PlatformImpl.java:290)
	at javafx.graphics@22-ea/com.sun.javafx.application.PlatformImpl.startup(PlatformImpl.java:162)
	at javafx.graphics@22-ea/com.sun.javafx.application.LauncherImpl.startToolkit(LauncherImpl.java:651)
	at javafx.graphics@22-ea/com.sun.javafx.application.LauncherImpl.launchApplication1(LauncherImpl.java:671)
	at javafx.graphics@22-ea/com.sun.javafx.application.LauncherImpl.lambda$launchApplication$2(LauncherImpl.java:196)
	at java.base@22.0.1/java.lang.Thread.runWith(Thread.java:1583)
	at java.base@22.0.1/java.lang.Thread.run(Thread.java:1570)
	at org.graalvm.nativeimage.builder/com.oracle.svm.core.thread.PlatformThreads.threadStartRoutine(PlatformThreads.java:853)
	at org.graalvm.nativeimage.builder/com.oracle.svm.core.thread.PlatformThreads.threadStartRoutine(PlatformThreads.java:829)
```

## Solution
I am _**still now looking for a feasible solution**_ to the above issue. I know about [GluonFx Maven Plugin](https://github.com/gluonhq/gluonfx-maven-plugin) but, it **does not** generate a **static executable**.
> [!NOTE]
> If anyone has found out a solution, you can open an issue/discussion or a Pull Request to solve the error mentioning the changes required. It would be very helpful for the community 😄.
