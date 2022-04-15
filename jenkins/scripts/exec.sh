#!/usr/bin/env bash
snyk auth ${SNYK_TOKEN}
snyk test
${HOME_WORKSPACE}/syft packages dir:. --file ./sbom.json -o syft-json -s AllLayers -v
#${HOME_WORKSPACE}/grype sbom:./sbom.json --add-cpes-if-none --file ./vuln.json -o json -s AllLayers -v
#--fail-on high