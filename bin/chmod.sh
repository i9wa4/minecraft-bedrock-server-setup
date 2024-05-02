#!/usr/bin/env bash
set -euox pipefail -o posix
export LC_ALL=C

cd "$(dirname "$0")"

source ../.env

sudo chmod 755 -R "${DIR_REPO}"/bin
