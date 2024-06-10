#!/bin/bash

# Update system
sudo yum update -y

# Install dependencies
sudo yum install ca-certificates curl gnupg

# Install Docker Engine
sudo amazon-linux-extras install docker -y
# sudo service docker start

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Setup Minecraft directory
mkdir /home/ec2-user/minecraft_directory
cd /home/ec2-user/minecraft_directory

# Create docker-compose.yml file
cat <<EOF >docker-compose.yml
services:
  mc:
    image: itzg/minecraft-server:java17-alpine
    ports:
      - "25565:25565"
    environment:
      EULA: "TRUE"
    tty: true
    stdin_open: true
    restart: unless-stopped
    volumes:
      - "./minecraft-data:/data"
EOF

# Start the server
docker-compose up -d

# Create the systemd service file
sudo bash -c 'cat > /etc/systemd/system/minecraft.service <<EOF
[Unit]
Description=Minecraft Server
After=docker.service
Requires=docker.service

[Service]
WorkingDirectory=/home/ec2-user/minecraft_directory
ExecStart=/usr/bin/docker-compose up
ExecStop=/usr/bin/docker-compose down
Restart=always
User=ec2-user
Group=docker

[Install]
WantedBy=multi-user.target
EOF'

# Wait for 3 minutes, to give the docker container enough time to set up
sleep 180

# Enable and start the service
sudo systemctl enable minecraft
sudo systemctl start minecraft
