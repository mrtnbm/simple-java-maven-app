#!/usr/bin/env bash
#snyk test
${HOME_WORKSPACE}/syft packages dir:. --file ./sbom.json -o syft-json -s AllLayers -v
${HOME_WORKSPACE}/grype sbom:./sbom.json --add-cpes-if-none true --file ./vuln.json --fail-on high -o json -s AllLayers -v