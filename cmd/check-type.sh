#!/bin/bash
# $1 : 型チェック対象のファイル

# エラーがあっても中断はしない
# set -e

ENV_ROOT=$(git rev-parse --show-cdup)
if [ '' == "$ENV_ROOT" ]
then 
  ENV_ROOT='.'
fi
. "$ENV_ROOT/.project-env"

echo "run: satysfi --type-check-only "$1
docker run --rm -v "$(realpath $workspace):/satysfi" "$dockerImage" satysfi --type-check-only "$1"
