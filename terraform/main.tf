variable "region" {
  default = "us-west-2"
}

variable "account_id" {
  default = ""
}

provider "aws" {
  region = "${var.region}"
}

variable "es_domain_name" {
  default = "buildstuff-2016"
}

data "aws_iam_policy_document" "elasicsearch" {
  statement {
    sid = "1"

    actions = [
      "es:*",
    ]

    resources = [
      "arn:aws:es:${var.region}:${var.account_id}:domain/${var.es_domain_name}/*",
    ]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

module "elasticsearch" {
  source = "./modules/elasticsearch"

  name                     = "${var.es_domain_name}"
  data_node_instance_count = "1"
  zone_awareness_enabled   = "false"
  version                  = "2.3"

  access_policies = "${data.aws_iam_policy_document.elasicsearch.json}"

  description = "Build Stuff 2016 ElasticSearch Cluster"
}

output "kibana" {
  value = "https://${module.elasticsearch.kibana}"
}

module "logs_stream" {
  source = "./modules/kinesis"

  stream_name        = "logs_stream"
  retention_period   = "168"
  stream_description = "Logging Stream"

  shard_count = "5"
}

module "lambda_bucket" {
  source = "./modules/s3_bucket"

  bucket_name = "buildstuff-2016-lambda-bucket"
}

data "template_file" "lambda_function" {
  template = "${file("./files/kinesis_to_es.js.tpl")}"

  vars {
    region                 = "${var.region}"
    elasticsearch_endpoint = "${module.elasticsearch.endpoint}"
    index_name             = "logs"
  }
}

resource "archive_file" "lambda" {
  type                    = "zip"
  source_content          = "${data.template_file.lambda_function.rendered}"
  source_content_filename = "kinesis_lambda_es.js"
  output_path             = "lambda.zip"
}

module "lambda_source" {
  source = "./modules/s3_bucket_object"

  bucket         = "${module.lambda_bucket.id}"
  key            = "${archive_file.lambda.output_path}"
  source_content = "${archive_file.lambda.output_path}"
}

module "kinesis_es_lambda" {
  source = "./modules/lambda"

  bucket        = "${module.lambda_bucket.id}"
  bucket_key    = "${module.lambda_source.id}"
  function_name = "kinesis_es_lambda"
  handler       = "kinesis_lambda_es.handler"
  timeout       = "10"
  account_id    = "${var.account_id}"
}

module "kinesis_lambda_connector" {
  source = "./modules/kinesis_connector"

  kinesis_stream_arn = "${module.logs_stream.arn}"
  lambda_fuction_arn = "${module.kinesis_es_lambda.arn}"
}
