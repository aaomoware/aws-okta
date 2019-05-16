locals {
  assumerolepolicy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::${data.aws_caller_identity.account.account_id}:saml-provider/okta"
      },
      "Action": "sts:AssumeRoleWithSAML",
      "Condition": {
        "StringEquals": {
          "SAML:aud": "https://signin.aws.amazon.com/saml"
        }
      }
    }
  ]
}
EOF
}

locals {
  okta_user_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
          "Effect": "Allow",
          "Action": [
              "iam:ListRoles",
              "iam:ListAccountAliases"
          ],
          "Resource": "*"
        }
    ]
}
EOF

  iam_role {
    "names" = [
      "Administrator",
      "ReadOnlyAccess",
      "EC2FullAccess",
      "S3FullAccess",
      "Route53FullAccess",
      "Route53ReadOnlyAccess",
    ]
  }

  iam_description {
    descriptions {
      Administrator         = "${data.aws_iam_policy.AdministratorAccess.description}"
      ReadOnlyAccess        = "${data.aws_iam_policy.ReadOnlyAccess.description}"
      S3FullAccess          = "${data.aws_iam_policy.AmazonS3FullAccess.description}"
      EC2FullAccess         = "${data.aws_iam_policy.AmazonEC2FullAccess.description}"
      Route53FullAccess     = "${data.aws_iam_policy.AmazonRoute53FullAccess.description}"
      Route53ReadOnlyAccess = "${data.aws_iam_policy.AmazonRoute53ReadOnlyAccess.description}"
    }
  }

  iam_policy_arn {
    arns {
      Administrator         = "${data.aws_iam_policy.AdministratorAccess.arn}"
      ReadOnlyAccess        = "${data.aws_iam_policy.ReadOnlyAccess.arn}"
      S3FullAccess          = "${data.aws_iam_policy.AmazonS3FullAccess.arn}"
      EC2FullAccess         = "${data.aws_iam_policy.AmazonEC2FullAccess.arn}"
      Route53FullAccess     = "${data.aws_iam_policy.AmazonRoute53FullAccess.arn}"
      Route53ReadOnlyAccess = "${data.aws_iam_policy.AmazonRoute53ReadOnlyAccess.arn}"
    }
  }

  iam_assume_role_policy {
    policies {
      Administrator         = "${local.assumerolepolicy}"
      ReadOnlyAccess        = "${local.assumerolepolicy}"
      S3FullAccess          = "${local.assumerolepolicy}"
      EC2FullAccess         = "${local.assumerolepolicy}"
      Route53FullAccess     = "${local.assumerolepolicy}"
      Route53ReadOnlyAccess = "${local.assumerolepolicy}"
    }
  }
}
