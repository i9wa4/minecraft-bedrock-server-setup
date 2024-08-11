#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail
set -o posix
export LC_ALL=C.UTF-8

cd "$(dirname "$0")"

. ../.env

TIMESTAMP=$(date '+%Y%m%dT%H%M%S')
echo TIMESTAMP="${TIMESTAMP}"

echo "back up the core data"
zip "${DIR_BACKUP_CORE}"/mbs-core-"${TIMESTAMP}".zip \
  "${DIR_SERVER}"/allowlist.json \
  "${DIR_SERVER}"/permissions.json \
  "${DIR_SERVER}"/server.properties \
  "${DIR_SERVER}"/valid_known_packs.json \
  "${DIR_REPO}"/.env

# echo "back up the world"
# cd "${DIR_REPO}"
# docker compose stop
# zip -r "${DIR_BACKUP_WORLDS}"/mbs-worlds-"${TIMESTAMP}".zip \
#   "${DIR_SERVER}"/worlds
# docker compose up -d --wait

echo "remove old backups"
# cd "${DIR_BACKUP_WORLDS}"
# ls -t | tail -n +29 | xargs -r rm
cd "${DIR_BACKUP_CORE}"
ls -t | tail -n +29 | xargs -r rm
