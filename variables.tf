variable "ssm_document_name" {
  type        = "string"
  default     = "SSM-SessionManagerRunShell"
  description = "The name of System Manager Document"
}

variable "s3_bucket_name" {
  type        = "string"
  description = "The name of S3 Bucket in which Session Manager sends session log data"
}

variable "s3_key_prefix" {
  type        = "string"
  default     = ""
  description = "The name of prefix that"
}

variable "s3_encryption_enabled" {
  type        = "string"
  description = "Enable this make Session Manager send session log data to S3 Bucket with encryption. The value should be either 'true' or 'false'"
}

variable "cloudwatch_log_group_name" {
  type        = "string"
  description = "The name of CloudWatch Log Group in which Session Manager sends session log data"
}

variable "cloudwatch_encryption_enabled" {
  type        = "string"
  description = "Enable this make Session Manager send session log data to CloudWatch Log Group with encryption. The value should be either 'true' or 'false'"
}

variable "tags" {
  default     = {}
  type        = "map"
  description = "A mapping of tags to assign to all resources."
}
