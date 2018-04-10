terraform {
  required_version = "> v0.9.0"
}

provider "aws" {
  region                  = "eu-central-1"
  profile                 = "aws-okta"
  shared_credentials_file = "~/.aws/credentials"
}
