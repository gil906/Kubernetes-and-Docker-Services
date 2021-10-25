docker run -d \
--name="esphome"  \
-p 6052:6052  \
-p 6053:6053  \
-p 6123:6123  \
-e TZ=America/Bogota \
--restart unless-stopped \
-v  /mnt/media/esphome:/config esphome/esphome \
esphome/esphome
