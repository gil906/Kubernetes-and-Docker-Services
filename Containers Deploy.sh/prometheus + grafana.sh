
 docker run -d \
--name prometheus \
-p 9090:9090 \
    -v /mnt/media/prometheus/prometheus.yml:/opt/bitnami/prometheus/conf/prometheus.yml \
    -v /mnt/media/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
--restart=unless-stopped  \
   ajeetraina/prometheus-armv7



VERSION=v0.37.5 # use the latest release version from https://github.com/google/cadvisor/releases
sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  --privileged \
  --device=/dev/kmsg \
  gcr.io/cadvisor/cadvisor:$VERSION --disable_metrics=percpu --docker_only=true




