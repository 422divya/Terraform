variable "ec2-instance" {
    type = map
    default = {
       name = "terraform-ec2"
       ami = "ami-03dceaabddff8067e"
       type = "t2.micro"
       
}

}
