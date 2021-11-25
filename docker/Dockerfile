ARG tag
FROM amutake/satysfi:${tag:-latest}

ARG packagesFile
SHELL ["/bin/bash", "-ec"]
RUN opam update
COPY "${packagesFile:-./.satysfi-packages}" ./.satysfi-packages
RUN function install_package(){ if [[ -n $1 ]] ; then echo "## installing satysfi-$1 ..."; opam install "satysfi-$1"; echo "## finish install satysfi-$1"; fi; }; echo '# start install satysfi packages'; while IFS= read -r package; do install_package "$(echo "$package" | sed -e s/^[[:space:]]*// | sed -e s/#.*\$// | sed -e s/[[:space:]]*\$//)"; done < .satysfi-packages; echo '# finish install satysfi packages'
RUN opam exec -- satyrographos install
RUN opam list --installed 'satysfi-*'
