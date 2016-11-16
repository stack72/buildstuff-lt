variable "bucket_name" {
  type        = "string"
  description = "Name for the S3 bucket"
}

variable "force_destroy" {
  type        = "string"
  description = "Indicates whether to destroy all objects in the bucket before deleting the bucket"
  default     = "true"
}

variable "versioning_enabled" {
  type        = "string"
  description = "Indicates whether to enable bucket versioning"
  default     = "true"
}

variable "acl" {
  type        = "string"
  description = "Indicates the ACL type"
  default     = "private"
}

output "id" {
  value = "${aws_s3_bucket.default.id}"
}
