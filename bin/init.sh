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

# https://codechacha.com/ja/ubuntu-how-to-mount-google-drive/
sudo add-apt-repository -y ppa:alessandro-strada/ppa
sudo apt update
sudo apt install -y google-drive-ocamlfuse
