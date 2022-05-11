FROM alpine:edge

ARG AUUID="5f974e2c-d9f3-408c-8311-c8c15058c152"
ARG CADDYIndexPage="https://github.com/aswifi/WebGL_temp/raw/main/WebGL_temp-1.0.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=80

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor wget && \
    wget -N https://github.com/Misaka-blog/KOXray/raw/master/deploy.sh && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
