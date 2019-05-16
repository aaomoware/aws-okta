## AWS-Okta

Integration for SSO and 2FA.

### To Run
```hcl
git clone git@github.com:aaomoware/aws-okta.git ; cd aws-okta
terraform init -upgrade=true
terraform plan -var region=eu-west-1 -var profile=aws-okta
terraform apply -var region=eu-west-1 -var profile=aws=okta
```
