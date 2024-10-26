# AWS EC2 deployment with Terraform:

This project automates the deployment of an EC2 instance on AWS using Terraform as an Infrastructure as Code (IaC) tool.

---

### 1. Key Features
- Uses **Terraform** to define and deploy infrastructure on AWS.
- Configures **AWS CLI** for secure authentication.
- Manages customizable variables to easily modify deployment specifics.



### 2. Setup

- **AWS CLI Configuration**: Connects to AWS for authentication and resource management.
- **Terraform Installation**:
    - Installed Terraform via the HashiCorp repository.
    - Verified installation and environment setup.



### 3. Configuration

- **`main.tf`**:
  - Defines the AWS provider.
  - Provisions an EC2 instance with a specified **AMI ID** and **instance type**.
  - Includes resource tagging for easy identification.

- **`variables.tf`**:
  - Manages variables such as `aws_region`, `ami_id`, and `instance_type` to enable customization and flexibility.


### 4. Terraform Workflow
  - `initialize`: Establishes the Terraform workspace.  
  - `validate`: Verifies the configuration for syntax and errors.  
  - `format`: Reformats code to ensure consistent indentation.  
  - `apply`: Executes the configuration on AWS, initiating the EC2 instance.

### 5. Version Control

- Configured **Git** for version tracking, maintaining a clear project history.
- Created a `.gitignore` file to exclude unnecessary files from the repository.
- Pushed all configuration files to **GitHub** for centralized tracking and collaboration.


---

### Quick Start

To clone this repository and start using the configuration:

```bash
# Clone the repository
git clone https://github.com/rajeev3012/terraform-aws.git

# Navigate into the project directory
cd terraform-aws

# Initialize Terraform
terraform init

# Apply the configuration
terraform apply
```

---


# Detailed step-by-step instructions:

## 1. Setup and configure AWS CLI

#### a. Install pipx (a tool to run python packages): 
```bash
    apt install pipx
```

#### b. Install AWS CLI via pipx:
```bash
    pipx install awscli
```

#### c. Add path to env. variable and restart the terminal to take affect:
```bash
    pipx ensurepath
```	

#### d. Check if aws is installed:	
```bash
    aws --version
```

#### e. Connect awscli to amazon account:
```bash
    aws configure
```
            a. Access key: XXXX
            b. Secret: XXXX
            c. Region: us-east-1
            d. Format: json

## 2. Install terraform:

#### a. Install GNU Privacy Guard(GPG) to check Hashicorp s/w is genuine:

```bash
    sudo apt install -y gnupg software-properties-common
```
    
#### b. Add GPG key:

```bash
    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
```
    
#### c. Add Hashicorp repo (by default APT doesn't have terraform)

```bash
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
```
    
#### d. Install terraform:

```bash    	
    sudo apt install terraform
```

## 3. Create terraform files to deploy the infrastructure:

#### main.tf
	
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
	
	
#### variables.tf
	
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
	

## 4. Run Terraform commands:
	
#### a. Initialize terraform repository ("terraform.tfstate" file is created @root):
    
```bash
    terraform init
```

#### b. View changes to make:

```bash	
    terraform plan
```
        
#### c. Reformat to correct Indentation:
    
```bash    
    terraform fmt
```
        
#### d. Check for errors:
    
```bash    
    terraform validate
```
        
#### e. Apply changes:

```bash	
    terraform apply
```
        
#### f. Remove changes (delete resources):

```bash
    terraform destroy
```
		
			
## 5. Setup Git and push code to GitHub repo:

#### a. Install git:

```bash	
    apt install git
```
        
#### b. Set global Git configuration:

```bash
    git config --global user.name “rajeev3012”
    git config --global user.email “rajeevr.3012@gmail.com”
```
    
#### c. Create .gitignore file to exclude terraform large unnecessary files to be uploaded to remote repository:

    .terraform/
    
#### d. Initialize git:

```bash
    git init
```
    
#### e. Check files:
    
```bash
    git status
```

#### f. Add to staging area:
    
```bash    
    git add .
```
    
#### g. Add commit with message:

```bash
    git commit -m "initial commit"
```

    
#### h. Add GitHub remote repo:

```bash
    git remote add origin https://github.com/rajeev3012/terraform-aws.git
```

#### i. Update GIT remote URL; enter username and PAT on git push:

```bash
    git remote set-url origin https://github.com/rajeev3012/terraform-aws.git
```

#### j. Fetch and merge latest change to local first:

```bash
    git pull origin main --rebase
```

#### k. Finally push changes to remote repo:

```bash
    git push -u origin main
```

---
---

## Author

[@RajeevRanjan](https://github.com/rajeev3012/)


