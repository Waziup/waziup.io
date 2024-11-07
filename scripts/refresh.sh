#!/bin/bash
set -ex

echo ">>> Cloning branch '$GIT_URL' [$GIT_BRANCH] ..."

pushd repo
git reset --hard origin/$GIT_BRANCH
git pull origin $GIT_BRANCH
popd

echo ">>> Building site ..."

bash build.sh
