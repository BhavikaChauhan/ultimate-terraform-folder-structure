terraform {
  backend "s3" {
    dynamodb_table = "terraform-lock-table"
    bucket         = "terraform-tfstate-bucket-bkt"
    encrypt        = true
    key            = "infrastructure/environments/pro/ultimate-terraform-folder-strucutre/db.tfstate"
    region         = "us-east-1"
    
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.5.0"
    }
  }
}

provider "aws" {
  allowed_account_ids = [var.aws_account_id]
  region              = var.aws_default_region


  default_tags {
    tags = {
      terraform  = true
      repository = "ultimate-terraform-folder-strucutre"
    }
  }
}
