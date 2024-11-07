#!/bin/bash
set -ex

# Modify hooks.json to use the correct branch and secret
sed "s|refs/heads/master|refs/heads/$GIT_BRANCH|;s|secret-set-by-docker-entrypoint|$WEBHOOK_SECRET|" hooks.json

source start.sh

echo ">>> Starting webhook ..."

# Run the webhook server
webhook -hooks hooks.json -verbose