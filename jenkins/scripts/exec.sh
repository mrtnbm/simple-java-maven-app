#!/usr/bin/env bash
snyk auth ${SNYK_TOKEN}
snyk test /root/.m2 --all-projects --detection-depth 100 --print-deps --show-vulnerable-paths=all --prune-repeated-subdependencies --json
##${HOME_WORKSPACE}/syft packages dir:. --file ./sbom.json -o syft-json -s AllLayers -v
#${HOME_WORKSPACE}/grype sbom:./sbom.json --add-cpes-if-none --file ./vuln.json -o json -s AllLayers -v
#--fail-on high