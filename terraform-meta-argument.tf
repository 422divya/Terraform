terraform {

required_providers {
  aws = {
   version = "~>4.16"
   source = "hashicorp/aws"

}

}
}

provider "aws" {
 region = "ap-northeast-1"
 
}

resource "aws_instance" "instance_meta" {
   for_each = toset(var.instance.name)
   ami = var.instance.ami 
   instance_type = var.instance.type
   tags = {
    Name = each.key
}

}
