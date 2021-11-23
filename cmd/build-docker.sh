#!/bin/bash

# エラーがあったら中断
set -e

ENV_ROOT=$(git rev-parse --show-cdup)
if [ '' == "$ENV_ROOT" ]
then 
  ENV_ROOT='.'
fi
. "$ENV_ROOT/.project-env"

docker build --progress=plain -f "$dockerRoot/$dockerFileName" --build-arg tag="$dockerTag" --build-arg packagesFile="$satysfiPackagesFileFromProjectRoot" -t "$dockerImage" "$projectRoot"
