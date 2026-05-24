#!/bin/sh

PORT=${PORT:-8080}
UUID=${UUID:-"57f364b9-bcaf-4a35-91e3-8aae82e4ce12"}
PATH_VAR=${PATH:-"/vless"}
DOMAIN=${DOMAIN:-"speedtest.net"}

echo "🚀 Starting Xray on port $PORT"

# สร้าง config
cat > /root/config.json << 'EOF'
{
  "log": { "loglevel": "warning" },
  "inbounds": [{
    "tag": "vless-in",
    "port": '"$PORT"',
    "listen": "0.0.0.0",
    "protocol": "vless",
    "settings": {
      "clients": [{ "id": "'"$UUID"'" }],
      "decryption": "none"
    },
    "streamSettings": {
      "network": "xhttp",
      "security": "none",
      "xhttpSettings": {
        "path": "'"$PATH_VAR"'",
        "host": "'"$DOMAIN"'"
      }
    }
  }],
  "outbounds": [{ "tag": "direct", "protocol": "freedom" }]
}
EOF

echo "✅ Config created"

exec xray run -c /root/config.json
