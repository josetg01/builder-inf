#!/bin/bash

apk add docker docker-compose transmission-daemon samba

# Docker configuration
mkdir -p /docker/{config,data,cache,etc}
sudo rc-update add docker
sudo rc-service docker start
sleep 30
docker volume create portainer_data

# Torrent client
sudo rc-update add transmission-daemon
sudo rc-service transmission-daemon start && sudo rc-service transmission-daemon stop
sudo cat > /var/lib/transmission/config/settings.json <<EOL
{
    "alt-speed-down": 50,
    "alt-speed-enabled": false,
    "alt-speed-time-begin": 540,
    "alt-speed-time-day": 127,
    "alt-speed-time-enabled": false,
    "alt-speed-time-end": 1020,
    "alt-speed-up": 50,
    "bind-address-ipv4": "0.0.0.0",
    "bind-address-ipv6": "::",
    "blocklist-enabled": false,
    "blocklist-url": "http://www.example.com/blocklist",
    "cache-size-mb": 4,
    "dht-enabled": true,
    "download-dir": "/var/lib/transmission/downloads",
    "download-queue-enabled": true,
    "download-queue-size": 5,
    "encryption": 1,
    "idle-seeding-limit": 30,
    "idle-seeding-limit-enabled": false,
    "incomplete-dir": "/var/lib/transmission/Downloads",
    "incomplete-dir-enabled": false,
    "lpd-enabled": false,
    "message-level": 2,
    "peer-congestion-algorithm": "",
    "peer-id-ttl-hours": 6,
    "peer-limit-global": 200,
    "peer-limit-per-torrent": 50,
    "peer-port": 51413,
    "peer-port-random-high": 65535,
    "peer-port-random-low": 49152,
    "peer-port-random-on-start": false,
    "peer-socket-tos": "default",
    "pex-enabled": true,
    "pidfile": "/var/run/transmission/transmission.pid",
    "port-forwarding-enabled": true,
    "preallocation": 1,
    "prefetch-enabled": true,
    "queue-stalled-enabled": true,
    "queue-stalled-minutes": 30,
    "ratio-limit": 2,
    "ratio-limit-enabled": false,
    "rename-partial-files": true,
    "rpc-authentication-required": false,
    "rpc-bind-address": "0.0.0.0",
    "rpc-enabled": true,
    "rpc-host-whitelist": "",
    "rpc-host-whitelist-enabled": false,
    "rpc-password": "{591721a66ac178c4cce0ebf869025633f3224e9dApIxwntj",
    "rpc-port": 9091,
    "rpc-url": "/transmission/",
    "rpc-username": "",
    "rpc-whitelist": "127.0.0.1,::1",
    "rpc-whitelist-enabled": false,
    "scrape-paused-torrents-enabled": true,
    "script-torrent-done-enabled": false,
    "script-torrent-done-filename": "",
    "seed-queue-enabled": false,
    "seed-queue-size": 10,
    "speed-limit-down": 100,
    "speed-limit-down-enabled": false,
    "speed-limit-up": 100,
    "speed-limit-up-enabled": false,
    "start-added-torrents": true,
    "trash-original-torrent-files": false,
    "umask": 18,
    "upload-slots-per-torrent": 14,
    "utp-enabled": true
}
EOL