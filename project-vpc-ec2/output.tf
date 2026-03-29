# vpc
output "vpc_id" {
description = "VPC_ID"
value = aws_vpc.myvpc.id
}

# INSTANCE INFO

output "instance_ids" {

  description = "INSTANCE IDS"
  value = [aws_instance.webserver1.id,aws_instance.webserver2.id]

}

# LOAD BALANCER

output "alb_dns_name" {

  description = "ALB DNS NAME"
  value = aws_lb.myalb.dns_name

}
