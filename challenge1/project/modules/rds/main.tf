provider "aws" {
  region = var.region
}

locals {
  cluster_identifier          = var.cluster_identifier == "" ? format("%s-%s-%s", var.project, var.engine, var.env) : var.cluster_identifier
  cluster_instance_identifier = var.cluster_instance_identifier == "" ? format("%s-%s", var.identifier, var.env) : var.cluster_instance_identifier
}

resource "aws_rds_cluster_parameter_group" "rds_cluster_param_gr" {
  name   = "${var.project}-rds-cluster-param-group-${var.env}"
  family = var.family

  dynamic "parameter" {
    for_each = var.param_group_parameters

    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = "pending-reboot"
    }
  }

  tags = var.common_tags
}

resource "aws_db_subnet_group" "db" {
  name       = "${var.project}-db-subnet-${var.env}"
  subnet_ids = var.subnet_ids
  tags       = var.common_tags
}

resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier              = local.cluster_identifier
  engine                          = var.engine
  engine_version                  = var.engine_version
  engine_mode                     = var.engine_mode
  database_name                   = var.database_name
  master_username                 = var.master_username
  master_password                 = var.master_password
  backup_retention_period         = var.backup_retention_period
  preferred_backup_window         = var.preferred_backup_window
  preferred_maintenance_window    = var.preferred_maintenance_window
  db_subnet_group_name            = aws_db_subnet_group.db.name
  vpc_security_group_ids          = var.rds_sg_id
  skip_final_snapshot             = var.skip_final_snapshot
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.rds_cluster_param_gr.id
  storage_encrypted               = true
  kms_key_id                      = var.kms_key_id
  enable_http_endpoint            = var.enable_http_endpoint
  copy_tags_to_snapshot           = var.copy_tags_to_snapshot
  tags = var.common_tags
}

resource "aws_rds_cluster_instance" "aurora_cluster_instance" {
  depends_on                 = [aws_rds_cluster.aurora_cluster]
  count                      = var.rds_instance_count : 0
  identifier                 = format("%s-%s", local.cluster_instance_identifier, count.index)
  cluster_identifier         = aws_rds_cluster.aurora_cluster.id
  instance_class             = var.instance_class
  engine                     = var.engine
  engine_version             = var.engine_version
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  tags                       = var.common_tags
}