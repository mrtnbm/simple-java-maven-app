#!/usr/bin/env bash
snyk auth ${SNYK_TOKEN}
snyk test ${HOME_WORKSPACE}/ --all-projects --print-deps --show-vulnerable-paths=all --prune-repeated-subdependencies --json
syft packages dir:. --file ./sbom.json -o syft-json -s AllLayers -v
grype sbom:./sbom.json --add-cpes-if-none --file ./vuln.json -o json -s AllLayers -v
#--fail-on high