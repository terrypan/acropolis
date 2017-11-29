#!/bin/sh
set -ev
lc=`nc -v localhost`
acrolc=`nc -v acropolis.localhost`
echo "localhost says: $lc"
echo "acropolis.localhost says: $acrolc"
