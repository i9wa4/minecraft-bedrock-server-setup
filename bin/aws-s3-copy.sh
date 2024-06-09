#!/usr/bin/env bash
set -euox pipefail -o posix
export LC_ALL=C

cd "$(dirname "$0")"

source ../.env

aws s3 sync "${DIR_BACKUP}" "${S3_BUCKUP_URI}"
