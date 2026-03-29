locals {

  sg_name = "${var.project_name}-${var.environment}-rds-sg"
  subnet_group_name = "${var.project_name}-${var.environment}-rds-subnet-group"
  rds_name = "${var.project_name}-${var.environment}-rds"


}
# Security Group For RDS

resource "aws_security_group" "rds_sg" {

  name = local.sg_name
  description = "RDS Security Group"
  ingress {

    from_port = var.db_port
    to_port = var.db_port
    protocol = var.db_protocol
    cidr_blocks = var.db_cidr_blocks

  }

  egress {

    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = var.db_cidr_blocks

  }
  tags = {

    Name = local.sg_name
  }
}

# Subnet Group For RDS

resource "aws_db_subnet_group" "rds_subnet_group" {

  name = local.subnet_group_name
  subnet_ids = var.subnet_ids

  tags = {

    Name = local.subnet_group_name
  }

}

# RDS Instance Creation

resource "aws_db_instance" "myrds" {

  allocated_storage = var.allocated_storage
  engine = var.db_engine
  engine_version = var.db_engine_version
  instance_class = var.db_instance_class
  db_name = var.db_name
  username = var.db_username
  password = var.db_password
  parameter_group_name = "default.${var.db_engine}${var.db_engine_pggroup}"
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  backup_retention_period = var.db_backup_retention_period
  backup_window = var.db_backup_window
  maintenance_window = var.db_maintenance_window

  publicly_accessible = false

  skip_final_snapshot = true

  tags = {

    Name = local.rds_name
  }

}
