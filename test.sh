#!/bin/sh
set -ev
lc80=`nc -v localhost 80`
acrolc80=`nc -v acropolis.localhost 80`
lc8000=`nc -v localhost 8000`
acrolc8000=`nc -v acropolis.localhost 8000`
echo "localhost says: $lc80"
echo "localhost says: $lc8000"
echo "acropolis.localhost says: $acrolc80"
echo "acropolis.localhost says: $acrolc8080"
