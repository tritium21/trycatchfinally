#!/bin/bash
echo "C#"
dmcs -warn:0 Tcf.cs
if [ $? -ne 0 ]; then exit $?; fi
./Tcf.exe
if [ $? -ne 0 ]; then exit $?; fi
rm Tcf.exe
if [ $? -ne 0 ]; then exit $?; fi
echo; echo;

echo "Java"
javac Tcf.java
if [ $? -ne 0 ]; then exit $?; fi
java Tcf
if [ $? -ne 0 ]; then exit $?; fi
rm Tcf.class
if [ $? -ne 0 ]; then exit $?; fi
echo; echo;

echo "Python"
python Tcf.py
if [ $? -ne 0 ]; then exit $?; fi
echo; echo;

echo "ECMAScript"
js Tcf.js
if [ $? -ne 0 ]; then exit $?; fi
echo; echo;

echo "PHP5"
php5 Tcf.php
if [ $? -ne 0 ]; then exit $?; fi
echo; echo;
