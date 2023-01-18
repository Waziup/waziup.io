#!/bin/bash
set -e
echo ">>> Starting build ..."

CONTENT_DIR=$(mktemp -d -t ci-XXXXXXXXXX)

echo "Working directory: ${CONTENT_DIR}"
mkdir -p ${CONTENT_DIR}

echo ">>> Cloning branch '$BRANCH' ..."
GIT_SSH_COMMAND="ssh -oStrictHostKeyChecking=no -i ${GIT_SSH_ID_FILE}" git clone ${GIT_REPO_URL} --branch $GIT_REPO_BRANCH --single-branch ${CONTENT_DIR}
mkdir -p ${TARGET_DIR}
cd ${CONTENT_DIR}/${GIT_REPO_CONTENT_PATH}

echo ">>> Hugo building '$HUGO_BASE_URL' ..."
/usr/local/dart-sass/sass src/css/index.scss static/dist/css/index.css
sed -i "s|^\(baseURL\s*=\s*\).*\$|\1\"$HUGO_BASE_URL\"|" config.toml
hugo ${HUGO_PARAMS}

cp -a public/. ${TARGET_DIR}

rm -rf ${CONTENT_DIR}