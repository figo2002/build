FROM --platform=${TARGETPLATFORM} alpine:latest
LABEL maintainer="charlieethan <admin@charlieethan.com>"

WORKDIR /root
ARG TARGETPLATFORM
COPY xray.sh /root/xray.sh
COPY config.json /etc/xray/config.json

RUN set -ex \
	&& apk add --no-cache tzdata openssl ca-certificates \
	&& mkdir -p /etc/xray /var/log/xray \
	&& chmod +x /root/xray.sh \
	&& /root/xray.sh "${TARGETPLATFORM}"

VOLUME /etc/xray
CMD [ "/usr/bin/xray", "run", "-config", "/etc/xray/config.json" ]