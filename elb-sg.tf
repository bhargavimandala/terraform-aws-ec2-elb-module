resource "aws_security_group" "elb_sg" {
  name   = "${var.product}.${var.environment}-elb_sg"
  vpc_id = "${var.vpc_id}"


     ingress {
    description = "elb sg"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


    

  tags = {
    Name = "${var.product}.${var.environment}-elb_sg"
  }
}