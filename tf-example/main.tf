data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/*20.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
    
    owners = ["099720109477"] # Canonical
}

provider "aws" {
  region  = "us-east-1"
}
resource "aws_instance" "app_server" {
  ami           = "data.aws_ami-0b5eea76982371e91.ubuntu.id"
  instance_type = "t2.micro"
  key_name      = "app-ssh-key"

  tags = {
    Name = var.ec2_name
  }
}
