#!/bin/sh -e
# Create a repository folder with a jar but no pom.
# August 6, 2023

#
#		Assumes JUnit 5 version 5.8.2 is in local repository.
#

cd ~/.m2/repository/org/junit/jupiter/junit-jupiter
cp -r 5.8.2 5.888.2222
cd 5.888.2222
rm *.pom*
mv junit-jupiter-5.8.2.jar junit-jupiter-5.888.2222.jar
mv junit-jupiter-5.8.2.jar.sha1 junit-jupiter-5.888.2222.jar.sha1

