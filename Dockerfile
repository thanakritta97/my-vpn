FROM teddysun/xray:latest

WORKDIR /root

COPY start.sh /root/start.sh
COPY config.json /root/config.json

RUN chmod +x /root/start.sh && \
    apt-get update && apt-get install -y curl

ENTRYPOINT ["/root/start.sh"]
