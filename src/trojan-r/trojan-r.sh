#!/bin/sh

# Set ARG
PLATFORM=$1
if [ -z "$PLATFORM" ]; then
    ARCH="amd64"
else
    case "$PLATFORM" in
        linux/386)
            ARCH="386"
            ;;
        linux/amd64)
            ARCH="amd64"
            ;;
        linux/arm/v6)
            ARCH="arm32-v6"
            ;;
        linux/arm/v7)
            ARCH="arm32-v7"
            ;;
        linux/arm64|linux/arm64/v8)
            ARCH="arm64"
            ;;
        *)
            ARCH=""
            ;;
    esac
fi
[ -z "${ARCH}" ] && echo "Error: Not supported OS Architecture" && exit 1

# Download files
TROJAN_R_FILE="trojan-r-linux-${ARCH}"
HASH_FILE="trojan-r-linux-${ARCH}.hash"

echo "Downloading binary file: ${TROJAN_R_FILE}"
wget -O /usr/bin/trojan-r https://github.com/charlieethan/build/releases/latest/download/${TROJAN_R_FILE} > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Error: Failed to download binary file: ${TROJAN_R_FILE}" && exit 1
fi
echo "Download binary file: ${TROJAN_R_FILE} completed"

# Check SHA512
LOCAL=$(openssl dgst -sha512 /usr/bin/trojan-r | sed 's/([^)]*)//g')
STR=$(wget -qO- https://github.com/charlieethan/build/releases/latest/download/${HASH_FILE} | grep 'SHA512')

if [ "${LOCAL}" = "${STR}" ]; then
    echo " Check passed"
else
    echo " Check have not passed yet " && exit 1
fi

chmod +x /usr/bin/trojan-r
