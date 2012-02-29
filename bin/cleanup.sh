#!/bin/sh

# Mac OS crap
find . -name "*:2e*" -exec rm {} \; &>/dev/null
find . -name ".AppleDouble" -exec rm -rf {} \; &>/dev/null


# Python byte code
find . -name "*.pyc" -exec rm {} \; &>/dev/null

# Object files
find . -name "*.o" -exec rm {} \; &>/dev/null

# ADA files
find . -name "*.ali" -exec rm {} \; &>/dev/null
