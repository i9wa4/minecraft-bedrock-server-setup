#!/usr/bin/env bash
set -euo pipefail
export LC_ALL=C

mkdir -p "${HOME}"/GoogleDrive/
google-drive-ocamlfuse "${HOME}"/GoogleDrive/

rsync -av --delete "${HOME}"/Minecraft/mbs-backup/ "${HOME}"/GoogleDrive/backup/Minecraft/

fusermount -u "${HOME}"/GoogleDrive/
