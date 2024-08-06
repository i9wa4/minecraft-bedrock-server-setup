#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail
set -o posix
export LC_ALL=C.UTF-8

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
ln -fs "${DIR_REPO}"/etc/mbs-backup-to-local.service  "${HOME}"/.config/systemd/user/mbs-backup-to-local.service
ln -fs "${DIR_REPO}"/etc/mbs-backup-to-local.timer    "${HOME}"/.config/systemd/user/mbs-backup-to-local.timer
ln -fs "${DIR_REPO}"/etc/mbs-backup-to-cloud.service  "${HOME}"/.config/systemd/user/mbs-backup-to-cloud.service
ln -fs "${DIR_REPO}"/etc/mbs-backup-to-cloud.timer    "${HOME}"/.config/systemd/user/mbs-backup-to-cloud.timer
ln -fs "${DIR_REPO}"/etc/mbs-update.service           "${HOME}"/.config/systemd/user/mbs-update.service
ln -fs "${DIR_REPO}"/etc/mbs-update.timer             "${HOME}"/.config/systemd/user/mbs-update.timer
systemctl --user daemon-reload
systemctl --user enable mbs-backup-to-local.timer
systemctl --user start  mbs-backup-to-local.timer
systemctl --user enable mbs-backup-to-cloud.timer
systemctl --user start  mbs-backup-to-cloud.timer
systemctl --user enable mbs-update.timer
systemctl --user start  mbs-update.timer

# https://qiita.com/k0kubun/items/3c94473506e0e370a227
sudo loginctl enable-linger "${MY_USER_NAME}"
