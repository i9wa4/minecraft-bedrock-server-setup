#!/usr/bin/env bash
set -euox pipefail -o posix
export LC_ALL=C

cd "$(dirname "$0")"

. ../.env
. "${HOME}"/.zshenv

aws s3 sync "${DIR_BACKUP}" "${S3_BACKUP_URI}"
