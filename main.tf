provider "aws" {
  region = "us-east-1" # Change to the appropriate region
}

resource "aws_instance" "example" {
  ami           = "ami-007855ac798b5175e" # Change to the appropriate AMI ID
  instance_type = "t2.micro" # Change to the appropriate instance type
  key_name      = "example-key" # Change to the name of your SSH key pair
  subnet_id     = subnet-0d5c6229a5e40bfee # Use the ID of the default subnet in the default VPC
  vpc_security_group_ids = [sg-0c35005eae240c704] # Use the ID of the default security group in the default VPC

  tags = {
    Name = "example-instance"
  }
}

data "aws_subnet" "default" {
  filter {
    name   = "isDefault"
    values = ["true"]
  }
}

data "aws_security_group" "default" {
  name_prefix = "default"
  vpc_id      = vpc-05bad44fe17b599d9
}

data "aws_vpc" "default" {
  default = true
}
