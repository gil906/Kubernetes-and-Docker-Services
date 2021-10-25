docker run  --restart unless-stopped  \
-d  \
--name emqx-mqtt  \
-p 18083:18083  \
-p 1883:1883  \
-v /vol-emqx-data:/mnt/media/emqx/data \
-v /vol-emqx-etc:/mnt/media/emqx/etc \
-v /vol-emqx-log:/mnt/media/emqx/log \
emqx/emqx:latest