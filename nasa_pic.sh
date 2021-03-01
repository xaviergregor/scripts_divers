#!/bin/bash

APOD_URL="https://apod.nasa.gov/apod/"
IMG_RE='<a href="image/.*\.jpg">'

IMG_REF=$( curl $APOD_URL 2> /dev/null | grep -m1 "$IMG_RE" | perl -pe 's/^.*<a href="//; s/^(.*\.jpg)".*$/$1/' )
IMG_URL=$APOD_URL/$IMG_REF

( cd $HOME/Desktop ; /usr/local/bin/wget $IMG_URL )
