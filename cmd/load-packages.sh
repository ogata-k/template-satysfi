#!/bin/bash

# エラーがあったら中断
set -e

ENV_ROOT=$(git rev-parse --show-cdup)
if [ '' == "$ENV_ROOT" ]
then 
  ENV_ROOT='.'
fi
. "$ENV_ROOT/.project-env"  

echo "## cleaning local packages ..."
rm -rf "$workspace/.satysfi"
mkdir -p "$workspace/.satysfi"
echo "## complete cleaning local packages ..."

echo ''
echo "## load packages ..."
docker run --rm -v "$(realpath $workspace):/satysfi" "amutake/satysfi:$dockerTag" cp -rLf /root/.satysfi/dist ./.satysfi/dist/
docker run --rm -v "$(realpath $workspace):/satysfi" "$dockerImage" cp -rLf /root/.satysfi/dist ./.satysfi/local/
echo "## complete load packages"
