#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail
set -o posix
export LC_ALL=C.UTF-8

cd "$(dirname "$0")"

. ../.env

aws s3 sync "${DIR_BACKUP_WORLDS}" "${S3_BACKUP_WORLDS_URI}" --profile="${AWS_PROFILE}"
aws s3 sync "${DIR_BACKUP_WORLDS}" "${S3_BACKUP_CORE_URI}" --profile="${AWS_PROFILE}"
