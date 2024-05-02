#!/usr/bin/env bash
set -euox pipefail -o posix
export LC_ALL=C

script_dir=$(cd "$(dirname "$0")"; pwd)
cd "${script_dir}"

source ../.env

mkdir -p "${HOME}"/GoogleDrive/
google-drive-ocamlfuse "${HOME}"/GoogleDrive/

rsync -av --delete "${HOME}"/Minecraft/mbs-backup/ "${HOME}"/GoogleDrive/backup/Minecraft/

fusermount -u "${HOME}"/GoogleDrive/
