variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}

variable "env" {
  description = "The name of the environment"
}

variable "project" {
  description = "The name of the project"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "alb_security_group_ids" {
  description = "ALB security group"
  type        = list(string)
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnets ids"
}

variable "deregistration_delay" {
  description = "ALB deregistration delay"
}

variable "health_check_path" {
  description = "ALB healthcheck path"
}

variable "alb_cert_arn" {
  description = "ALB cerificate ARN used for https listener"
}

variable "ssl_policy" {
  description = "If Forward Secrecy is needed please use ELBSecurityPolicy-TLS-1-2-Ext-2018-06 policy to meet compliance and security standards that require disabling TLS protocol versions of to support legacy clients that require deprecated ciphers"
  default     = "ELBSecurityPolicy-FS-1-2-Res-2020-10"
}

variable "alb_targetgroup_port" {
  description = "Target group port"
  default     = 80
}

variable "alb_targetgroup_protocol" {
  description = "Target group port"
  default     = "HTTP"
}

variable "alb_targetgroup_healthcheck_protocol" {
  description = "Target group health check port"
  default     = "HTTP"
}

variable "alb_targetgroup_target_type" {
  description = "Target group target_type"
  default     = "instance"
}

variable "alb_internal" {
  description = "Is it internal ALB?"
  default     = false
}

variable "alb_healthy_threshold" {
  description = "default threshold"
  default     = 3
}

variable "alb_health_interval" {
  description = "default interval between checks"
  default     = 30
}

variable "alb_health_timeout" {
  description = "default interval between checks"
  default     = 3
}

variable "alb_unhealthy_threshold" {
  description = "default un health threshold"
  default     = 2
}

variable "alb_health_check_port" {
  description = "custom port to use instead of default value traffic port. set null for modules which use default traffic port"
  default     = null
}

variable "alb_healthy_status_code" {
  description = "Optiona, successfull health check status code"
  default = "200"
}

variable "alb_name" {
  description = "alb name"
  default = ""
}

variable "idle_timeout" {
  description = "Idle timeout"
  default = "300"
}

variable "enable_deletion_protection" {
  description = "Enable delete protection"
  default = true
}