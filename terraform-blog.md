Terraform:

Terraform is used to provision, modify, delete the infrastructure on various cloud providers like AWS, Azure, GCP etc and also on-premise servers. It is open source Infrastructure as a code tool.

It was created by Hashicorp and uses the hashicorp language. HCL language is easy to understand which helps to understand and write code easily. So instead of using the GUI to create the instances and configure it we can use the terraform for the same by writing it in the code.

Lets see how to we can use terraform to provision the EC2 instance on AWS:

1- Create the AWS account if you do not have it. Just follow the instruction to sign up and once done you will be able to use the AWS services.

2- Then we have to install terraform on the server on which we are going to write the code to provision the instance. Here I am using the AWS free tier EC2 instance. 

3- Create the IAM(Identity and Access Management) user on AWS and provide the access to that user. Also create access key and secret access key for the created user to use the CLI to access the aws services.

4- Install the terraform on the EC2 instance. Use the below terraform link for the steps to instal terraform. Select the Linux distribution you are using to get the steps for the same. Here I am using the Amazon Linux distribution.

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

5- Check if the terraform is installed using below command:
# terraform --version

6- Create a directory to isolate the terraform code.

$ mkdir terraform-instance
$ cd terraform-instance

7- To connect the AWS account with the terraform configure the aws cli which will require the access key and secret access key for the created IAM user. We can use the environmental variable for this as below:

$ sudo aws configure  <<= It will ask for access key id and secret key

8- Now set the environmental varaible for the terraform to get the access key id and secret access key.

export AWS_ACCESS_KEY_ID=<access_key>
export AWS_SECRET_ACCESS_KEY=<secret_access_key>

9- Below is the code to provision the EC2 instance on AWS. Create the file to write the HCL code. The file name extention should be .tf. 

vim ec2-instance.tf  

terraform {
  required_providers {
     aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"

}
}

}

provider "aws" {                             <<=====here using provider aws
   region = "ap-northeast-1"
}

resource aws_instance "ec2-1" {             <<======here using the aws resource instance. Syntax is resource "provider_type" "resource_name"
    ami = ami_id
    instance_type = "t2.micro"
    count = 3
    tags = {
      Name = element(terraform-instance, count.index)


}

}

10- There are various providers to be used for aws, azure, docker etc. You will get the details of it in the terraform registry along with the version.

https://registry.terraform.io/browse/providers

11- Save the file ec2-instance.tf .

12- Now run the below commands and make sure you are in the folder where the code is written.

$ terraform init  <<<= It will download and install the provider from the registry required to run the code. 

$ terraform plan  <<= It will show what code will be doing 

$ terraform apply  <<== It will run the code and create the ec2 instance on aws

13- After terraform plan a terraform state file will be created which stores the details of infrastructure created.
