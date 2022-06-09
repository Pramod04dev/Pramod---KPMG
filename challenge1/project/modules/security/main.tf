resource "aws_security_group" "ec2_sg" {
  name        = "${var.project}-ec2-sg-${var.env}"
  description = "Allow ssh inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "allow ssh from cidr block"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.ec2_allowed_cidr_block
  }

  ingress {
    from_port       = var.application_port
    to_port         = var.application_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
    description     = "Allow the ALB to access the ECS cluster"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  tags = "${merge(var.common_tags, map(
    "Name", "${var.project}-ec2-sg-${var.env}"
  ))}" 
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.project}-rds-sg-${var.env}"
  description = "Allow ssh inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "allow ec2 to access rds Db"
    from_port        = var.db_port
    to_port          = var.db_port
    protocol         = "tcp"
    security_groups  = aws_security_group.ec2_sg.id
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  tags = "${merge(var.common_tags, map(
    "Name", "${var.project}-rds-sg-${var.env}"
  ))}"  
}

resource "aws_security_group" "alb-sg" {
  name        = "${var.project}-alb-sg-${var.env}"
  description = "${var.project}-alb-sg-${var.env}"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = var.alb_cidr_blocks
    description     = "Access alb CIDR"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(var.common_tags, map(
    "Name", "${var.project}-alb-sg-${var.env}"
  ))}"  
} 
