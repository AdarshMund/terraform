region = "ap-south-1"

project     = "adarsh"
environment = "prod"

# VPC
vpc_cidr = "192.168.0.0/16"

# SUBNETS
subnet1_cidr = "192.168.1.0/24"
subnet2_cidr = "192.168.2.0/24"

az1 = "ap-south-1a"
az2 = "ap-south-1b"

route_cidr = "0.0.0.0/0"

# SECURITY GROUP
http_port = 80
ssh_port  = 22

allowed_http_cidr = ["0.0.0.0/0"]
allowed_ssh_cidr  = ["0.0.0.0/0"]
allowed_all_cidr  = ["0.0.0.0/0"]

# EC2
ami           = "ami-0931307dcdc2a28c9"
instance_type = "t3.micro"

userdata1 = "userdata.sh"
userdata2 = "userdata1.sh"

# ALB
tg_name = "adarsh-tg"
