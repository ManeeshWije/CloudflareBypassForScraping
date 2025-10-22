#!/bin/bash

# Start VNC server
mkdir -p ~/.vnc
echo "password" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd
vncserver :1 -geometry 1280x720 -depth 24 > /dev/null 2>&1 &

# Start window manager
DISPLAY=:1 openbox > /dev/null 2>&1 &

# Wait for VNC to start
sleep 2

# Start your application
cd /app
python3 server.py
