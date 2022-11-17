
# write a script to launch resources on the cloud


# create ec2 instance on AWS


# download dependencies from AWS

provider "aws" {
# which part of AWS we would like to launch resouces in 
  region = "eu-west-1"
}

# launch an instance

resource "aws_instance" "app_instance" {
  ami = "ami-0b47105e3d7fc023e"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  tags = {
    Name = "eng130-abdellah-terraform-app"
  }

}




# what type of server with what sort of function


# add resource


# ami


# instance type


# do we need public ip or not


# name the serve


