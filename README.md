# AWS application load balancer Terraform module

Terraform module which creates an domains and smtp credentials on AWS SES.

## Terraform versions

Terraform 0.12 and newer. 

## Usage

```hcl
module "ses" {
  source                    = "/path/to/module/terraform-aws-ses"
  domain_name               = var.domain_name
  enable_smtp_user_name     = true
  smtp_user_name            = var.smtp_user_name
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.65 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.65 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.ses_sender](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.ses_sender](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.ses_sender](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.ses_sender](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_ses_domain_dkim.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_dkim) | resource |
| [aws_ses_domain_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity) | resource |
| [aws_iam_policy_document.ses_sender](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | A domain name that should be issued | `string` | n/a | yes |
| <a name="input_enable_smtp_user_name"></a> [enable\_smtp\_user\_name](#input\_enable\_smtp\_user\_name) | If true, then create SMTP user in IAM | `bool` | `false` | no |
| <a name="input_smtp_user_name"></a> [smtp\_user\_name](#input\_smtp\_user\_name) | SMTP user name | `string` | `"ses-smtp-user"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_smtp_password"></a> [smtp\_password](#output\_smtp\_password) | n/a |
| <a name="output_smtp_username"></a> [smtp\_username](#output\_smtp\_username) | n/a |

## Authors

Module managed by [Marcel Emmert](https://github.com/echomike80).

## License

Apache 2 Licensed. See LICENSE for full details.
