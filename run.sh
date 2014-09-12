#!/bin/bash
echo "C#"
dmcs --version
echo;
dmcs -warn:0 Tcf.cs
if [ $? -ne 0 ]; then exit $?; fi
./Tcf.exe
if [ $? -ne 0 ]; then exit $?; fi
rm Tcf.exe
echo; echo;

echo "Java"
java -version
javac -version
echo;
javac Tcf.java
if [ $? -ne 0 ]; then exit $?; fi
java Tcf
if [ $? -ne 0 ]; then exit $?; fi
rm Tcf.class
echo; echo;

echo "Python"
python -c "print(__import__('sys').version)"
echo;
python Tcf.py
if [ $? -ne 0 ]; then exit $?; fi
echo; echo;

echo "ECMAScript (Rhino)"
js -e "print(org.mozilla.javascript.Context.getCurrentContext().getImplementationVersion())"
echo;
js Tcf.js
if [ $? -ne 0 ]; then exit $?; fi
echo; echo;

echo "PHP5"
php5 --version
echo;
php5 Tcf.php
if [ $? -ne 0 ]; then exit $?; fi
echo; echo;

echo "Ruby"
ruby --version
echo;
ruby Tcf.rb
if [ $? -ne 0 ]; then exit $?; fi
echo; echo;

echo "D"
gdc --version
echo;
gdc -o tcf-d Tcf.d
if [ $? -ne 0 ]; then exit $?; fi
./tcf-d
if [ $? -ne 0 ]; then exit $?; fi
rm tcf-d
echo; echo;

echo "Objective-C"
gcc --version
echo;
gcc `gnustep-config --objc-flags` -w Tcf.m -o tcf-objc -I /usr/include/GNUstep/ -L /usr/lib/GNUstep/ -lgnustep-base
if [ $? -ne 0 ]; then exit $?; fi
./tcf-objc
if [ $? -ne 0 ]; then exit $?; fi
rm tcf-objc tcf-objc.d
echo; echo;
