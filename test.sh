#!/bin/sh
set -ev
lc80=`nc -v localhost 80`
lc8000=`nc -v localhost 8000`
echo "localhost says: $lc80"
echo "localhost says: $lc8000"
