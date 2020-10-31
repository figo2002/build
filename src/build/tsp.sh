#!/bin/bash

# Set variables
CUR=$PWD
VERSION=$(wget -qO- https://api.github.com/repos/liberal-boy/tls-shunt-proxy/tags | grep 'name' | cut -d\" -f4 | head -1)

# Get source code
mkdir -p release
git clone -b ${VERSION} https://github.com/liberal-boy/tls-shunt-proxy.git && cd tls-shunt-proxy

# Start Build
ARCHS=( 386 amd64 arm arm64 ppc64le s390x )
ARMS=( 6 7 )

for ARCH in ${ARCHS[@]}; do
	if [ "${ARCH}" == "arm" ]; then
		for ARM in ${ARMS[@]}; do
			echo "Building tsp-linux-${ARCH}32-v${ARM}"
			env CGO_ENABLED=0 GOOS=linux GOARCH=${ARCH} GOARM=${ARM} go build -o ${CUR}/release/tsp-linux-${ARCH}32-v${ARM} -trimpath -ldflags "-s -w"
			openssl dgst --sha256 ${CUR}/release/tsp-linux-${ARCH}32-v${ARM} | sed 's/([^)]*)//g' >> ${CUR}/release/tsp-linux-${ARCH}32-v${ARM}.hash
			openssl dgst --sha512 ${CUR}/release/tsp-linux-${ARCH}32-v${ARM} | sed 's/([^)]*)//g' >> ${CUR}/release/tsp-linux-${ARCH}32-v${ARM}.hash
		done
	else
		echo "Building tsp-linux-${ARCH}"
		env CGO_ENABLED=0 GOOS=linux GOARCH=${ARCH} go build -o ${CUR}/release/tsp-linux-${ARCH} -trimpath -ldflags "-s -w"
		openssl dgst --sha256 ${CUR}/release/tsp-linux-${ARCH} | sed 's/([^)]*)//g' >> ${CUR}/release/tsp-linux-${ARCH}.hash
		openssl dgst --sha512 ${CUR}/release/tsp-linux-${ARCH} | sed 's/([^)]*)//g' >> ${CUR}/release/tsp-linux-${ARCH}.hash
	fi
done