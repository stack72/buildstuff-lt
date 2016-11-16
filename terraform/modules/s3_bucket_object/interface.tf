variable "source_content" {
  type        = "string"
  description = "The source to upload to the bucket"
}

variable "key" {
  type        = "string"
  description = "The name of the object when it's in the bucket"
}

variable "bucket" {
  type        = "string"
  description = "The name of the bucket to store the object in"
}

output "id" {
  value = "${aws_s3_bucket_object.default.id}"
}
