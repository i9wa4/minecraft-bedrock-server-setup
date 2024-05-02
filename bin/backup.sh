#!/usr/bin/env bash
set -euox pipefail -o posix
export LC_ALL=C

cd "$(dirname "$0")"

source ../.env

TIMESTAMP=$(date '+%Y%m%dT%H%M%S')
echo TIMESTAMP="${TIMESTAMP}"

echo "stop the server"
cd "${DIR_REPO}"
docker compose stop

echo "back up the world"
zip -r "${DIR_BACKUP}"/mbs-core-"${TIMESTAMP}".zip \
  /docker/mbs/allowlist.json \
  /docker/mbs/permissions.json \
  /docker/mbs/server.properties \
  /docker/mbs/valid_known_packs.json \
  "${DIR_REPO}"/.env
zip -r "${DIR_BACKUP}"/mbs-"${WORLD_NAME}"-"${TIMESTAMP}".zip /docker/mbs/worlds/"${WORLD_NAME}"

echo "start the server"
cd "${DIR_REPO}"
docker compose up -d --wait

echo "remove old backups"
cd "${DIR_BACKUP}"
ls -t | tail -n +9 | xargs -r rm
