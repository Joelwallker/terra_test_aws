#------------------------------------------------
#Terraform
#
#Build by Wh1teHerc0g
#------------------------------------------------

provider "aws"{}

resource "aws_instance" "webserver_instance"{
    ami                    = "ami-05fa00d4c63e32376" #Amazon linux Ami
    instance_type          = "t2.micro"
    vpc_security_group_ids = ["sg-07f8c17fef9f941ab"]
    tags                   = {
        Name               = "webserver_instance"
    } 

    user_data = <<EOF
#!/bin/bash
sudo su
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
curl localhost:80
echo "Hello World from $(hostname -f)" > /var/www/html/index.html
hostname -f
cat /var/www/html/index.html
EOF
    
} 



