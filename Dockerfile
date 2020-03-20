FROM alpine:v3.11
RUN apk update
RUN apk upgrade
RUN apk add --no-cache --virtual .build-deps ca-certificates curl iptables libc-dev bash bash-doc bash-completion libuv libsodium json-c

ADD /v2/v2ray /v2/v2ray
RUN chmod +x /v2/v2ray

ADD /v2/v2ctl /v2/v2ctl
RUN chmod +x /v2/v2ctl

ADD configure.sh /configure.sh
RUN chmod +x /configure.sh

CMD /configure.sh
