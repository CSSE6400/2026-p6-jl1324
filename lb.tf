resource "aws_lb_target_group" "taskoverflow" { 
  name          = "taskoverflow" 
  port          = 6400 
  protocol      = "HTTP" 
  vpc_id        = aws_security_group.taskoverflow.vpc_id 
  target_type   = "ip" 
 
  health_check { 
    path                = "/api/v1/health" 
    port                = "6400" 
    protocol            = "HTTP" 
    healthy_threshold   = 2 
    unhealthy_threshold = 2 
    timeout             = 5 
    interval            = 10 
  } 
}

output "taskoverflow_dns_name" { 
  value = aws_lb.taskoverflow.dns_name 
  description = "DNS name of the TaskOverflow load balancer." 
}