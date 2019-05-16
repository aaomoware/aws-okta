terraform {
  required_version = "> v0.9.0"
}

provider "aws" {
  region  = "${var.region}"
  profile = "${var.profile}"
}
