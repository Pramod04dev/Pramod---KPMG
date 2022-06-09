
output "alb_target_group_arn" {
  value = aws_alb_target_group.alb-tg.arn
}

output "alb_dns_name" {
  value = aws_alb.alb.dns_name
}

output "alb_arn_suffix" {
  value = aws_alb.alb.arn_suffix
}

output "alb_targetgroup_arn_suffix" {
  value = aws_alb_target_group.alb-tg.arn_suffix
}

output "alb_target_group_id" {
  value = "${aws_alb.alb.arn_suffix}/${aws_alb_target_group.alb-tg.arn_suffix}"
}

output "alb_listener_id" {
  value = aws_lb_listener.alb-listener-https.id
}

output "alb_listener_arn" {
  value = aws_lb_listener.alb-listener-https.arn
}