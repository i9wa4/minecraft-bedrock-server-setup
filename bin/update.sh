#!/usr/bin/env bash
set -euox pipefail -o posix
export LC_ALL=C

script_dir=$(cd "$(dirname "$0")"; pwd)
cd "${script_dir}"

source ../.env

echo "update the server"
cd "${HOME}"/Minecraft/mbs-core/
docker compose down
docker compose up -d --wait
