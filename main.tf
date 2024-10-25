# Define the AWS provider
provider "aws" {
  region = var.aws_region
}

# Define an EC2 instance
resource "aws_instance" "example" {
  ami           = var.ami_id          # Amazon Machine Image ID
  instance_type = var.instance_type   # Instance type (e.g., t2.micro)

  # Add a simple tag
  tags = {
    Name = "Demo-EC2-Instance"
  }
}
