FROM --platform=${TARGETPLATFORM} ubuntu:latest
LABEL maintainer "charlieethan <admin@charlieethan.com>"

WORKDIR /root
ARG TARGETPLATFORM
COPY naive.sh /root/naive.sh

RUN (apt update && apt install -y wget xz-utils libnss3 binutils && rm -rf /var/lib/apt/lists/*) \
 && (yes | apt upgrade) \
 && mkdir -p /etc/naiveproxy /var/log/naive \
 && chmod +x /root/naive.sh \
 && /root/naive.sh "${TARGETPLATFORM}"

VOLUME /etc/naiveproxy
CMD [ "/usr/bin/naive", "/etc/naiveproxy/config.json" ]