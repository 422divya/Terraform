variable "instance" {
    type = object ({
    amiid = string
    name = list(string)
    instancetype = string
    instance-count = number
    


})
    default = {
      name = ["first-instance-module", "second-instance-module"]
      amiid = "ami-0bc23e4337e8bc5ea"
      instancetype = "t2.micro"
      instance-count = 2

}

}
