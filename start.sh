#!/bin/sh

PORT=${PORT:-8080}
UUID=${UUID:-"57f364b9-bcaf-4a35-91e3-8aae82e4ce12"}
PRIVATE_KEY=${PRIVATE_KEY:-"0dbf50c7-580b-49aa-b48d-9e16711a1241"}

echo "🚀 Starting Xray Reality on port $PORT ..."

cat > /root/config.json << EOF
{
  "log": { "loglevel": "warning" },
  "inbounds": [{
    "tag": "vless-reality",
    "port": $PORT,
    "listen": "0.0.0.0",
    "protocol": "vless",
    "settings": {
      "clients": [{ "id": "$UUID", "flow": "xtls-rprx-vision" }],
      "decryption": "none"
    },
    "streamSettings": {
      "network": "tcp",
      "security": "reality",
      "realitySettings": {
        "show": false,
        "dest": "www.speedtest.net:443",
        "xver": 0,
        "serverNames": ["speedtest.net", "www.speedtest.net"],
        "privateKey": "$PRIVATE_KEY",
        "shortIds": ["0123456789abcdef"]
      }
    }
  }],
  "outbounds": [{ "tag": "direct", "protocol": "freedom" }]
}
EOF

echo "✅ Reality Config Created"

exec xray run -c /root/config.json
