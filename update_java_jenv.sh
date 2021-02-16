#!/bin/bash
# Automatic update for Java versions for jenv with brew

echo update java versions


for i in $(brew list --cask | grep adoptopenjdk);
do
echo reinstalling $i...
brew reinstall adoptopenjdk/openjdk/$i
done

for i in $(ls /Library/Java/JavaVirtualMachines/);
do
jenv add "/Library/Java/JavaVirtualMachines/$i/Contents/Home";
jenv refresh-versions
done

jenv versions