FROM --platform=${TARGETPLATFORM} alpine:latest
LABEL maintainer="charlieethan <admin@charlieethan.com>"

WORKDIR /root
ARG TARGETPLATFORM
COPY trojan-r.sh /root/trojan-r.sh
COPY config.toml /etc/trojan-r/config.toml
RUN set -ex \
	&& apk add --no-cache tzdata openssl ca-certificates \
	&& chmod +x /root/trojan-r.sh \
	&& /root/trojan-r.sh "${TARGETPLATFORM}" \
	&& rm -fv /root/trojan-r.sh

VOLUME /etc/trojan-r
CMD [ "/usr/bin/trojan-r", "--config", "/etc/trojan-r/config.toml" ]