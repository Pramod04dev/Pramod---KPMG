variable "project" {
  description = "name of the project"
}

variable "env" {
  description = "name of the environment"
}
variable "vpc_id" {
  description = "vpc ID"
}

variable "ec2_allowed_cidr_block" {
  description = "ec2 allowed cidr block"
}

variable "application_port" {
  description = "application port"
}

variable "common_tags" {
  description = "common tags"
  type = map
}

variable "db_port" {
  description = "db port"
}

variable "alb_cidr_blocks" {
  description = "alb allowed cidr blocks"
}