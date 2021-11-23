#!/bin/bash

# エラーがあったら中断
set -e

ENV_ROOT=$(git rev-parse --show-cdup)
if [ '' == "$ENV_ROOT" ]
then 
  ENV_ROOT='.'
fi
. "$ENV_ROOT/.project-env"

echo "run: satysfi --type-check-only "$@" on $(realpath $workingDir)"
docker run --rm -v "$(realpath $workingDir):/satysfi" "$dockerImage" satysfi --type-check-only "$@"
