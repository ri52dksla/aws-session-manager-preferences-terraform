# aws-session-manager-preference-terraform

- Terraform module which creates Session Manager preferences  
- https://docs.aws.amazon.com/systems-manager/latest/userguide/getting-started-configure-preferences-cli.html

## Description

## Usage

```terraform
module "session-manager-preferences" {
  source                        = "/path/to/module"
  ssm_document_name             = "SSM-SessionManagerRunShell"
  s3_bucket_name                = "example-bucket-name"
  s3_encryption_enabled         = "true"
  cloudwatch_log_group_name     = "example-cloudwatch-log-group-name"
  cloudwatch_encryption_enabled = "true"
}
```