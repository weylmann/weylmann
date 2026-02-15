#!/bin/bash
set -e

echo "馃殌 Setting up OpenClaw Environment..."

# Install OpenClaw globally if not already installed
if ! command -v openclaw &> /dev/null; then
    echo "馃摝 Installing OpenClaw..."
    npm install -g openclaw
fi

# Show OpenClaw version
echo "鉁?OpenClaw version:"
openclaw --version

# Start OpenClaw Gateway in background
echo "馃攲 Starting OpenClaw Gateway..."
nohup openclaw gateway start > /tmp/openclaw-gateway.log 2>&1 &

# Wait a moment and check if it's running
sleep 2
if pgrep -f "openclaw" > /dev/null; then
    echo "鉁?OpenClaw Gateway started successfully!"
    echo "馃搵 Logs: tail -f /tmp/openclaw-gateway.log"
else
    echo "鈿狅笍  Failed to start OpenClaw Gateway. Check logs at /tmp/openclaw-gateway.log"
fi

echo ""
echo "馃帀 Setup complete! You can now use OpenClaw."
echo "   - Run 'openclaw status' to check status"
echo "   - Run 'openclaw gateway status' to check gateway"
