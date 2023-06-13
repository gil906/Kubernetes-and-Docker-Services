# Smart Things hub for Samsung Devices (ARM64)

# 1 - Install Docker on your Raspberry Pi by running the following commands:
sudo apt-get update
sudo apt-get install -y docker.io
sudo systemctl enable --now docker

# 2 - Pull the SmartThings Hub Docker image suitable for arm64 architecture from Docker Hub:
sudo docker pull openhab/smartthings-hub

# 3 - Create a Docker container for the SmartThings Hub using the pulled image:
sudo docker run -d \
  --name=smartthings-hub \
  --restart=unless-stopped \
  --net=host \
  --device=/dev/ttyACM0 \
  -v /etc/localtime:/etc/localtime:ro \
  -e SMARTTHINGS_TOKEN=<your_smartthings_token> \
  -e TZ=<your_timezone> \
  openhab/smartthings-hub
  
# Replace <your_smartthings_token> with your actual SmartThings token and <your_timezone> with your desired timezone (e.g., "America/New_York").

# 4 - Verify that the SmartThings Hub container is running:
sudo docker ps

# You should see the openhab/smartthings-hub container listed.
# A compatible USB Z-Wave or Zigbee dongle plugged into your Raspberry Pi and adjust the --device flag (/dev/ttyACM0) accordingly if your device is assigned to a different path.



