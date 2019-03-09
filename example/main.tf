resource "random_string" "bucket-name-suffix" {
  length  = 20
  special = false
  upper  = false
  lower = true
}

resource "aws_s3_bucket" "s3-bucket" {
  bucket        = "aws-session-manager-preference-terraform.${random_string.bucket-name-suffix.result}"
  acl           = "private"
  force_destroy = true

  tags = {
    Name      = "aws-session-manager-preference-terraform.${random_string.bucket-name-suffix.result}"
    Terraform = "true"
  }
}

resource "aws_cloudwatch_log_group" "session-manager-cloudwatch-log-group" {
  name = "/session_manager/aws-session-manager-preference-terraform"

  tags {
    Name      = "/session_manager/aws-session-manager-preference-terraform"
    Terraform = "true"
  }
}

module "ssm" {
  source                        = "../"
  ssm_document_name             = "SSM-SessionManagerRunShell"
  s3_bucket_name                = "${aws_s3_bucket.s3-bucket.id}"
  s3_encryption_enabled         = "true"
  cloudwatch_log_group_name     = "${aws_cloudwatch_log_group.session-manager-cloudwatch-log-group.name}"
  cloudwatch_encryption_enabled = "true"
}
