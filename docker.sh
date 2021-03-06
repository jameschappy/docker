#!/bin/bash

docker create \
    --name sonarr \
    -p 8989:8989 \
    -e PUID=<UID> -e PGID=<GID> \
    -e TZ=<timezone> \ 
    -v /etc/localtime:/etc/localtime:ro \
    -v </path/to/appdata>:/config \
    -v <path/to/tvseries>:/tv \
    -v <path/to/downloadclient-downloads>:/downloads \
    linuxserver/sonarr

docker create --name=transmission \
-v <path to data>:/config \
-v <path to downloads>:/downloads \
-v <path to watch folder>:/watch \
-e PGID=<gid> -e PUID=<uid> \
-e TZ=<timezone> \
-p 9091:9091 -p 51413:51413 \
-p 51413:51413/udp \
linuxserver/transmission

docker create --name=sabnzbd \
-v <path to data>:/config \
-v <path to downloads>:/downloads \
-v <path to incomplete downloads>:/incomplete-downloads \
-e PGID=<gid> -e PUID=<uid> \
-e TZ=<timezone> \
-p 8080:8080 -p 9090:9090 \
linuxserver/sabnzbd