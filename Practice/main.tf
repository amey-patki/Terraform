provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "example" {
  ami           = var.ami_value
  instance_type = var.instance_type
  
}


# Outputs (optional, but useful)
output "ec2_instance_public_ip" {
  value = aws_instance.example.public_ip
}

