# APPLICATION LOAD BALANCER
resource "aws_lb" "Final-proj-LB" {
  name               = "Application-LB"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Final-proj-SG.id]
  subnets            = [aws_subnet.Final-proj-Pub-Sub.id, aws_subnet.Final-proj-Pub-Sub-2.id]
}


# TARGET GROUP
resource "aws_lb_target_group" "Final-proj-LB-TG" {
  name        = "Final-proj-LB-TG"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.Final-proj-vpc.id


  health_check {
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}


# LISTENERS
resource "aws_lb_listener" "ALB-Listener" {
  load_balancer_arn = aws_lb.Final-proj-LB.arn
  port              = "80"
  protocol          = "HTTP"



  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Final-proj-LB-TG.arn
  }
}