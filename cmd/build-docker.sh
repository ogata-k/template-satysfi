#!/bin/bash

# 引数はオプションで以下のみサポートしている
# --no-cache : Flag whether use cache when build image
# --progress : Set type of progress output (auto, plain, tty). Use plain to show container output(default "auto")
                                
# エラーがあったら中断
set -e

ENV_ROOT=$(git rev-parse --show-cdup)
if [ '' == "$ENV_ROOT" ]
then 
  ENV_ROOT='.'
fi
. "$ENV_ROOT/.project-env"  

if [[ ! -e "$projectRoot/.satysfi-packages" ]] ; then touch "$projectRoot/.satysfi-packages"; fi
docker build "$@" -f "$dockerRoot/$dockerFileName" --build-arg tag="$dockerTag" --build-arg packagesFile="./.satysfi-packages" -t "$dockerImage" "$projectRoot"

echo ''
$projectRoot/cmd/load-packages.sh
