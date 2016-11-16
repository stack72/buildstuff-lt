variable "batch_size" {
  type        = "string"
  default     = "100"
  description = "The largest number of records that Lambda will retrieve from your event source at the time of invocation"
}

variable "enabled" {
  type        = "string"
  default     = "true"
  description = "Whether or not the Kinesis connector is Enabled"
}

variable "kinesis_stream_arn" {
  type        = "string"
  description = "ARN of the kinesis stream to connect to"
}

variable "lambda_fuction_arn" {
  type        = "string"
  description = "ARN of the lambda function subscribing to events"
}

variable "starting_position" {
  type        = "string"
  default     = "TRIM_HORIZON"
  description = "The position in the stream where AWS Lambda should start reading."
}
