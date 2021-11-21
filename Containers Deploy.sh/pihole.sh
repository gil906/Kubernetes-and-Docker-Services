docker run -d \
    --name pihole \
    -p 53:53/tcp -p 53:53/udp \
    -p 67:67/udp \
    -p 8090:80 \
    -p 443:443 \
    -v "${DOCKER_CONFIGS}/pihole/:/etc/pihole/" \
    -v "${DOCKER_CONFIGS}/dnsmasq.d/:/etc/dnsmasq.d/" \
    -e ServerIP="${IP}" \
    -e ServerIPv6="${IPv6}" \
    --restart=unless-stopped \
    --cap-add=NET_ADMIN \
    diginc/pi-hole:arm64
