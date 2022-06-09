variable "region" {
  description = "aws region"
}

variable "project" {
  description = "project name"
}

variable "env" {
  description = "environment name"
}

variable "family" {
  description = "family name"
}

variable "param_group_parameters" {
  description = "param group parameters"
}

variable "subnet_ids" {
  description = "subnet ids"
}

variable "common_tags" {
  description = "common tage"
  type = map
}

variable "engine" {
  description = "rds engine"
}

variable "engine_version" {
  description = "rds engine version"
  default = null
}

variable "engine_mode" {
  description = "rds engine mode"
  default = "provisioned"
}

variable "database_name" {
  description = "database name"
}

variable "master_username" {
  description = "rds master username"
  default = "admin"
}

variable "master_password" {
  description = "master password"
}

variable "backup_retention_period" {
  description = "time period for which a backup will be preserved"
}

variable "preferred_backup_window" {
  description = "time of day when the backup is created"
}

variable "preferred_maintenance_window" {
  description = "time of day when new versions are installed"
}

variable "rds_sg_id" {
  description = "rds sg id"
}

variable "skip_final_snapshot" {
  description = "create or not a final db snapshot before deleting the db/cluster"
}

variable "enabled_cloudwatch_logs_exports" {
  description = "Set of log types to export to cloudwatch. "
  default     = null
}

variable "kms_key_id" {
  description = "The ARN for the KMS encryption key"
}

variable "enable_http_endpoint" {
  description = "(Optional) Enable HTTP endpoint (data API). Only valid when engine_mode is set to serverless"
  default     = null
}

variable "copy_tags_to_snapshot" {
  type        = bool
  description = "Copy all Cluster tags to snapshots."
  default     = false
}

variable "instance_class" {
  description = "the instance type that will power the cluster instances"
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window."
}

