**Introduction:**

Terraform is used to provision, modify the infrastructure on various cloud providers like AWS, Azure, GCP etc and also on-premise servers. It is open source Infrastructure as a code tool.

It was created by Hashicorp and uses the hashicorp language. HCL language is easy to understand which helps to understand and write code easily. So instead of using the GUI to create the instances and configure it we can use the terraform for the same by writing it in the code.

Lets see how to we can use terraform to provision the EC2 instance on AWS:

1- Create the AWS account if you do not have it. Just follow the instarction to sign up and once done you will be able to use the AWS services.

2- Then we have to install terraform on the server on which we are going to write the code to provision the instance. Here I am using the AWS free tier EC2 instance. 

3- Install the terraform on the EC2 instance. Use the below terraform link for the steps to instal terraform. Select the Linux distribution you are using to get the steps for the same. Here I am using the Amazon Linux distribution.

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

$ sudo yum install -y yum-utils
$ sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
$ sudo yum -y install terraform

4- Check if the terraform is installed using below command:

$ sudo terraform --version

5-
