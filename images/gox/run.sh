#!/usr/bin/env bash

go get -d -v -t

gox --output="$1_{{.OS}}_{{.Arch}}" -osarch="linux/amd64 linux/arm windows/amd64 darwin/amd64"