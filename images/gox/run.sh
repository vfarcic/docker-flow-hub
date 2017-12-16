#!/usr/bin/env bash

go get -d -v -t

gox --output="$1_{{.OS}}_{{.Arch}}"