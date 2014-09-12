#!/bin/bash
tput setaf 3
echo "C#"
tput setaf 1
echo "Version"
tput sgr 0
dmcs --version
tput setaf 1
echo; echo "CODE"
tput setaf 2
cat Tcf.cs
tput setaf 1
echo; echo "STDOUT"
tput sgr 0
dmcs -warn:0 Tcf.cs
if [ $? -ne 0 ]; then exit $?; fi
./Tcf.exe
if [ $? -ne 0 ]; then exit $?; fi
rm Tcf.exe
echo; echo;

tput setaf 3
echo "Java"
tput setaf 1
echo "Version"
tput sgr 0
java -version
javac -version
tput setaf 1
echo; echo "CODE"
tput setaf 2
cat Tcf.java
tput setaf 1
echo; echo "STDOUT"
tput sgr 0
javac Tcf.java
if [ $? -ne 0 ]; then exit $?; fi
java Tcf
if [ $? -ne 0 ]; then exit $?; fi
rm Tcf.class
echo; echo;

tput setaf 3
echo "Python"
tput setaf 1
echo "Version"
tput sgr 0
python -c "print(__import__('sys').version)"
tput setaf 1
echo; echo "CODE"
tput setaf 2
cat Tcf.py
tput setaf 1
echo; echo "STDOUT"
tput sgr 0
python Tcf.py
if [ $? -ne 0 ]; then exit $?; fi
echo; echo;

tput setaf 3
echo "ECMAScript (Rhino)"
tput setaf 1
echo "Version"
tput sgr 0
js -e "print(org.mozilla.javascript.Context.getCurrentContext().getImplementationVersion())"
tput setaf 1
echo; echo "CODE"
tput setaf 2
cat Tcf.js
tput setaf 1
echo; echo "STDOUT"
tput sgr 0
js Tcf.js
if [ $? -ne 0 ]; then exit $?; fi
echo; echo;

tput setaf 3
echo "PHP5"
tput setaf 1
echo "Version"
tput sgr 0
php5 --version
tput setaf 1
echo; echo "CODE"
tput setaf 2
cat Tcf.php
tput setaf 1
echo; echo "STDOUT"
tput sgr 0
php5 Tcf.php
if [ $? -ne 0 ]; then exit $?; fi
echo; echo;

tput setaf 3
echo "Ruby"
tput setaf 1
echo "Version"
tput sgr 0
ruby --version
tput setaf 1
echo; echo "CODE"
tput setaf 2
cat Tcf.rb
tput setaf 1
echo; echo "STDOUT"
tput sgr 0
ruby Tcf.rb
if [ $? -ne 0 ]; then exit $?; fi
echo; echo;

tput setaf 3
echo "D"
tput setaf 1
echo "Version"
tput sgr 0
gdc --version
tput setaf 1
echo; echo "CODE" 
tput setaf 2
cat Tcf.d
tput setaf 1
echo; echo "STDOUT"
tput sgr 0
gdc -o tcf-d Tcf.d
if [ $? -ne 0 ]; then exit $?; fi
./tcf-d
if [ $? -ne 0 ]; then exit $?; fi
rm tcf-d
echo; echo;

tput setaf 3
echo "Objective-C"
tput setaf 1
echo "Version"
tput sgr 0
gcc --version
tput setaf 1
echo; echo "CODE"
tput setaf 2
cat Tcf.m
tput setaf 1
echo; echo "STDOUT"
tput sgr 0
gcc `gnustep-config --objc-flags` -w Tcf.m -o tcf-objc -I /usr/include/GNUstep/ -L /usr/lib/GNUstep/ -lgnustep-base
if [ $? -ne 0 ]; then exit $?; fi
./tcf-objc
if [ $? -ne 0 ]; then exit $?; fi
rm tcf-objc tcf-objc.d
echo; echo;
tput sgr 0
