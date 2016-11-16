resource "aws_s3_bucket" "default" {
  bucket        = "${var.bucket_name}"
  acl           = "${var.acl}"
  force_destroy = "${var.force_destroy}"

  versioning {
    enabled = "${var.versioning_enabled}"
  }
}
