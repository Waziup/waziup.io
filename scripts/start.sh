#!/bin/bash
set -ex

echo ">>> Cloning repository ..."

mkdir -p "$HUGO_DESTINATION"

git clone "$GIT_URL" --single-branch --branch "$GIT_BRANCH" repo

echo ">>> Building site ..."

source build.sh