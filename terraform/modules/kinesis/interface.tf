variable "stream_name" {
  type        = "string"
  description = "Name of the Stream to create"
}

variable "shard_count" {
  type        = "string"
  description = "The number of shards that the stream will use. The throughput of the stream is a function of the number of shards; more shards are required for greater provisioned throughput."
}

variable "retention_period" {
  type        = "string"
  default     = "24"
  description = "Length of time data records are accessible after they are added to the stream"
}

variable "stream_description" {
  type        = "string"
  description = "Short description of what the stream does"
}

output "arn" {
  value = "${aws_kinesis_stream.default.arn}"
}
