variable "aws_key_name" {
    default = "eng130"
  
}

variable "aws_key_path" {
  default = "~/.ssh/eng130.pem"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
  
}

variable "subnet_cider_block" {
  default = "10.0.2.0/24"
}

variable "region" {

  default = "eu-west-1"
  
}

variable "availability_zone" {
  default = "eu-west-1a"
  
}

variable "webapp_ami_id" {

    default = "ami-0b47105e3d7fc023e"

}


