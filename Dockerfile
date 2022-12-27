FROM alpine:3.8
LABEL MAINTAINER=365384722@qq.com

WORKDIR /

RUN set -x && \
        apk add -U tzdata curl && \
        cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
        apk del tzdata && \
        curl -o version.latest https://api.github.com/repos/fatedier/frp/releases/latest && \
        FRP_VERSION=`cat version.latest | grep -E 'tag_name\": \"v[0-9]+\.[0-9]+\.[0-9]+' -o |head -n 1| tr -d 'tag_name\": \"v'` && \
        curl -OL https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz && \
        tar xzf frp_${FRP_VERSION}_linux_amd64.tar.gz && \
        cd frp_${FRP_VERSION}_linux_amd64 && \
        mkdir /frp && \
        mv frpc /frpc && \
        mv frpc.ini /frp/frpc.ini && \
        cd .. && \
        rm -rf *.tar.gz && \
        rm -rf frp_${FRP_VERSION}_linux_amd64

ENTRYPOINT ["/frpc","-c","/frp/frpc.ini"]
