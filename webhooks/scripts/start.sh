#!/bin/bash
set -e

echo ">>> Start Nginx service ..."
service nginx start

echo ">>> Setup ..."
# chmod 600 ${GIT_SSH_ID_FILE}
sed -i "s|refs/heads/master|refs/heads/$GIT_REPO_BRANCH|" /etc/hooks.json
sed -i "s|set-by-start_sh|$WEBHOOK_SECRET|" /etc/hooks.json

echo ">>> Building master ..."
bash /scripts/refresh.sh

echo ">>> Starting webhook ..."
sudo /usr/bin/webhook -hooks /etc/hooks.json -verbose
