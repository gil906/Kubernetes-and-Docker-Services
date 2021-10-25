docker run -d \
  --name=transmission \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Bogota \
  -e TRANSMISSION_WEB_HOME=/combustion-release/ `#optional` \
  -e USER=gil906 `#optional` \
  -e PASS=GvWtr7p#:.s36uGM \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v /mnt/media/transmission:/config \
  -v /mnt/media/movies:/downloads \
  -v /mnt/media/movies:/watch \
  --restart unless-stopped \
  ghcr.io/linuxserver/transmission
