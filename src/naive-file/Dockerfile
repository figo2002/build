FROM --platform=${TARGETPLATFORM} alpine:latest
LABEL maintainer="charlieethan <admin@charlieethan.com>"

WORKDIR /root
ARG TARGETPLATFORM
COPY naive.sh /root/naive.sh
COPY Caddyfile /etc/naiveproxy/Caddyfile
RUN set -ex \
	&& apk add --no-cache tzdata openssl ca-certificates \
	&& mkdir -p /var/www/html /var/log/naiveproxy \
	&& chmod +x /root/naive.sh \
	&& /root/naive.sh "${TARGETPLATFORM}" \
	&& rm -fv /root/naive.sh

VOLUME /etc/naiveproxy
CMD [ "/usr/bin/caddy", "run", "--config", "/etc/naiveproxy/Caddyfile" ]