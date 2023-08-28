#This Terraform Code Deploys Basic VPC Infra.
provider "aws" { 
    #variable "aws_access_key" {}
    #variable "aws_secret_key" {}
    region = "${var.aws_region}"
}

terraform {
  required_providers {
    aws = {
      #version = "~> 3.0.0" #Forcing which version of plugin needs to be used.
      source = "hashicorp/aws"
    }
  }
}

#terraform {
#  required_providers {
#    aws = {
#     source  = "hashicorp/aws"
#     version = "~> 3.0.0"
#    }
#  }
#}

resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags = {
        Name = "${var.vpc_name}"
    }
}

resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
	tags = {
        Name = "${var.IGW_name}"
    }
}

resource "aws_subnet" "subnet1-public" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${var.public_subnet1_cidr}"
    availability_zone = "us-east-1a"

    tags = {
        Name = "${var.public_subnet1_name}"
    }
}

resource "aws_subnet" "subnet2-public" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${var.public_subnet2_cidr}"
    availability_zone = "us-east-1b"

    tags = {
        Name = "${var.public_subnet2_name}"
    }
}

resource "aws_subnet" "subnet3-public" {
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${var.public_subnet3_cidr}"
    availability_zone = "us-east-1c"

    tags = {
        Name = "${var.public_subnet3_name}"
    }
	
}


resource "aws_route_table" "terraform-public" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags = {
        Name = "${var.Main_Routing_Table}"
    }
}

resource "aws_route_table_association" "terraform-public" {
    subnet_id = "${aws_subnet.subnet1-public.id}"
    route_table_id = "${aws_route_table.terraform-public.id}"
}


resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${aws_vpc.default.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    }
}

terraform {
  backend "s3" {
    bucket = "terraformstatefilebucket01"
    key    = "Terraform/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "Jenkins-server" {
     ami = "ami-026ebd4cfe2c043b2"
     availability_zone = "us-east-1a"
     instance_type = "t2.micro"
     key_name = "Terraform_Key_Pair"
     subnet_id = "${aws_subnet.subnet1-public.id}"
     vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
     associate_public_ip_address = true	
     tags = {
         Name = "Server"
     }
provisioner "remote-exec"  {
    inline = [
      "sudo yum install java -y",
      "sudo yum install -y jenkins",
      "sudo yum -y install wget",
      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key",
      "sudo yum upgrade -y",
      "sudo yum install jenkins -y",
      "sudo systemctl start jenkins",
    ]
}
 connection {
    type         = "ssh"
    host         = self.public_ip
    user         = "ec2-user"
    private_key  = file("./Terraform_Key_Pair.pem" )
   }
 }