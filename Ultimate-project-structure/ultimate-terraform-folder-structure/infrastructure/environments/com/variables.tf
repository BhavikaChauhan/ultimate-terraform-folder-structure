variable "aws_account_id" {
  type = string
  default     = "676206927618"
  description = "The identifier of an AWS account"
}

variable "aws_default_region" {
  type        = string
  default     = "us-east-1"
  description = "Default AWS region"
}

variable "allowed_aws_account_ids" {
  type        = list(string)
  default     = ["676206927618", "676206927618"]
  description = "The identifiers of an AWS accounts which have an access to the notifier"
}
