variable "bucket" {
  type        = "string"
  description = "The name of the bucket where the lambda code is kept"
}

variable "bucket_key" {
  type        = "string"
  description = "The name of the key for the Lambda function"
}

variable "function_name" {
  type        = "string"
  description = "The name to assign to the lambda function"
}

variable "handler" {
  type        = "string"
  description = "The entry point to the lambda function"
}

variable "timeout" {
  type        = "string"
  description = "The length of time the lambda has to run (in seconds)"
  default     = "3"
}

variable "account_id" {
  type = "string"
}

output "arn" {
  value = "${aws_lambda_function.lambda_function.arn}"
}
