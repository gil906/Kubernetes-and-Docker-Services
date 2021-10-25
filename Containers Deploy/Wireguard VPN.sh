# This will create a container with Wireguard as VPN Server
# Configuration files is been saved in /mnt/media/
# If /mnt/media is not created, please adjust it to the desired destination.
# Wireguard app can be downloaded ether on the Apple APPstore or Google Play  Store
docker run -d \
  --name=wireguard \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Americas/Bogota \
  -e SERVERURL=gil906.duckdns.org `#optional` \
  -e SERVERPORT=51820 `#optional` \
  -e PEERS=3 `#optional` \
  -e PEERDNS=auto `#optional` \
  -e INTERNAL_SUBNET=10.13.13.0 `#optional` \
   -p 51820:51820/udp \
  -v /mnt/media/wireguard/config:/config \
  -v /lib/modules:/lib/modules \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --restart unless-stopped \
  linuxserver/wireguard


