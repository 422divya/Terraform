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

module "instance" {
  source = "/home/ec2-user/terraform/modules/instance-sec"


}
