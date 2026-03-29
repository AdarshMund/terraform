variable "region" {
description = "region to deploy"
type = string
}

variable "db_instance_class" {

  description = "db_instance_type"
  type = string
}

variable "db_name" {

  description = "Database Name"
  type = string
}

variable "db_engine" {

  description = "Database Engine"
  type = string 
}

variable "db_engine_version" {

  description = "Database_engine_version"
  type = string
}

variable "db_engine_pggroup"  {

  description = "Parameter group version suffix"
  type = string

}

variable "db_username"  {

  description = "Database username"
  type = string
}

variable "db_password" {

  description = "Database password"
  type = string
}

variable "allocated_storage" {

  description = "Storage in GB"
  type = number
}

variable "vpc_id" {

  description = "VPC ID"
  type = string
}

variable "subnet_ids" {

  description = "List of subnet IDs"
  type = list(string)
}

variable "db_backup_retention_period"  {

  description = "Backup retention days"
  type = number
}

variable "db_backup_window"  {

  description = "daily backup window"
  type = string

}

variable "db_maintenance_window"  {

  description = "Weekly maintenance window"
  type = string
}

variable "db_port" {
  description = "Port for the database"
  type        = number
}

variable "db_protocol" {
  description = "Protocol for DB access"
  type        = string
}

variable "db_cidr_blocks" {
  description = "CIDR blocks allowed to access DB"
  type        = list(string)
}

variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "environment" {
  description = "Environment (dev/staging/prod)"
  type        = string
}
