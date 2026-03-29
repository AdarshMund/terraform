output "rds_endpoint" {
  description = "The connection endpoint of the RDS instance"
  value       = aws_db_instance.myrds.endpoint
}

output "rds_port" {
  description = "The port RDS is listening on"
  value       = aws_db_instance.myrds.port
}

output "rds_instance_id" {
  description = "The ID of the RDS instance"
  value       = aws_db_instance.myrds.id
}

output "rds_public_ip" {
  description = "Public IP of the RDS instance (if publicly accessible)"
  value       = aws_db_instance.myrds.address
}

output "rds_arn" {
  description = "ARN of the RDS instance"
  value       = aws_db_instance.myrds.arn
}
