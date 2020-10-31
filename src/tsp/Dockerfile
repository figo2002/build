FROM --platform=${TARGETPLATFORM} alpine:latest
LABEL maintainer="charlieethan <admin@charlieethan.com>"

WORKDIR /root
ARG TARGETPLATFORM
COPY tsp.sh /root/tsp.sh
COPY config.yaml /etc/tls-shunt-proxy/config.yaml
RUN set -ex \
	&& apk add --no-cache tzdata openssl ca-certificates \
	&& mkdir -p /var/www/html /var/log/tsp \
	&& chmod +x /root/tsp.sh \
	&& /root/tsp.sh "${TARGETPLATFORM}" \
	&& rm -fv /root/tsp.sh

VOLUME /etc/tls-shunt-proxy
CMD [ "/usr/bin/tsp", "-config", "/etc/tls-shunt-proxy/config.yaml" ]
