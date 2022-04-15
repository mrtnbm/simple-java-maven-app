#!/usr/bin/env bash
#snyk test
syft packages dir:. --file ./sbom.json -o syft-json -s AllLayers -vv
grype sbom:./sbom.json --file ./vuln.json --fail-on high -o json -s AllLayers -vv