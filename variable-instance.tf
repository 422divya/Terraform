variable "aws-instance" {
   type = object ({
      name = list(string)
      ami = string
      type = string
      count = number


})

  default = {
     name = ["ec2-terraform-var", "ec2-terraform-2"]
     ami = "ami-079a2a9ac6ed876fc"
     count = 2
     type = "t2.micro"

}


}
