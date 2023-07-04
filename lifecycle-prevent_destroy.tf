terraform {
       required_providers {
           aws = {
              source = "hashicorp/aws"
              version = "5.1.0"
 
}
}

}


provider "aws" {
   region = "ap-northeast-1"

}


resource "aws_instance" "terraform-instance" {
         ami = "ami-03dceaabddff8067e"
         instance_type = "t2.micro"
         tags = {
              Name = "lifecycle-instance"
}

lifecycle {
   prevent_destroy= true

 }

}
