 docker run  \
--restart unless-stopped  \
--init -d  \
--name="home-assistant"  \
-e "TZ=America/Los_Angeles"  \
-v /mnt/media/homeasistant:/config  \
-p 8123:8123  \
homeassistant/home-assistant:latest
