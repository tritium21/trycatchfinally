#!/bin/bash
echo "C#"
dmcs -warn:0 Tcf.cs
./Tcf.exe
rm Tcf.exe
echo; echo;

echo "Java"
javac Tcf.java
java Tcf
rm Tcf.class
echo; echo;

echo "Python"
python Tcf.py
echo; echo;

echo "ECMAScript"
js Tcf.js
echo; echo;

echo "PHP5"
php5 Tcf.php
echo; echo;
