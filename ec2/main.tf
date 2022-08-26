data "aws_ami" "linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20220426.0-x86_64-*"]
  }
  
  resource "aws_instance" "KP21_private" {
     #2
    instance_type = var.instance_type #t2.micro
    ami = data.aws_ami.server_ami.id
    tags = {
        Name = "KP21_private"
    }
}

resource "aws_instance" "KP21_bastion" { #2
    instance_type = var.instance_type #t2.micro
    ami = data.aws_ami.server_ami.id
    tags = {
        Name = "KP21_bastion"
    }

  owners = ["amazon"]
}

resource "aws_launch_template" "KP21_bastion" {
  name_prefix            = "KP21_bastion"
  image_id               = data.aws_ami.linux.id
  instance_type          = var.bastion_instance_type
  vpc_security_group_ids = [var.public_sg]
  key_name               = var.key_name

  tags = {
    Name = "KP21_bastion"
  }
}

resource "aws_autoscaling_group" "KP21_bastion" {
  name                = "KP21_bastion"
  vpc_zone_identifier = tolist(var.public_subnet)
  min_size            = 1
  max_size            = 1
  desired_capacity    = 1

  launch_template {
    id      = aws_launch_template.KP21_bastion.id
    version = "$Latest"
  }
}

resource "aws_launch_template" "KP21_database" {
  name_prefix            = "KP21_database"
  image_id               = data.aws_ami.linux.id
  instance_type          = var.database_instance_type
  vpc_security_group_ids = [var.private_sg]
  key_name               = var.key_name
  user_data              = filebase64("install_apache.sh")

  tags = {
    Name = "KP21_database"
  }
}

resource "aws_autoscaling_group" "KP21_database" {
  name                = "KP21_database"
  vpc_zone_identifier = tolist(var.public_subnet)
  min_size            = 2
  max_size            = 3
  desired_capacity    = 2

  launch_template {
    id      = aws_launch_template.KP21_database.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.KP21_database.id
  # elb                    = var.elb
  alb_target_group_arn = var.alb_tg
}