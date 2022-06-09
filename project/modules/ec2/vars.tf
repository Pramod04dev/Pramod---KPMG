variable "ami" {
  description = "aws ec2 instance ami"
}

variable "instance_type" {
  description = "aws instance type"
}

variable "subnet_id" {
  description = "vpc subnet IDS"
}

variable "vpc_security_group_ids" {
  description = "vp security group id"
}

variable "key_name" {
  description = "ec2 key pairs"
}

variable "common_tags" {
  description = "common tags"
  type = map
}

variable "project" {
  description = "name of the project"
}

variable "env" {
  description = "name of the environment"
}