docker run -d \
      --name=speedtest \
      -p 8765:80 \
     -p 8766:443 \
      -v /mnt/media/speedtest:/config \
      -e OOKLA_EULA_GDPR=true \
      --restart unless-stopped \
      henrywhitaker3/speedtest-tracker:dev-arm

      
