resource "aws_lambda_event_source_mapping" "default" {
  batch_size        = "${var.batch_size}"
  event_source_arn  = "${var.kinesis_stream_arn}"
  enabled           = "${var.enabled}"
  function_name     = "${var.lambda_fuction_arn}"
  starting_position = "${var.starting_position}"
}
