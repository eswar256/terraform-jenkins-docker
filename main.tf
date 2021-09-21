provider "aws" {
    access_key = "AKIAYG2VVLDJJQ3BBNRV"
    secret_key = "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"
    region = "us-east-1"
}

data "aws_ami" "my_ami" {
     most_recent      = true
     #name_regex       = "^mavrick"
     owners           = ["564430985426"]
}


resource "aws_instance" "web-1" {
    ami = "${data.aws_ami.my_ami.id}"
    ami = "ami-02d8d0656d6a04870"
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    key_name = "EBS"
    subnet_id = "subnet-00316ba9ce9c861a6"
	private_ip = "10.1.2.200"
    vpc_security_group_ids = ["sg-0a29598817bb8bf06"]
    associate_public_ip_address = true	
    tags = {
        Name = "Server-1"
        Env = "Prod"
        Owner = "Sree"
    }
}
