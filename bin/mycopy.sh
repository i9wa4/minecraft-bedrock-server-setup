#!/usr/bin/env bash
set -euo pipefail
export LC_ALL=C

sudo chown -R root:root "${HOME}"/Minecraft/mbs-core/core/
sudo cp -f "${HOME}"/Minecraft/mbs-core/core/allowlist.json         /docker/mbs/allowlist.json
sudo cp -f "${HOME}"/Minecraft/mbs-core/core/permissions.json       /docker/mbs/permissions.json
sudo cp -f "${HOME}"/Minecraft/mbs-core/core/server.properties      /docker/mbs/server.properties
sudo cp -f "${HOME}"/Minecraft/mbs-core/core/valid_known_packs.json /docker/mbs/valid_known_packs.json
