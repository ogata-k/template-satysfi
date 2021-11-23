ARG tag
FROM amutake/satysfi:${tag:-latest}

ARG packagesFile
RUN opam update
COPY ${packagesFile:-.satysfi-packages} .satysfi-packages
RUN echo '# start install satysfi packages';while IFS= read -r package; do echo "## installing $package ...";opam install "$package"; done < .satysfi-packages; echo '# finish install satysfi packages'
RUN opam exec -- satyrographos install
RUN opam list --installed 'satysfi-*'
