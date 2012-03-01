#!/bin/sh

cd
git clone git://github.com/pelme/pelmerc.git .pelmerc
cd .pelmerc
git submodule update --init
~/.pelmerc/bin/prc_install
