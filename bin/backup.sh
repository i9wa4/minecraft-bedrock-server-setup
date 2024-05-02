#!/usr/bin/env bash
set -euox pipefail -o posix
export LC_ALL=C

script_dir=$(cd "$(dirname "$0")"; pwd)
cd "${script_dir}"

source ../.env

TIMESTAMP=$(date '+%Y%m%dT%H%M%S')
echo TIMESTAMP="${TIMESTAMP}"

echo "stop the server"
cd "${HOME}"/Minecraft/mbs-core/
docker compose stop
docker compose wait

echo "back up the world"
cp -f /docker/mbs/allowlist.json         "${HOME}"/Minecraft/mbs-core/core/allowlist.json
cp -f /docker/mbs/permissions.json       "${HOME}"/Minecraft/mbs-core/core/permissions.json
cp -f /docker/mbs/server.properties      "${HOME}"/Minecraft/mbs-core/core/server.properties
cp -f /docker/mbs/valid_known_packs.json "${HOME}"/Minecraft/mbs-core/core/valid_known_packs.json
zip -r "${HOME}"/Minecraft/mbs-backup/mbs-core-"${TIMESTAMP}".zip "${HOME}"/Minecraft/mbs-core/
zip -r "${HOME}"/Minecraft/mbs-backup/mbs-25nishi-"${TIMESTAMP}".zip /docker/mbs/worlds/"${WORLD_NAME}"

echo "start the server"
cd "${HOME}"/Minecraft/mbs-core/
docker compose up -d --wait

echo "remove old backups"
cd "${HOME}"/Minecraft/mbs-backup/
# ls -t | tail -n +7 | xargs -r rm
ls -t | tail -n +9 | xargs -r rm
