#!/usr/bin/env bash

go get -d -v -t

gox --output="$1_{{.OS}}_{{.Arch}}" -os="linux windows darwin" -arch="386 amd64 arm"