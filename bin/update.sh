#!/usr/bin/env bash
set -euox pipefail -o posix
export LC_ALL=C

cd "$(dirname "$0")"

. ../.env

echo "update the server"
cd "${DIR_REPO}"
docker compose down
docker compose up -d --wait
