# Create a new load balancer
resource "aws_elb" "elb" {
  name               =  "${var.product}-${var.environment}-elb"
  availability_zones = aws_instance.ec2_server[*].availability_zone
  security_groups = [aws_security_group.elb_sg.id]

  
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

 
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances                   = aws_instance.ec2_server.*.id
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "${var.product}-${var.environment}-elb"
  }
}
