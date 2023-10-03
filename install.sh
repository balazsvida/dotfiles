#!/bin/bash

bak=$(mktemp -d)

for f in $(ls config/); do echo $f; mv -f ~/.$f $bak/; ln -s ~/d/dotfiles/config/$f ~/.$f; done