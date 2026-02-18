provider "aws" {
  region = "us-east-1"
}

# ✅ Generate SSH Key in Terraform (no local file needed)
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# ✅ Upload public key to AWS
resource "aws_key_pair" "deployer" {
  key_name   = "rashmik-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

# ✅ Security Group for SSH + HTTP
resource "aws_security_group" "allow_http_ssh" {
  name        = "allow_http_ssh"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ✅ Launch EC2
resource "aws_instance" "web_app" {
  ami             = "ami-053b0d53c279acc90"
  instance_type   = "t3.micro"
  key_name        = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.allow_http_ssh.name]

  user_data = file("${path.module}/app.sh")

  tags = {
    Name = "Rashmik-Terraform-App"
  }
}

# ✅ Output Private Key (for testing only)
output "private_key" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}
