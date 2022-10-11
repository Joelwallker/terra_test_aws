#------------------------------------------------
#Terraform
#
#Build by Wh1teHerc0g
#------------------------------------------------

provider "aws" {}

resource "aws_security_group" "wh_sequrity_group" {
  name        = "wh_sequrity_group"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-05bf0430bd775a64a"

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
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
    Name = "wh_sequrity_group"
  }
}



