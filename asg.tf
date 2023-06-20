#Launch Template Reference 
resource "aws_launch_template" "main-lt" {
  name_prefix   = "main-lt"
  image_id      = var.ami   # AMI ID from Packer Build
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.mysg.id]
  #user_data = filebase64("./user-data.sh")
  #key_name = "us-east-2"
}

# AWS Auto Scaling to include Launch Template Only
resource "aws_autoscaling_group" "asg-tf" {
  name                 = "asg-tf"
  desired_capacity   = 2
  max_size           = 5
  min_size           = 1
  vpc_zone_identifier = [aws_subnet.zonea-public-subnet.id,aws_subnet.zoneb-public-subnet.id]

  launch_template {
    id      = aws_launch_template.main-lt.id
    version = "$Latest"
  }

}

# Load Balancer for Auto Scaling Group
resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.asg-tf.id
  lb_target_group_arn = aws_lb_target_group.myasgtg.arn
}