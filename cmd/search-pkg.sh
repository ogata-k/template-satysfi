#!/bin/bash

# エラーがあったら中断
set -e

ENV_ROOT=$(git rev-parse --show-cdup)
if [ '' == "$ENV_ROOT" ]
then 
  ENV_ROOT='.'
fi
. "$ENV_ROOT/.project-env"

echo "run: opam list "$@" on $(realpath $workspace)"
docker run --rm -v "$(realpath $workspace):/satysfi" "$dockerImage" opam list "$@"
