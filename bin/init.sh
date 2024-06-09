#!/usr/bin/env bash
set -euox pipefail -o posix
export LC_ALL=C

cd "$(dirname "$0")"

source ../.env

# https://qiita.com/siida36/items/be21d361cf80d664859c
sudo ufw default DENY
sudo ufw enable
sudo ufw allow "${PORT_SERVER}"
sudo ufw allow "${PORT_SSH}"
sudo ufw reload
