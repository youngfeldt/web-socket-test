#!/bin/sh

npm install ws

cat << EOS > server.js
console.log("Server started");
var Msg = '';
var WebSocketServer = require('ws').Server
    , wss = new WebSocketServer({port: 8010});
    wss.on('connection', function(ws) {
        ws.on('message', function(message) {
        console.log('Received from client: %s', message);
        ws.send('Server received from client: ' + message);
    });
 });
EOS

# Start websocket
node server.js &

#Start health-check
echo "STARTING HEALTH CHECK"
python3 health_check.py
