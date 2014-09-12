Try-Catch-Finally
=================

.. image:: https://travis-ci.org/tritium21/trycatchfinally.svg?branch=master
    :target: https://travis-ci.org/tritium21/trycatchfinally

One day in #python, someone made the assertion that the behavior of nested
``try...catch...finally`` structures in the JVM was vastly different than
nested ``try...except...finally`` structures in Python.  Their specific
complaint was about the order that ``finally`` blocks were executed.  This repo
exists to demonstrate these structures in as many languages as possible.
