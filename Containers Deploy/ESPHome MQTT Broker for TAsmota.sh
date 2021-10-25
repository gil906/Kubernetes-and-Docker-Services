# To execute it directly on a Ubuntu as a bash script from github:
# wget -O - https://github.com/gil906/Docker-on-ARM-devices/raw/main/Containers%20Deploy/ESPHome%20MQTT%20Broker%20for%20TAsmota.sh | bash

docker run -d \
--name="esphome"  \
-p 6052:6052  \
-p 6053:6053  \
-p 6123:6123  \
-e TZ=America/Bogota \
--restart unless-stopped \
-v  /mnt/media/esphome:/config esphome/esphome \
esphome/esphome
