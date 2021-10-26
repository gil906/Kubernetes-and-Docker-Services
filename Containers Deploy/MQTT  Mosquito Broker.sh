# To execute it directly on a Ubuntu as a bash script from github:
# wget -O - https://github.com/gil906/Docker-on-ARM-devices/raw/main/Containers%20Deploy/MQTT%20%20Mosquito%20Broker.sh | bash

docker run -it \
-p 1883:1883 \
-p 9001:9001 \
--init -d  \
--restart unless-stopped  \
-v /mnt/media/mosquitto:/mosquitto/config/mosquitto.conf \
-v /mnt/media/mosquitto:/mosquitto/data \
-v /mnt/media/mosquitto:/mosquitto/log \
eclipse-mosquitto