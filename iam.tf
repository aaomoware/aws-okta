module "iam_role" {
  source = "git@github.com:aaomoware/terraform-modules.git//aws/iam/iam_role"

  name               = "${local.iam_role["names"]}"
  description        = "${local.iam_description["descriptions"]}"
  assume_role_policy = "${local.iam_assume_role_policy["policies"]}"
}

module "iam_role_policy_attachment" {
  source = "git@github.com:aaomoware/terraform-modules.git//aws/iam/iam_role_policy_attachment"

  role       = "${module.iam_role.name}"
  policy_arn = "${local.iam_policy_arn["arns"]}"
}
