#!/usr/bin/env bash
set -euox pipefail -o posix
export LC_ALL=C

cd "$(dirname "$0")"

. ../.env

# https://qiita.com/siida36/items/be21d361cf80d664859c
sudo ufw default DENY
sudo ufw enable
sudo ufw allow "${PORT_SERVER}"
sudo ufw allow "${PORT_SSH}"
sudo ufw reload

mkdir -p "${DIR_SERVER}"
mkdir -p "${DIR_BACKUP}"

# https://zenn.dev/hi_ka_ru/articles/d01bf1a91bade0
# https://takuya-1st.hatenablog.jp/entry/2019/08/09/004829
mkdir -p "${HOME}"/.config/systemd/user/
ln -fs "${DIR_REPO}"/etc/mbs-backup.service        "${HOME}"/.config/systemd/user/mbs-backup.service
ln -fs "${DIR_REPO}"/etc/mbs-backup.timer          "${HOME}"/.config/systemd/user/mbs-backup.timer
ln -fs "${DIR_REPO}"/etc/mbs-backup-cloud.service  "${HOME}"/.config/systemd/user/mbs-backup-cloud.service
ln -fs "${DIR_REPO}"/etc/mbs-backup-cloud.timer    "${HOME}"/.config/systemd/user/mbs-backup-cloud.timer
ln -fs "${DIR_REPO}"/etc/mbs-update.service        "${HOME}"/.config/systemd/user/mbs-update.service
ln -fs "${DIR_REPO}"/etc/mbs-update.timer          "${HOME}"/.config/systemd/user/mbs-update.timer
systemctl --user daemon-reload
systemctl --user enable mbs-backup.timer
systemctl --user start  mbs-backup.timer
systemctl --user enable mbs-backup-cloud.timer
systemctl --user start  mbs-backup-cloud.timer
systemctl --user enable mbs-update.timer
systemctl --user start  mbs-update.timer
