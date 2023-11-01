variable "aws_region" {
  description = "The AWS region in which resources will be created."
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type."
  type        = string
}

variable "ami_value"{
  description = "ami value"
  type = string
}