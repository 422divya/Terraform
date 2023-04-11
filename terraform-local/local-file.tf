resource local_file "terraform_test"{
   filename = "/home/ec2/terraform_test.txt"
   content = "This is first terraform"
}

resource local_file "test"{
  filename = "/home/ec2/test2.txt"
  content = "This is second file"

}
