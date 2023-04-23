terraform {
  required_providers {
     aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"

}
}

}

provider "aws" {
   region = "ap-northeast-1"
}

resource aws_instance "ec2-1" {
    ami = var.aws-instance.ami
    instance_type = var.aws-instance.type
    count = var.aws-instance.count
    tags = {
      Name = element(var.aws-instance.name, count.index)


}

}
