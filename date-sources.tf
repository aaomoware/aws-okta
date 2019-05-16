data "aws_caller_identity" "account" {}

data "aws_iam_policy" "ReadOnlyAccess" {
  arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

data "aws_iam_policy" "AmazonS3FullAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

data "aws_iam_policy" "AdministratorAccess" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

data "aws_iam_policy" "AmazonEC2FullAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

data "aws_iam_policy" "AmazonRoute53FullAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
}

data "aws_iam_policy" "AmazonRoute53ReadOnlyAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonRoute53ReadOnlyAccess"
}
