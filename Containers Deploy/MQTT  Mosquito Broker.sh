docker run -it \
-p 1883:1883 \
-p 9001:9001 \
--init -d  \
--restart unless-stopped  \
-v /mnt/media/mosquitto:/mosquitto/config/mosquitto.conf \
-v /mnt/media/mosquitto:/mosquitto/data \
-v /mnt/media/mosquitto:/mosquitto/log \
eclipse-mosquitto