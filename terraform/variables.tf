variable "aws_region" {
  default = "us-east-1"
  description = "The region where the AWS resources are created"
  type = string
}

variable "aws_profile" {
  type = string
  default = "default"
  
}