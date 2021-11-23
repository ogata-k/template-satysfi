#!/bin/bash

# エラーがあったら中断
set -e

ENV_ROOT=$(git rev-parse --show-cdup)
if [ '' == "$ENV_ROOT" ]
then 
  ENV_ROOT='.'
fi
. "$ENV_ROOT/.project-env"

echo "build pdf from $srcFileName to $pdfFileName on $(realpath $workspace)"
docker run --rm -v "$(realpath $workspace):/satysfi" "$dockerImage" satysfi -o "$pdfFileName" "$srcFileName"
