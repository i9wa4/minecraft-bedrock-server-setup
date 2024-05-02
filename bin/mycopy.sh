#!/usr/bin/env bash
set -euox pipefail -o posix
export LC_ALL=C

script_dir=$(cd "$(dirname "$0")"; pwd)
cd "${script_dir}"

source ../.env

sudo chown -R root:root "${HOME}"/Minecraft/mbs-core/core/
sudo cp -f "${HOME}"/Minecraft/mbs-core/core/allowlist.json         /docker/mbs/allowlist.json
sudo cp -f "${HOME}"/Minecraft/mbs-core/core/permissions.json       /docker/mbs/permissions.json
sudo cp -f "${HOME}"/Minecraft/mbs-core/core/server.properties      /docker/mbs/server.properties
sudo cp -f "${HOME}"/Minecraft/mbs-core/core/valid_known_packs.json /docker/mbs/valid_known_packs.json
