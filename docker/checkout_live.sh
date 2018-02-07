#!/bin/bash
set -e

for repo in anansi libawsclient libcluster liblod libmq libsparqlclient libsql liburi quilt spindle twine anansi twine-anansi-bridge; do
  cd $repo
  git checkout live
  git pull
  git submodule update --init --recursive
  cd ..
done

# patchwork to latest develop
cd patchwork
git checkout fe2a10bca01f55c595e7927595caaa2b70999f78
cd ..
