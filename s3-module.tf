provider "aws" {

 region = "ap-northeast-1" 
}


module "s3_module" {

  source = "terraform-aws-modules/s3-bucket/aws"
  version = "3.12.0"
  bucket = "module-bucket-example"

  versioning = {
      enabled = true
}

}
