#!/usr/bin/env bash

go get -d -v -t

gox --output="$1_{{.OS}}_{{.Arch}}" -osarch="linux/386 linux/amd64 linux/arm windows/386 windows/amd64 darwin/386 darwin/amd64" -arch="386 amd64 arm"