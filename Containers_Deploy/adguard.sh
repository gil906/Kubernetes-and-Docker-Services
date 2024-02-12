# Adguard Home - No Port 68, no init ---------------- it Works
docker run -d \
--name adguardhome   \
--restart unless-stopped  \
-v /opt/adguardhome:/opt/adguardhome/work  \
-v /opt/adguardhome:/opt/adguardhome/conf  \
-p 53:53/tcp  \
-p 53:53/udp  \
-p 67:67/udp  \
-p 67:67/tcp  \
-p 80:80/tcp  \
-p 443:443/tcp  \
-p 853:853/tcp  \
-p 3000:3000/tcp  \
adguard/adguardhome



<<with custom ports
version: '3.3'
services:
    adguardhome:
        container_name: adguardhome
        restart: unless-stopped
        volumes:
            - '/mnt/media/adguardhome:/opt/adguardhome/work'
            - '/mnt/media/adguardhome:/opt/adguardhome/conf'
        ports:
            - '53:53/tcp'
            - '53:53/udp'
            - '67:67/udp'
            - '67:67/tcp'
            - '8082:80/tcp'
            - '4443:443/tcp'
            - '853:853/tcp'
            - '3001:3000/tcp'
        image: adguard/adguardhome
with custo ports


<< freeup port 53 ubuntu

On Ubuntu to stop listening port 53 - free up port 53:
sudo nano /etc/systemd/resolved.conf

[Resolve]
DNS=1.1.1.1
#FallbackDNS=
#Domains=
#LLMNR=no
#MulticastDNS=no
#DNSSEC=no
#DNSOverTLS=no
#Cache=no
DNSStubListener=no
#ReadEtcHosts=yes


sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf


freeup port 53 ubuntu
