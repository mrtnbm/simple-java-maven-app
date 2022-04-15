#!/usr/bin/env bash
#snyk test
${HOME_WORKSPACE}/syft packages dir:. --file ./sbom.json -o syft-json -s AllLayers -vv
${HOME_WORKSPACE}/grype sbom:./sbom.json --file ./vuln.json --fail-on high -o json -s AllLayers -vv