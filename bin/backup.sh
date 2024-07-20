#!/usr/bin/env bash
set -euox pipefail -o posix
export LC_ALL=C

cd "$(dirname "$0")"

. ../.env

TIMESTAMP=$(date '+%Y%m%dT%H%M%S')
echo TIMESTAMP="${TIMESTAMP}"

echo "stop the server"
cd "${DIR_REPO}"
docker compose stop

echo "back up the world"
zip "${DIR_BACKUP}"/mbs-core-"${TIMESTAMP}".zip \
  "${DIR_SERVER}"/allowlist.json \
  "${DIR_SERVER}"/permissions.json \
  "${DIR_SERVER}"/server.properties \
  "${DIR_SERVER}"/valid_known_packs.json \
  "${DIR_REPO}"/.env
zip -r "${DIR_BACKUP}"/mbs-"${WORLD_NAME}"-"${TIMESTAMP}".zip \
  "${DIR_SERVER}"/worlds/"${WORLD_NAME}"

echo "start the server"
cd "${DIR_REPO}"
docker compose up -d --wait

echo "remove old backups"
cd "${DIR_BACKUP}"
ls -t | tail -n +29 | xargs -r rm
