resource "aws_s3_bucket_object" "default" {
  bucket = "${var.bucket}"
  key    = "${var.key}"
  source = "${var.source_content}"
}
