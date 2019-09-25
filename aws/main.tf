provider "aws" {
  region     = "${var.region}"
  version    = "~> 2.0"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}

# terraform {
#   backend "s3" {
#     encrypt = "true"
#     bucket  = "terraform-tfstate"
#     region  = "sa-east-1"
#     key     = "terraformtfstate"
#   }
# }

