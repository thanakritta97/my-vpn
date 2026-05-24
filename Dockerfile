FROM teddysun/xray:latest

WORKDIR /root

COPY config.json /root/config.json
COPY start.sh /root/start.sh

RUN chmod +x /root/start.sh

ENTRYPOINT ["/root/start.sh"]
