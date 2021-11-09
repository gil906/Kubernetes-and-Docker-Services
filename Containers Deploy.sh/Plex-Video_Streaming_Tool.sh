Plex - Working
docker run -d \
--name=plex \
-p 32400:32400 \
-p 1900:1900/udp \
-p 3005:3005 \
-p 5353:5353/udp \
-p 8324:8324 \
-p 32410:32410/udp \
-p 32412:32412/udp \
-p 32413:32413/udp \
-p 32414:32414/udp \
-p 32469:32469 \
-e PUID=1000 \
-e PGID=1000 \
-e VERSION=docker \
-e PLEX_CLAIM=`#optional`\
-e UMASK_SET=022 `#optional` \
-v /mnt/media/plex:/config  \
-v /mnt/media/tv:/tv \
-v /mnt/media/2movies:/movies \
-v /mnt/media/study:/study \
--restart unless-stopped \
ghcr.io/linuxserver/plex:arm64v8-latest


<< Docker-compose
# --------------With Docker Compose -----------------------

    plex:
        container_name: plex
        ports:
            - '32400:32400'
            - '1900:1900/udp'
            - '3005:3005'
            - '5353:5353/udp'
            - '8324:8324'
            - '32410:32410/udp'
            - '32412:32412/udp'
            - '32413:32413/udp'
            - '32414:32414/udp'
            - '32469:32469'
        environment:
            - PUID=1000
            - PGID=1000
            - VERSION=docker
            - UMASK_SET=022
            - PLEX_CLAIM=claim-tSHtH2yzfmPNLtusTpBs
        volumes:
            - '/mnt/media:/config'
            - '/mnt/media/tv:/tv'
            - '/mnt/media/movies:/movies'
            - '/mnt/media/study:/study'
        restart: unless-stopped
        image: 'ghcr.io/linuxserver/plex:arm64v8-latest'




    plex:
        container_name: plex
        ports:
            - '32400:32400'
            - '1900:1900/udp'
            - '3005:3005'
            - '5353:5353/udp'
            - '8324:8324'
            - '32410:32410/udp'
            - '32412:32412/udp'
            - '32413:32413/udp'
            - '32414:32414/udp'
            - '32469:32469'
        environment:
            - PUID=1000
            - PGID=1000
            - VERSION=docker
            - UMASK_SET=022
            - PLEX_CLAIM=claim-tSHtH2yzfmPNLtusTpBs
        volumes:
            - '/mnt/media:/config'
            - '/mnt/media/tv:/tv'
            - '/mnt/media/movies:/movies'
            - '/mnt/media/study:/study'
        restart: unless-stopped
        image: 'ghcr.io/linuxserver/plex:arm64v8-latest'
Docker-compose


