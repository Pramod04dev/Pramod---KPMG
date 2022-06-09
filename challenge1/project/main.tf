provider "aws" {
  region  = var.region
} 

terraform {
   backend "s3" {}
 }

locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Project = var.project
    Environment = var.env
    CreatedBy = "Terraform"
  }
}

 module "vpc" {
   source = "./modules/vpc"
   vpc_cidr = var.vpc_cidr
   public_subnet_cidr = var.public_subnet_cidr
   private_subnet_cidr = var.private_subnet_cidr
   vpc_id = module.vpc.vpc_id
   environment = var.env
   project = var.project
   common_tags = local.common_tags
   region = var.region
   route_ass_count = var.route_ass_count
   public_subnet_count = var.public_subnet_count
   private_subnet_count = var.private_subnet_count
 }

 module "security" {
   source = "./modules/security"
   project = var.project
   env = var.env
   vpc_id = module.vpc.vpc_id
   ec2_allowed_cidr_block = var.ec2_allowed_cidr_block
   application_port = var.application_port
   common_tags = local.common_tags
   db_port = var.db_port
   alb_cidr_blocks = var.alb_cidr_blocks
 }

 module "ec2" {
   source = "./modules/ec2"
   ami = var.ami
   instance_type = var.instance_type
   subnet_id = module.vpc.private_subnet_id
   vpc_security_group_ids = module.security.ec2_sg_id
   common_tags = local.common_tags
 }

 module "rds" {
   source = "./modules/rds"
   project                                 = var.project
   env                                     = var.env
   region                                  = var.region
   subnet_ids                              = module.vpc.private_subnet_id
   engine                                  = var.engine
   engine_version                          = var.engine_version
   auto_minor_version_upgrade              = var.auto_minor_version_upgrade
   family                                  = var.family
   database_name                           = var.database_name
   master_username                         = var.master_username
   master_password                         = var.master_password
   backup_retention_period                 = var.backup_retention_period
   preferred_backup_window                 = var.preferred_backup_window
   preferred_maintenance_window            = var.preferred_maintenance_window
   rds_sg_id                               = module.security.rds_sg_id
   skip_final_snapshot                     = var.skip_final_snapshot
   enabled_cloudwatch_logs_exports         = var.enabled_cloudwatch_logs_exports
   vpc_id                                  = var.vpc_id
   rds_instance_count                      = var.rds_instance_count
   common_tags                             = local.common_tags
   kms_key_id                              = var.kms_key_id
   engine_mode                             = var.engine_mode
   enable_http_endpoint                    = var.enable_http_endpoint
   identifier                              = var.identifier
   instance_class                          = var.instance_class
   database_port                           = var.database_port
   param_group_parameters                  = {}
 }

module "loadbalancer" {
  source = "./modules/loadbalancer"
  alb_internal                = "true"
  subnet_ids                  = module.vpc.public_subnet_id
  vpc_id                      = module.vpc.vpc_id
  env                         = var.env
  alb_cert_arn                = var.alb_cert_arn
  alb_security_group_ids      = [module.Security.alb_sg_id]
  alb_health_timeout          = var.alb_health_timeout
  alb_unhealthy_threshold     = var.alb_unhealthy_threshold
  deregistration_delay        = var.deregistration_delay
  health_check_path           = var.health_check_path
  project                     = var.project
  common_tags                 = local.common_tags
  alb_targetgroup_target_type = "ip"
}

resource "aws_elb_attachment" "ec2_alb_attachment" {
  elb      = "${var.project}-alb-${var.env}"
  instance = module.ec2.id
}
