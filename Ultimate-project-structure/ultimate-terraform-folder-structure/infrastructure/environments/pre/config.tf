terraform {
  backend "s3" {
    bucket         = "terraform-tfstate-bucket-bkt"  # Your S3 bucket for Terraform state
    key            = "pre/config.tfstate"            # State file path (can rename if desired)
    region         = "us-east-1"                     # AWS region
    dynamodb_table = "terraform-lock-table"          # DynamoDB table for state locking
  }
} 

provider "aws" {
  allowed_account_ids = [var.aws_account_id]
  region              = var.aws_default_region

 assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id}:role/TerraformAdminRole"
  }
  
  default_tags {
    tags = {
      terraform  = true
      repository = "ultimate-terraform-folder-strucutre"
    }
  }
}
