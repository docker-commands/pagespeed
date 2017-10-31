#!/bin/sh
URL=$1

# tcpdump dst port 80 or port 443 & 
#tcpdump -ttt -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*|POST \/.*" 2>/dev/null &
tshark -w packet

PID=$!
chromium-browser --headless --no-sandbox --disable-gpu "${URL}" 2>/dev/null

kill -9 $PID
tshark -r packet -z http_req,tree

