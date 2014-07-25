#!/bin/bash
################################
# Pre-requis :
# apt-install jpegoptim optipng
#
# Update 2013-12-04: As of jpegoptim version v1.3.0 a new option ‘–all-progressive’ 
# is available, which is recommended to use
#
# # m h dom mon dow command
# 0 1 * * * /root/optimize-images.sh
#################################
 
# TODO : ajouter l'attribut -mtime -2
## < 100k 
find . -iname "*.jpg" -size -100k | xargs jpegoptim --strip-all --max=80
 
## >= 100k and  <200k
find . -iname "*.jpg" -size +100k -a -size -200k | xargs jpegoptim --strip-all --max=60
 
## > 200k and  <= 500k
find . -iname "*.jpg" -size +200k -a -size -500k | xargs jpegoptim --strip-all --max=30
 
## > 500k
find . -iname "*.jpg" -size +500k  | xargs jpegoptim --strip-all --max=20


# mogrify -resize "500x500>" *.jpg
# appartenant a GraphicsMagic
#

# TODO : optimisation des PNG
# find /var/www/ -mtime -2 -iname '*.png' -print0 | xargs -0 optipng -o7 -log /root/optipng.log -preserve
