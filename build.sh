#!/bin/sh
set -e
dir=$( dirname "$0" )

[ -f ${GOPATH}/bin/go-bindata ] || {
    go get github.com/jteeuwen/go-bindata || true
    cd ${GOPATH}/src/github.com/jteeuwen/go-bindata
    git checkout v2.0.3
    go install
    cd -
}


go-bindata -nomemcopy -pkg main -out ${dir}/bindata.go ${dir}/templates/...
godep go build
