FROM alpine:3.2
RUN apk --update add curl ca-certificates bash && \
    curl -Ls https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk > /tmp/glibc-2.21-r2.apk && \
    apk add --allow-untrusted /tmp/glibc-2.21-r2.apk && \
    rm -rf /tmp/glibc-2.21-r2.apk /var/cache/apk/*
ADD https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip /tmp/consul.zip
RUN cd /bin && unzip /tmp/consul.zip && chmod +x /bin/consul && rm /tmp/consul.zip

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp
ADD https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_web_ui.zip /ui/webui.zip
RUN cd /ui && unzip webui.zip && rm webui.zip
ADD ./config /config/
ADD entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD [ "server"]
