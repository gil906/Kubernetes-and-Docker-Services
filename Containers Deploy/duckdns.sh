docker run -d  --name=duckdns \
-e PUID=99 `#optional` \
-e PGID=100 `#optional` \
-e TZ=America/Bogota \
-e SUBDOMAINS=gil906 \
-e VALIDATION=http \
-e TOKEN=`#CHANGE THIS WITH YOUR DUCKDNS TOKEN` \
-e LOG_FILE=false `#optional` \
-v /media/duckdns/config:/config \
--restart unless-stopped \
ghcr.io/linuxserver/duckdns