provider "aws" {
  region = "us-east-1"
}
/*
data "aws_ami" "ubuntu" {
  most_recent = true

  #filter {
  #  name   = "name"
  #  values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  #}

  owners = ["099720109477"] # Canonical
}
*/
resource "aws_instance" "web_server" {
  ami                         = "ami-0150ccaf51ab55a51"
  instance_type               = "t3.micro"
  key_name                    = "te1"
  subnet_id                   = "subnet-0ced83399a239da3a"
  vpc_security_group_ids      = ["sg-0d0b0cbd742f704ad"]
  associate_public_ip_address = true
  tags = {
    Name = "web-servers"
  }
}