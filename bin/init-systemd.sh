#!/usr/bin/env bash
set -euox pipefail -o posix
export LC_ALL=C

cd "$(dirname "$0")"

source ../.env

# https://zenn.dev/hi_ka_ru/articles/d01bf1a91bade0
sudo ln -fs "${DIR_REPO}"/etc/mbs-backup.service        /etc/systemd/system/mbs-backup.service
sudo ln -fs "${DIR_REPO}"/etc/mbs-backup.timer          /etc/systemd/system/mbs-backup.timer
sudo ln -fs "${DIR_REPO}"/etc/mbs-backup-cloud.service  /etc/systemd/system/mbs-backup-cloud.service
sudo ln -fs "${DIR_REPO}"/etc/mbs-backup-cloud.timer    /etc/systemd/system/mbs-backup-cloud.timer
sudo ln -fs "${DIR_REPO}"/etc/mbs-update.service        /etc/systemd/system/mbs-update.service
sudo ln -fs "${DIR_REPO}"/etc/mbs-update.timer          /etc/systemd/system/mbs-update.timer

sudo chown root:root /etc/systemd/system/mbs-backup.service
sudo chown root:root /etc/systemd/system/mbs-backup.timer
sudo chown root:root /etc/systemd/system/mbs-backup-cloud.service
sudo chown root:root /etc/systemd/system/mbs-backup-cloud.timer
sudo chown root:root /etc/systemd/system/mbs-update.service
sudo chown root:root /etc/systemd/system/mbs-update.timer

sudo chmod 755 -R "${DIR_REPO}"/bin

sudo systemctl daemon-reload
sudo systemctl enable mbs-backup.service
sudo systemctl enable mbs-backup.timer
sudo systemctl start  mbs-backup.timer
sudo systemctl enable mbs-backup-cloud.timer
sudo systemctl start  mbs-backup-cloud.timer
sudo systemctl enable mbs-update.timer
sudo systemctl start  mbs-update.timer
