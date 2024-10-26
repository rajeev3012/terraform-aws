# terraform-aws

Use Terraform to deploy EC2 instance on AWS. Below are the steps involved:


1. Install pipx (a tool to run Python packages), then install awscli:

        apt install pipx

        pipx install awscli


	1. Install pipx( a tool to run Python packages), then install awscli:
		# apt install pipx
		# pipx install awscli


	2. Add path to env. variable:
		# pipx ensurepath

		Restart the terminal.
		

	3. Check if aws is installed:
		# aws --version


	4. Connect awscli to amazon account:
		# aws configure
		
			a. Access key: XXXX
			b. Secret: XXXX
			c. Region: us-east-1
			d. Format: json



	5. Install terraform:

		(A) Install GNU Privacy Guard(GPG) to check Hashicorp s/w is genuine:
			# sudo apt install -y gnupg software-properties-common
		
		(B) Add GPG key:
			# wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
		
		(C) Add Hashicorp repo (by default APT doesn't have terraform)
			# echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
		
		(D) Install terraform:
			# sudo apt install terraform


	6. Create terraform files to deploy the infrastructure:

	# main.tf
	
		# Define the AWS provider
		provider "aws" {
		  region = var.aws_region
		}
		
		
		# Define an EC2 instance
		resource "aws_instance" "example" {
		  ami           = var.ami_id
		  instance_type = var.instance_type
		
		  # Add a simple tag
		  tags = {
			Name = "Demo-EC2-Instance"
		  }
		}
	
	
	
	# Variables.tf
	
		# AWS region variable
		variable "aws_region" {
		  description = "AWS region for the EC2 instance"
		  default     = "us-east-1"
		}
		
		# AMI ID variable
		variable "ami_id" {
		  description = "AMI ID for the EC2 instance"
		  default     = "ami-06b21ccaeff8cd686"
		}
		
		# Instance type variable
		variable "instance_type" {
		  description = "Instance type for the EC2 instance"
		  default     = "t2.micro"
		}
		
	

	7. Run Terraform commands:
	
		(A) Initialize terraform repository ("terraform.tfstate" file is created @root):
			# terraform init

		(B) View changes to make:
			# terraform plan
			
		(C) Reformat to correct Indentation:
			# terraform fmt
			
		(D) Check for errors:
			# terraform validate
			
		(E) Apply changes:
			# terraform apply
			
		(F) Remove changes:
			# terraform destroy
			
			
	8. Push code to Git:

		(A) Install git
			# apt install git
			
		(B) Set global Git configuration:
			# git config --global user.name “rajeev3012”
			# git config --global user.email “rajeevr.3012@gmail.com”
			
		(C) Create .gitignore file to exclude terraform large unnecessary files:
			.terraform/
			
		(D) Initialize git:
			# git init
			
		(E) Check files:
			# git status

		(F) Add to staging area:
			# git add .
			
		(G) Add commit with message:
			# git commit -m "initial commit"
		
			
		(H) Add GitHub remote repo:
			# git remote add origin https://github.com/rajeev3012/terraform-aws.git
		
		(I) Update GIT remote URL; enter username and PAT on git push:
			# git remote set-url origin https://github.com/rajeev3012/terraform-aws.git
		
		(J) Fetch and merge latest change to local first:
			# git pull origin main --rebase
		
		
		(K) Finally push changes to remote:
			# git push -u origin main
