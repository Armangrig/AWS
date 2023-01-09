data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/*22.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
    
    owners = ["099720109477"] # Canonical
}

provider "aws" {
  region  = "us-east-2"
}
resource "aws_instance" "app_server" {
  ami           = arn:aws:iam::546100599093:user/tf-user
  instance_type = "t3.micro"
  key_name      = "app-ssh-key"

  tags = {
    Name = var.ec2_name
  }
}
