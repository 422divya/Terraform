resource "aws_instance" "instance_module" {
   ami = var.instance.amiid
   count = var.instance.instance-count
   instance_type = var.instance.instancetype
#   key_name = "module-key"
   vpc_security_group_ids = [aws_security_group.security.id]
   tags = {
       Name= element(var.instance.name, count.index)
 } 
  user_data = <<-EOF
  #!/bin/bash
  echo "Installing apache"
  sudo yum update -y
  sudo yum install httpd -y
  sudo systemctl enable httpd --now
  sudo echo "Apache is installed and running" >> /var/www/html/index.html
  EOF

 

}


resource "aws_key_pair" "pubkey" {
  key_name = "module-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDvo9Ms4DpTHSVvNJzfmZVpZlBg9CCK1eGAZoMVmQ61a3zRfynuGSquTu2Mf4I7AxGwrTEx6Cq/3xIzNdWqmSxJyWnnZaLaox3DFRhAiKZBAK+KeCmqLVBvYM3p5rHfswqx5ZuoyvWAAfT60TpuJjX9joYBcLkGn3diM8GpbOm9qvAXsDQ5IyQQtOEKSsimYw/3J1OodGrTntGhqMpHgbNy3GGoNUYxCGoPHxITSf/NbY3bp4gQojZ+cNUY7SZVe2iA4Xes5ryR8ROyhGgEZtn9y+IR+OxrzZ/Y/QJ+Vey/K1ssaPPgT92hfHZQ+WXtn19MP5Ow2aK067ElQDTdLI6ZwJdnk22OJBi7+ZZ5uKjDxqV4kbKJxtdoGf1x7D9m/ezxB9lZ0zFpW8FQPHeFigv/QrYYq6jGT4ij1N5debKDOdWb2zaTiZfOsIJFDK6dGHQ2n4fgpFrFBD8uleR0T3NO5pGqUASW/3/2n+1B1iuMVc6LGLSHIs4aBKKeB2z7Is= ec2-user@ip-172-31-7-211.ap-northeast-1.compute.internal"

}
