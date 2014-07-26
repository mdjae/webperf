#!/bin/bash
################################
# Pre-requis :
# apt-install jpegoptim optipng imagemagick
#
# Update 2013-12-04: As of jpegoptim version v1.3.0 a new option ‘–all-progressive’ 
# is available, which is recommended to use
#
# # m h dom mon dow command
# 0 1 * * * /root/optimize-images.sh
#################################
 
# TODO : ajouter l'attribut -mtime -2
# Sinon une même image pourrait être optimiser plusieurs fois
# entrant une perte de qualité 
#
#

cd $ROOT_PATH

# losselessly optimization
find . -iname "*.jpg" | xargs jpegoptim --strip-all 

## < 100k 
find . -iname "*.jpg" -size -100k | xargs jpegoptim --strip-all --max=60
 
## >= 100k and  <200k
find . -iname "*.jpg" -size +100k -a -size -200k | xargs jpegoptim --strip-all --max=60
 
## > 200k and  <= 500k
find . -iname "*.jpg" -size +200k -a -size -500k | xargs jpegoptim --strip-all --max=50
 
## > 500k
find . -iname "*.jpg" -size +500k  | xargs jpegoptim --strip-all --max=50


# Resize des fichiers
# 
## resize generale
mogrify -resize 800x600 *.jpg


#### Thumbnail

## media/catalog/category   120x120

## media/catalog/product

## media/images

## media/catalog/product/cache/1/small_image/   120x120

## media/catalog/product/cache/1/thumbnail/      60x60

## media/content/

## skin/frontend/xxx/xxx/images/





# TODO : optimisation des PNG
# find /var/www/ -mtime -2 -iname '*.png' -print0 | xargs -0 optipng -o7 -log /root/optipng.log -preserve

## < 100k 
find . -iname '*.png' -size -100k | xargs optipng -o5 -preserve -strip
## >= 100k and  <200k
find . -iname '*.png' -size +100k -a -size -200k | xargs optipng -o5 -preserve -strip
## > 200k and  <= 500k
find . -iname '*.png' -size +200k -a -size -500k | xargs optipng -o7 -preserve -strip
## > 500k
find . -iname '*.png' -size +500k | xargs optipng -o7 -preserve -strip






