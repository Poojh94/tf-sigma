#Creates a Application Load Balancer
resource "aws_lb" "alb-tf" {
  name               = "alb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.mysg.id]
  subnets            = [aws_subnet.zonea-public-subnet.id,aws_subnet.zoneb-public-subnet.id]
  
  tags = {
    Name = "alb-tf"
  }
}

# Create a Target Group for the above requested ALB
resource "aws_lb_target_group" "myasgtg" {
  name     = "myasgtg"
  port     = 8080
  protocol = "HTTP"
  vpc_id     = aws_vpc.main-vpc.id
}

# Port 80(default Listerner) for Application Load Balancer
# Default Routing(Forward) to AWS ALB Target Group Ref

resource "aws_lb_listener" "alb-listerner" {
  load_balancer_arn = aws_lb.alb-tf.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.myasgtg.arn
  }
}



#resource "aws_lb_target_group_attachment" "test" {
  #target_group_arn = aws_lb_target_group.myasgtg.arn
  #target_id = aws_autoscaling_attachment.asg_attachment_bar.id
  #port             = 80
#}







