#!/bin/bash

# エラーがあっても中断はしない
# set -e

ENV_ROOT=$(git rev-parse --show-cdup)
if [ '' == "$ENV_ROOT" ]
then 
  ENV_ROOT='.'
fi
. "$ENV_ROOT/.project-env"

workspaceFilePath=$(realpath $workspace)

for file in `find "$workspaceFilePath" \( -type d -name '.satysfi' -and -prune \) -or \( -type f \( -name "*.saty" -or -name "*.satyh" -or -name "*.satyg" \) -and -print \)`
do
  echo ''
  $projectRoot/cmd/check-type.sh "${file#$workspaceFilePath\/}"
done
