terraform {
 required_providers {
 aws = {
 source = "hashicorp/aws"
 version = "5.1.0"
 
}
}

backend "s3" {
  bucket = "terra-bucket-day4"
  key = "statefile"
  region = "ap-northeast-1"
  dynamodb_table = "terraform-dynamodb"
   } 
}


provider "aws" {
 region = "ap-northeast-1"
}
resource "aws_s3_bucket" "bucket-terraform" {
  bucket = "terra-bucket-day4"
}

resource "aws_dynamodb_table" "terraform-dynamo" {
    name = "terraform-dynamodb"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
      name = "LockID"
      type = "S"
}
}

resource "aws_instance" "state-instance" {
  ami = "ami-03dceaabddff8067e"
  instance_type = "t2.micro"
  tags = {
     Name = "state-ec2"
}

}
