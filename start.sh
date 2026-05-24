#!/bin/sh

PORT=${PORT:-8080}

echo "🚀 Starting Xray on port $PORT ..."

cat > /root/config.json << EOF
{
  "log": {"loglevel": "warning"},
  "inbounds": [{
    "tag": "vless-in",
    "port": $PORT,
    "listen": "0.0.0.0",
    "protocol": "vless",
    "settings": {
      "clients": [{"id": "${UUID}"}],
      "decryption": "none"
    },
    "streamSettings": {
      "network": "xhttp",
      "security": "none",
      "xhttpSettings": {
        "path": "${PATH}",
        "host": "${DOMAIN}"
      }
    }
  }],
  "outbounds": [{"tag": "direct", "protocol": "freedom"}]
}
EOF

echo "✅ Config created successfully"

exec xray run -c /root/config.json
