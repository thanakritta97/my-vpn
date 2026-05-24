FROM teddysun/xray:latest

WORKDIR /root

# คัดลอกไฟล์
COPY start.sh /root/start.sh
COPY config.json /root/config.json

# ติดตั้งเครื่องมือพื้นฐาน + ให้สิทธิ์
RUN chmod +x /root/start.sh

# รันด้วย start.sh
ENTRYPOINT ["/root/start.sh"]
