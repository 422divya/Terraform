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
         ami = var.ec2-instance["ami"]
         instance_type = var.ec2-instance["type"]
         key_name = "source-pub-key"
         vpc_security_group_ids   = [aws_security_group.access.id] 
         tags = {
              Name = var.ec2-instance["name"]
}
    provisioner "local-exec" {
           command = "echo ${self.public_ip} >> pubip.txt"
         
}

   provisioner "remote-exec" {
        inline = [
           "sudo touch /home/test.txt",
           "sudo echo 'File created by remote-exec provisioner' >> /home/test.txt",
           "sudo yum update -y"
  ]
 }

   connection {
      type = "ssh"
      host = self.public_ip
      user = "ec2-user"
      private_key = "${file("/home/ec2-user/.ssh/id_rsa")}"
 }
}


resource "aws_security_group" "access" {
      ingress {
           description = "ssh"
           from_port = 22
           to_port = 22
           protocol = "tcp"
           cidr_blocks = ["0.0.0.0/0"]


}


egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]

}


}

resource "aws_key_pair" "key" {
     key_name = "source-pub-key"
     public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCWSsuwJ3qALmJMjTBT8XNf5E3Ta6pNHzt1XCFOFQXRTsvSjRi8b4QJvYaliuvMe7WzbENNFpW7E3DaQ2vWbBfLnNh0902plo9X2e9K6ZDtc8TqbM89x+vzSHf3I9aroyKirODXsE1DM/F6Hok00qJCoOY9lkfvVSn67yyHFGfX0pxXgtVExEd4e3qPLSzk5eCnx133dWF7uWnuZbD9vwAYtfFtSn2m83yGIWr32exeNkCuVqVU9LNtEl816bheKXI6ZoXfwiOtdQSxT14h1qUdjRRMnft5D5eXP6NTQmfymEA9AYwG86sNUU//O9FGfWvY1gU2sqWXbqcW6TAwJGe4TyDWDJtiWYWZbZLuF6FcWkAzsCzlKqi28+EYpHGJerdDGySHjdokZKw06GU/OCJPIT+YxQkoDfY6S+6MjdXFZEn8ch2itVotEIT8Wz+2+9LNPNel6YW8Ihqlfublp2Czs+YbeVoHDPtsfrvCmokL09lvbg7RbQ9IQS9hyGrUV8s= ec2-user@ip-172-31-7-211.ap-northeast-1.compute.internal"
}
