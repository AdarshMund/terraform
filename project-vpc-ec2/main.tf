locals  {

  project = var.project
  env = var.environment

  common_tags = {
  
    Project = local.project
    Env = local.env

  }

}

# Creating VPC
resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name ="${local.project}-vpc"
  }
}

#Creating Subnets
resource "aws_subnet" "subnet1" {

  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.subnet1_cidr
  availability_zone = var.az1
  map_public_ip_on_launch = true
  tags = {

    Name = "${local.project}-${local.env}-subnet1"
  }
}
resource "aws_subnet" "subnet2" {

  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.subnet2_cidr
  availability_zone = var.az2
  map_public_ip_on_launch = true
  tags = {

    Name = "${local.project}-${local.env}-subnet2"
  }

}

# Creating Internet Gateway

resource "aws_internet_gateway" "Igw" {

  vpc_id = aws_vpc.myvpc.id
  tags = local.common_tags

}
# Creating Route Tables
resource "aws_route_table" "RT" {

  vpc_id = aws_vpc.myvpc.id
  route {

    cidr_block = var.route_cidr
    gateway_id = aws_internet_gateway.Igw.id
  }
  tags = local.common_tags

}
# Creating Subnet Association
resource "aws_route_table_association" "rta1" {

  subnet_id = aws_subnet.subnet1.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_route_table_association" "rta2" {

  subnet_id = aws_subnet.subnet2.id
  route_table_id = aws_route_table.RT.id
}
#Creating Security Groups

resource "aws_security_group" "websg" {

  name = "${local.project}-${local.env}-web-sg"
  vpc_id = aws_vpc.myvpc.id

  ingress {

    description = "HTTP"
    from_port = var.http_port
    to_port = var.http_port
    protocol = "tcp"
    cidr_blocks = var.allowed_http_cidr
  }

  ingress  {

    description = "SSH"
    from_port = var.ssh_port
    to_port = var.ssh_port
    protocol = "tcp"
    cidr_blocks = var.allowed_ssh_cidr

  }

  egress {

    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = var.allowed_all_cidr
  }
  tags = local.common_tags

# Creating Ec2-instance with the VPC  

resource "aws_instance" "webserver1" {

  ami = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.websg.id]
  user_data = file(var.userdata1)

  tags = {

    Name = "${local.project}-${local.env}-webserver-1"
  }
}

resource "aws_instance" "webserver2" {

  ami = var.ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet2.id
  vpc_security_group_ids = [aws_security_group.websg.id]
  user_data = file(var.userdata2)

  tags = {

    Name = "${local.project}-${local.env}-webserver-2"

  }

}

# create ALB

resource "aws_lb" "myalb" {
  name               = "${local.project}-${local.env}-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.websg.id]
  subnets         = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

  tags = local.common_tags
}

#  Target-Group 

resource "aws_lb_target_group" "tg" {
  name     = var.tg_name
  port     = var.http_port
  protocol = "HTTP"
  vpc_id   = aws_vpc.myvpc.id

  health_check {

    path = "/"
  }

  tags = local.common_tags

}

# Target group Attachment
resource "aws_lb_target_group_attachment" "tga1" {

  target_group_arn = aws_lb_target_group.tg.arn
  target_id = aws_instance.webserver1.id
  port = var.http_port

}

resource "aws_lb_target_group_attachment" "tga2"  {

  target_group_arn = aws_lb_target_group.tg.arn
  target_id = aws_instance.webserver2.id
  port = var.http_port

}

# ADDING LISTENERS

resource "aws_lb_listener" "listener" {

  load_balancer_arn = aws_lb.myalb.arn
  port = var.http_port
  protocol = "HTTP"

  default_action {

    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn

  }

}
