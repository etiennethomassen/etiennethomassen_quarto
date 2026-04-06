#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

./build.sh

# Load deployment config
# Expected vars: USER, HOST, DIR
source ./deploy.env

# Safety checks
: "${USER:?Missing USER in deploy.env}"
: "${HOST:?Missing HOST in deploy.env}"
: "${DIR:?Missing DIR in deploy.env}"

echo "==> Deploying _site/ to ${USER}@${HOST}:${DIR}"
rsync -avz --delete _site/ "${USER}@${HOST}:${DIR}"

echo "==> Deploy complete"
