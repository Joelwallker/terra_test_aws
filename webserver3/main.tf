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

    user_data              =  templatefile("user_data.tpl", {
        f_name = "hercog"
        l_name = "white"
        names = ["Vasya", "Kolya", "John" , "Donald", "ZeroTwo"]
    })
    
} 



