terraform {
  backend "s3" {
    bucket         = "adarsh-terraform-vpc-bktt1122"
    key            = "adarsh/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
