module "idp_provider" {
  source = "git@github.com:aaomoware/terraform-modules.git//aws/iam/iam_saml_provider"

  name                   = "${var.provider_name}"
  saml_metadata_document = "${file("metadata/saml-metadata.xml")}"
}

module "iam_user" {
  source = "git@github.com:aaomoware/terraform-modules.git//aws/iam/iam_user"

  name = "${var.okta_user}"
}

module "iam_user_policy" {
  source = "git@github.com:aaomoware/terraform-modules.git//aws/iam/iam_user_policy"

  name   = "${var.okta_user}-policy"
  user   = "${module.iam_user.name}"
  policy = "${local.okta_user_policy}"
}
