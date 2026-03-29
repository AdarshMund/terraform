region = "ap-south-1"
db_instance_class = "db.t3.micro"
db_name = "mydatabase"
db_engine = "postgres"
db_engine_version = "17.9"
db_engine_pggroup = "17"
db_username = "adarsh"
db_password = "root123456"
allocated_storage = 20
vpc_id = "vpc-0fc46d0158bc1b6b0"
subnet_ids = ["subnet-0d0430c71b2128219","subnet-0da031872baf8d25f"]
db_backup_retention_period = 1
db_backup_window = "03:00-04:00"
db_maintenance_window = "sun:05:00-sun:06:00"
project_name   = "project-rds"
environment    = "prod"
db_port        = 5432
db_protocol    = "tcp"
db_cidr_blocks = ["0.0.0.0/0"]  


