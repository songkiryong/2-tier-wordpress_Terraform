###### Provisioned Variables (Can modify)
variable "aws_region" {
  default = "ap-northeast-2"
}

variable "vpc_name" {
  default = "main"
}

variable "aws_ami" {
   default = "ami-05f375b54be4ab849" # ubuntu 18.04
  #default = "ami-07270d166cdf39adc" # RHEL8
}

variable "instance_type" {
  default = "t2.micro"
}


variable "zones" {
  type = list(string)
  default = ["a","c"]
}

# Path to your public key, which will be used to log in to
variable "public_key" {}


variable "key_pair" {}

variable "cidr_number_public" {
  description = "Public CIDR"
  default = {
    "0" = "0"
    "1" = "16"
    "2" = "32"
  }
}

variable "cidr_number_private" {
  description = "Private CIDR"
  default = {
    "0" = "48"
    "1" = "64"
    "3" = "80"
  }
}

variable "cidr_number_db_private" {
  description = "DB Private CIDR"
  default = {
    "0" = "96"
    "1" = "112"
    "2" = "128"
  }
}

variable "availability_zones" {
  type = list(string)
  description = "Availability zone with a and c (because of t2.micro is only available in ap-northeast-2a,2c"
}

variable "local_ip" {}

# Mysql db setting
variable "mysql_user" {}

variable "mysql_password" {}

variable "mysql_db" {}


