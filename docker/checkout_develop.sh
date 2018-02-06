#!/bin/bash
set -e

for repo in quilt spindle twine anansi libsql libcluster; do
  cd $repo
  git checkout develop
  git pull
  git submodule update --init --recursive
  cd ..
done
