variable "region" {
  type = string
}

variable "project" {
  type = string
}

variable "environment" {
  type = string
}

# VPC
variable "vpc_cidr" {
  type = string
}

# SUBNET
variable "subnet1_cidr" {
  type = string
}

variable "subnet2_cidr" {
  type = string
}

variable "az1" {
  type = string
}

variable "az2" {
  type = string
}

# ROUTE
variable "route_cidr" {
  type = string
}

# SECURITY GROUP
variable "http_port" {
  type = number
}

variable "ssh_port" {
  type = number
}

variable "allowed_http_cidr" {
  type = list(string)
}

variable "allowed_ssh_cidr" {
  type = list(string)
}

variable "allowed_all_cidr" {
  type = list(string)
}

# EC2
variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "userdata1" {
  type = string
}

variable "userdata2" {
  type = string
}

# ALB
variable "tg_name" {
  type = string
}
