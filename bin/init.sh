#!/usr/bin/env bash
set -euo pipefail
export LC_ALL=C

source ../.env

# https://qiita.com/siida36/items/be21d361cf80d664859c
sudo ufw default DENY
sudo ufw enable
sudo ufw allow "${PORT}"
sudo ufw allow "${PORT_SSH}"
sudo ufw reload

# https://codechacha.com/ja/ubuntu-how-to-mount-google-drive/
sudo add-apt-repository -y ppa:alessandro-strada/ppa
sudo apt update
sudo apt install -y google-drive-ocamlfuse

# https://zenn.dev/hi_ka_ru/articles/d01bf1a91bade0
sudo ln -fs "${HOME}"/Minecraft/mbs-core/etc/mbs-backup.service /etc/systemd/system/mbs-backup.service
sudo ln -fs "${HOME}"/Minecraft/mbs-core/etc/mbs-backup.timer /etc/systemd/system/mbs-backup.timer
sudo chown root:root /etc/systemd/system/mbs-backup.service
sudo chown root:root /etc/systemd/system/mbs-backup.timer
sudo chmod 755 "${HOME}"/Minecraft/mbs-core/bin/backup.sh
sudo systemctl daemon-reload
sudo systemctl enable mbs-backup.timer
sudo systemctl start mbs-backup.timer

sudo ln -fs "${HOME}"/Minecraft/mbs-core/etc/mbs-backup-cloud.service /etc/systemd/system/mbs-backup-cloud.service
sudo ln -fs "${HOME}"/Minecraft/mbs-core/etc/mbs-backup-cloud.timer /etc/systemd/system/mbs-backup-cloud.timer
sudo chown root:root /etc/systemd/system/mbs-backup-cloud.service
sudo chown root:root /etc/systemd/system/mbs-backup-cloud.timer
sudo chmod 755 "${HOME}"/Minecraft/mbs-core/bin/rsync-googledrive.sh
sudo systemctl daemon-reload
sudo systemctl enable mbs-backup-cloud.timer
sudo systemctl start mbs-backup-cloud.timer
