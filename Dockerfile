FROM alpine:3.8
MAINTAINER xzxiaoshan <365384722@qq.com>

WORKDIR /

RUN set -x && \
        wget --no-check-certificate https://github.com/fatedier/frp/tags -O tags.html && \
        FRP_VERSION=`cat tags.html | grep -E '/tag/v[0-9]+\.[0-9]+\.[0-9]+' -o |head -n 1| tr -d '/tag/v'` && \
        wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz && \
        tar xzf frp_${FRP_VERSION}_linux_amd64.tar.gz && \
        cd frp_${FRP_VERSION}_linux_amd64 && \
        mkdir /frp && \
        mv frpc /frpc && \
        mv frpc.ini /frp/frpc.ini && \
        cd .. && \
        rm -rf *.tar.gz && \
        rm -rf frp_${FRP_VERSION}_linux_amd64

VOLUME /frp

CMD /frpc -c /frp/frpc.ini
