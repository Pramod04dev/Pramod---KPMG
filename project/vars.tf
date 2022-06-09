variable "region" {
  description = "aws region"
}

variable "project" {
  description = "name of the project"
}

variable "env" {
  description = "name of the environment"
}

variable "vpc_cidr" {
  description = "vpc cidr"
}

variable "public_subnet_cidr" {
  description = "public subnet cidr"
}

variable "private_subnet_cidr" {
  description = "private subnet cidr"
}

variable "route_ass_count" {
  description = "route associate count"
}

variable "public_subnet_count" {
  description = "public subnet count"
}

variable "private_subnet_count" {
  description = "private subnet count"
}

variable "ec2_allowed_cidr_block" {
  description = "ec2 allowed cidr block"
}

variable "application_port" {
  description = "application port"
}

variable "db_port" {
  description = "db port"
}

variable "alb_cidr_blocks" {
  description = "alb cidr block"
}

variable "ami" {
  description = "ec2 ami"
}

variable "instance_type" {
  description = "instance type"
}

variable "engine" {
  description = "rds engine"  
}

variable "engine_version" {
  description = "rds engine version"
}

variable "auto_minor_version_upgrade" {
  description = "rds auto minor version upgrade"
}

variable "family" {
  description = "rds family"
}

variable "master_username" {
  description = "rds master username"
}

variable "backup_retention_period" {
  description = "rds backup retention period"
}

variable "preferred_backup_window" {
  description = "rds preferred backup window"
}

variable "preferred_maintenance_window" {
  description = "rds preferred maintainance window"
}

variable "skip_final_snapshot" {
  description = "rds ekip final snapshot"
}

variable "enabled_cloudwatch_logs_exports" {
  description = "rds enable cloudwatch logs exporter"
}

variable "rds_instance_count" {
  description = "rds instance count"
}

variable "kms_key_id" {
  description = "rds kms key id"
}

variable "engine_mode" {
  description = "rds engine mode"
}

variable "enable_http_endpoint" {
  description = "rds enable http endpoint"
}


variable "identifier" {
  description = "rds identifier"
}

variable "instance_class" {
  description = "rds instance class"
}

variable "database_name" {
  description = "db name"
}

variable "master_password" {
  description = "master password"
}

variable "alb_cert_arn" {
  description = "alb certificate arn"
}

variable "alb_health_timeout" {
  description = "default interval between checks"
  default     = 3
}

variable "alb_unhealthy_threshold" {
  description = "default un health threshold"
  default     = 2
}


variable "deregistration_delay" {
  description = "deregistration delay"
}

variable "health_check_path" {
  description = "health check path"
}

