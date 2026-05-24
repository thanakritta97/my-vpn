FROM teddysun/xray:latest

WORKDIR /root

COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh

ENTRYPOINT ["/root/start.sh"]
