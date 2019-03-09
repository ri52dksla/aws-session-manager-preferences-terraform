# Create Session Manager Preferences
# https://docs.aws.amazon.com/systems-manager/latest/userguide/getting-started-create-preferences-cli.html

# S3 Bucket
# https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-logging-auditing.html#session-manager-logging-auditing-s3

# CloudWatch Logs
# https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-logging-auditing.html#session-manager-logging-auditing-cloudwatch-logs
resource "aws_ssm_document" "session-manager-preferences" {
  name            = "${var.ssm_document_name}"
  document_type   = "Session"
  document_format = "JSON"
  content         = "${data.template_file.session-manager-run-shell.rendered}"

  tags = "${merge(map("Name", var.ssm_document_name), var.tags)}"
}

data "template_file" "session-manager-run-shell" {
  template = "${file("${path.module}/SessionManagerRunShell.json")}"

  vars {
    s3_bucket_name                = "${var.s3_bucket_name}"
    s3_key_prefix                 = "${var.s3_key_prefix}"
    s3_encryption_enabled         = "${var.s3_encryption_enabled}"
    cloudwatch_log_group_name     = "${var.cloudwatch_log_group_name}"
    cloudwatch_encryption_enabled = "${var.cloudwatch_encryption_enabled}"
  }
}
