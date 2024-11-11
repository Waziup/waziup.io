#!/bin/bash
set -e

echo ">>> Hugo building '$HUGO_BASE_URL' ..."

mkdir -p /tmp/hugo-build-log

pushd "repo/$GIT_CONTENT_PATH"

# Build the site, capture the output to a file and ignore errors
hugo --baseURL "$HUGO_BASE_URL" --destination "$HUGO_DESTINATION" $HUGO_PARAMS 2>&1 | \
 tee /tmp/hugo-build-log/latest.txt || \
 true

GIT_COMMIT=$(git rev-parse HEAD)

popd

# Copy the build logs to the hugo destination folder
mkdir -p $HUGO_DESTINATION/hugo-build-log
cp /tmp/hugo-build-log/latest.txt /tmp/hugo-build-log/$GIT_COMMIT.txt
cp -a /tmp/hugo-build-log/. $HUGO_DESTINATION/hugo-build-log/