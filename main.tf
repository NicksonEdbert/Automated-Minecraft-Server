provider "aws" {
  region = "us-west-2"
}

resource "tls_private_key" "private_key" {
    algorithm = "RSA"
    rsa_bits = 4096
}

# Creating key-pair on AWS using SSH-public key
resource "aws_key_pair" "minecraft_key" {
  key_name   = "minecraft-key"
  public_key = tls_private_key.private_key.public_key_openssh
}

resource "aws_security_group" "minecraft_sg" {
  ingress {
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Minecraft-Server"
  }
}

resource "aws_instance" "minecraft_server" {
  ami                         = "ami-02e8e2a390064c712"
  instance_type               = "t3.small"
  vpc_security_group_ids      = [aws_security_group.minecraft_sg.id]
  key_name                    = aws_key_pair.minecraft_key.key_name
  associate_public_ip_address = true

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = tls_private_key.private_key.private_key_pem
    host = self.public_ip
  }

  provisioner "remote-exec" {
    script = "./scripts/setup.sh"
  }
}
