resource "aws_alb_target_group" "alb-tg" {
  name                 = "${var.project}-tg-${var.env}"
  port                 = var.alb_targetgroup_port
  protocol             = var.alb_targetgroup_protocol
  vpc_id               = var.vpc_id
  deregistration_delay = var.deregistration_delay
  target_type          = var.alb_targetgroup_target_type

  health_check {
    healthy_threshold   = var.alb_healthy_threshold
    interval            = var.alb_health_interval
    protocol            = var.alb_targetgroup_healthcheck_protocol
    matcher             = var.alb_healthy_status_code
    timeout             = var.alb_health_timeout
    path                = var.health_check_path
    unhealthy_threshold = var.alb_unhealthy_threshold
    port                = var.alb_health_check_port
  }

  tags = "${merge(var.common_tags, map(
    "Name", "${var.project}-${var.environment}-nat-gtw"
  ))}"

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_alb.alb]
}

resource "aws_alb" "alb" {
  name            = "${var.project}-alb-${var.env}"
  subnets         = var.subnet_ids
  security_groups = var.alb_security_group_ids
  idle_timeout    = var.idle_timeout
  internal        = var.alb_internal
  enable_deletion_protection = var.enable_deletion_protection

  tags = merge(
    var.common_tags,
    {
      "Name" = local.alb_name
    },
  )
}

resource "aws_lb_listener" "alb-listener-https" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.alb_cert_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.alb-tg.arn
  }
}