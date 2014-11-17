#!/bin/bash
sudo add-apt-repository ppa:ondrej/php5 -y
sudo apt-get update -qq
sudo apt-get install php5 mono-dmcs mono-vbnc gdc gnustep-devel gobjc nodejs fpc -qq -y
pip install Pygments==2.0.1
