terraform {
  required_providers {
          aws = {
               source = "hashicorp/aws"
               version = "5.5.0"
  }

}

}

provider "aws" {
  region = "ap-northeast-1"

}


resource "aws_s3_bucket" "s3-bucket" {
     bucket = "teraform-bucket-test1"
     tags = {
        Name = "test-bucket"
}

}

resource "aws_s3_bucket_public_access_block" "public_access" {
   bucket = aws_s3_bucket.s3-bucket.id
   block_public_acls = true
   block_public_policy = true
   ignore_public_acls      = true
   restrict_public_buckets = true

}

resource "aws_iam_policy" "new_policy_for_bucket" {
 name = "policy-bucket"
 path = "/"
 description = "s3 testpolicy"

policy = jsonencode(
{
        "Version": "2012-10-17",
        "Statement": [
                {
                        "Sid": "Statement1",
                        "Effect": "Allow",
                        "Action": [
                                "s3:PutObject",
                                "s3:GetObject",
                                "s3:ListBucket",
                                "s3:DeleteObject"
                        ],
                        "Resource": [
                                "*"
                        ]
                }
        ]
}
)

}


resource "aws_iam_role" "test-role"{
 name = "new-role"
 assume_role_policy = jsonencode(
{
        "Version": "2012-10-17",
        "Statement": [
                {
                        "Sid": "Statement1",
                        "Effect": "Allow",
                        "Principal": {
                                "Service": "ec2.amazonaws.com"
                        },
                        "Action": [
                                "sts:AssumeRole"
                        ]
                }
        ]
}

)

}

# attaching policy to above role
resource "aws_iam_role_policy_attachment" "policy-attach-role" {
 role = aws_iam_role.test-role.name
 policy_arn = aws_iam_policy.new_policy_for_bucket.arn
}



resource "aws_s3_bucket_versioning" "s3-version" {
   bucket = aws_s3_bucket.s3-bucket.id
   versioning_configuration {
        status = "Enabled"
} 

}
