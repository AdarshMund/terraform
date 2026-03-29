terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bktt1122"  
    key            = "rds/terraform.tfstate"      
    region         = "ap-south-1"                 
    dynamodb_table = "terraform-lock-table"       
    encrypt        = true
  }
}
