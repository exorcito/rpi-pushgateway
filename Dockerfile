FROM resin/rpi-raspbian

MAINTAINER Alberto Lorenzo

ENV PUSH_GATEWAY_VERSION 0.4.0

ADD https://github.com/prometheus/pushgateway/releases/download/v${PUSH_GATEWAY_VERSION}/pushgateway-${PUSH_GATEWAY_VERSION}.linux-armv7.tar.gz /tmp/pushgateway.tar.gz

RUN tar -xf /tmp/pushgateway.tar.gz && 
rm /tmp/pushgateway.tar.gz && 
mv pushgateway-${PUSH_GATEWAY_VERSION}.linux-armv7/pushgateway /usr/bin/pushgateway && 
rm -rf pushgateway-${PUSH_GATEWAY_VERSION}.linux-armv7

EXPOSE 9091

ENTRYPOINT [ "/usr/bin/pushgateway" ]
