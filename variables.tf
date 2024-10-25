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
