#!/usr/bin/env bash
set -euox pipefail -o posix
export LC_ALL=C

cd "$(dirname "$0")"

source ../.env

mkdir -p "${DIR_GOOGLE_DRIVE}"
google-drive-ocamlfuse "${DIR_GOOGLE_DRIVE}"

rsync -av --delete "${DIR_BACKUP}" "${DIR_GOOGLE_DRIVE}"/backup/Minecraft/

fusermount -u "${DIR_GOOGLE_DRIVE}"
