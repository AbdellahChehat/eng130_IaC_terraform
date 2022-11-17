
# write a script to launch resources on the cloud


# create ec2 instance on AWS


# download dependencies from AWS

provider "aws" {
  region = var.region
}






# create VPC

resource "aws_vpc" "eng130_abdellah_terraform_vpc" {
  cidr_block = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "eng130_abdellah_vpc_terraform"
  }
}

# Create Subnet 

resource "aws_subnet" "eng130_abdellah_subnet_public" {
  vpc_id     = aws_vpc.eng130_abdellah_terraform_vpc.id
  cidr_block = var.subnet_cider_block
  map_public_ip_on_launch = true
  availability_zone = var.availability_zone

  tags = {
    Name = "eng130_abdellah_subnet_public"
  }
}

resource "aws_internet_gateway" "eng130_abdellah_igw" {
  vpc_id = aws_vpc.eng130_abdellah_terraform_vpc.id

  tags = {
    Name = "eng130_abdellah_igw"
  }
}

resource "aws_route_table" "eng130_abdellah_rt" {
  vpc_id = aws_vpc.eng130_abdellah_terraform_vpc.id

  route  {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.eng130_abdellah_igw.id

  }
  tags = {
    Name = "eng130_abdellah_rt"
  }
  
}

resource "aws_route_table_association" "eng130_aneese_rt_association"{

  subnet_id = aws_subnet.eng130_abdellah_subnet_public.id

  route_table_id = aws_route_table.eng130_abdellah_rt.id

}


# SG

resource "aws_security_group" "eng130-abdellah-terraform-sg" {

    name = "eng130-abdellah-terraform-sg"

    description = "eng130-abdellah-terraform-sg"

    vpc_id = aws_vpc.eng130_abdellah_terraform_vpc.id

    ingress {

        description = "SSH"

        from_port = 22

        to_port = 22

        protocol = "tcp"

        cidr_blocks = ["0.0.0.0/0"]

    }

    ingress {

        description = "HTTP"

        from_port = 80

        to_port = 80

        protocol = "tcp"

        cidr_blocks = ["0.0.0.0/0"]

    }
    
    ingress {

        description = "HTTP"

        from_port = 3000

        to_port = 3000

        protocol = "tcp"

        cidr_blocks = ["0.0.0.0/0"]

    }



    egress {

        from_port = 0

        to_port = 0

        protocol = "-1"

        cidr_blocks = ["0.0.0.0/0"]

    }

    tags = {

        Name = "allow tls"

    }

}




# --------  launch an instance
resource "aws_instance" "app_instance" {
  ami = var.webapp_ami_id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.eng130_abdellah_subnet_public.id
  vpc_security_group_ids = [aws_security_group.eng130-abdellah-terraform-sg.id]
  associate_public_ip_address = true
  key_name = "eng130"

  tags = {
    Name = "eng130-abdellah-terraform-app"
  }
}