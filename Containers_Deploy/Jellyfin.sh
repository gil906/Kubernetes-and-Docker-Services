#Deploys Jellyfin ona Docker container for ARM servers including Raspberry Pi, Azure ARMand AWS ARM servers
#!/bin/bash

# Update the system
sudo apt update && sudo apt upgrade -y

# Install Docker
sudo apt install docker.io -y

# Add your user to the docker group (to run docker commands without sudo)
sudo usermod -aG docker $USER

# Logout and log back in for the group changes to take effect
# You may need to open a new terminal window after logging back in

# Download the Jellyfin Docker image for ARM
docker pull jellyfin/jellyfin:latest

# Create a directory for Jellyfin configuration files
mkdir ~/jellyfin

# Set your desired username and password - this variable can be removed
JELLYFIN_USERNAME="your_username"
JELLYFIN_PASSWORD="your_password"

# Run the Jellyfin Docker container
docker run -d \
  --name jellyfin \
  --restart=unless-stopped \
  --network=host \
  -v ~/jellyfin:/config \
  -v /path/to/media:/data \
  -e "JELLYFIN_USERNAME=$JELLYFIN_USERNAME" \
  -e "JELLYFIN_PASSWORD=$JELLYFIN_PASSWORD" \
  jellyfin/jellyfin:latest

echo "Jellyfin server has been deployed successfully!"
