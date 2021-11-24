#!/bin/bash

# エラーがあったら中断は しない
#set -e

ENV_ROOT=$(git rev-parse --show-cdup)
if [ '' == "$ENV_ROOT" ]
then 
  ENV_ROOT='.'
fi
. "$ENV_ROOT/.project-env"

workspaceFilePath=$(realpath $workspace)

function doCheck() {
  # $1 : 型チェック対象のファイル
  
  if [[ -e $1 ]]
  then
    if [[ -d $1 ]]
    then
      dirFiles="$1/*"
      for dirFile in $dirFiles
      do
        if [[ -e $dirFile ]]
        then
          doCheck "$dirFile"
        fi
      done
    elif [[ -f $1 ]]
    then
      if [[ $1 =~ \.saty[hg] ]]
      then
        echo ''
        echo "run: satysfi --type-check-only "$workspace${1#$workspaceFilePath}" on $workspaceFilePath"
        docker run --rm -v "$workspaceFilePath:/satysfi" "$dockerImage" satysfi --type-check-only "${1#$workspaceFilePath/}"
      fi
    fi
  fi
}

files="$workspaceFilePath/*"
for file in $files
do
  doCheck "$file"
done
