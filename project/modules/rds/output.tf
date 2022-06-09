output "rds_endpoint" {
  value = aws_rds_cluster.aurora_cluster.endpoint
}

output "rds_port" {
  value = aws_rds_cluster.aurora_cluster.port
}

output "rds_host" {
  value = aws_rds_cluster.aurora_cluster.endpoint
}

output "rds_arn" {
  value = aws_rds_cluster.aurora_cluster.arn
}

output "rds_id" {
  value = aws_rds_cluster.aurora_cluster.id
}

output "rds_cluster_identifier" {
  value = aws_rds_cluster.aurora_cluster.cluster_identifier
}