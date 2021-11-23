#!/bin/bash

. ./.project-env
docker build --progress=plain -f "$dockerFile" --build-arg tag="$dockerTag" --build-arg packagesFile="$packagesFile" -t "$author/$projectName:$dockerTag" .
