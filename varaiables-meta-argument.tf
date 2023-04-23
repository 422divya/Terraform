variable "instance" {
 type = object({
   name = list(string)
   instances = number
   type = string
   ami = string

})

default = {
 instances = 2
 type = "t2.micro"
 ami = "ami-01b32aa8589df6208"
 name = ["ec2-meta-instance", "2instance"]


}

}
