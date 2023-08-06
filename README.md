August 6, 2023


Demo git repository for Open Rewrite maintainers
==================================================

The commit history in this repository explains the steps, but the
end state is that when you run `mvn rewrite:run`, the Spring Boot
version is not updated from 2.6.8 to 2.7.14.

To get a project into this state, you must have a Maven repository
folder with jar but no pom file; which could happen, if you have
an on-site repository and you upload a jar and forget to upload the
pom.

The script `make-invalid-dependency.sh` will create such a repository
under your local `~/.m2/releases` repository, but assumes that you
have JUnit 5 version 5.8.2 installed.  To test with another dependency,
update both this script and the `<dependency>` stanza in the pom.xml.

Output of failed run:

```
% mvn rewrite:run
[INFO] Scanning for projects...
[INFO] 
[INFO] --------------------------< com.example:demo >--------------------------
[INFO] Building demo 0.0.1-SNAPSHOT
[INFO] --------------------------------[ jar ]---------------------------------
[INFO] 
[INFO] >>> rewrite-maven-plugin:5.4.0:run (default-cli) > process-test-classes @ demo >>>
[WARNING] The POM for org.junit.jupiter:junit-jupiter:jar:5.888.2222 is missing, no dependency information available
[INFO] 
[INFO] --- maven-resources-plugin:3.2.0:resources (default-resources) @ demo ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] Using 'UTF-8' encoding to copy filtered properties files.
[INFO] Copying 1 resource
[INFO] Copying 0 resource
[INFO] 
[INFO] --- maven-compiler-plugin:3.8.1:compile (default-compile) @ demo ---
[INFO] Nothing to compile - all classes are up to date
[INFO] 
[INFO] --- maven-resources-plugin:3.2.0:testResources (default-testResources) @ demo ---
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] Using 'UTF-8' encoding to copy filtered properties files.
[INFO] skip non existing resourceDirectory /Users/markbucciarelli/Library/Mobile Documents/com~apple~CloudDocs/work/openrewrite/demo/src/test/resources
[INFO] 
[INFO] --- maven-compiler-plugin:3.8.1:testCompile (default-testCompile) @ demo ---
[INFO] Nothing to compile - all classes are up to date
[INFO] 
[INFO] <<< rewrite-maven-plugin:5.4.0:run (default-cli) < process-test-classes @ demo <<<
[INFO] 
[INFO] 
[INFO] --- rewrite-maven-plugin:5.4.0:run (default-cli) @ demo ---
[INFO] Using active recipe(s) [org.openrewrite.java.spring.boot2.UpgradeSpringBoot_2_7]
[INFO] Using active styles(s) []
[INFO] Validating active recipes...
[INFO] Project [demo] Resolving Poms...
[INFO] Project [demo] Parsing source files
[INFO] Running recipe(s)...
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  10.242 s
[INFO] Finished at: 2023-08-06T17:41:04-04:00
[INFO] ------------------------------------------------------------------------
%
```
