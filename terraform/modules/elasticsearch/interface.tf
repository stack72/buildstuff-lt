variable "name" {
  type        = "string"
  description = "Name of the ElasticSearch domain to create"
}

variable "version" {
  type        = "string"
  default     = "2.3"
  description = "Version of ElasticSearch to deploy. Allowed values are 1.5 or 2.3. Defaults to 2.3"
}

variable "data_node_instance_count" {
  type        = "string"
  default     = "2"
  description = "The number of data nodes in the ElasticSearch cluster"
}

variable "data_node_instance_type" {
  type        = "string"
  default     = "m3.medium.elasticsearch"
  description = "The size of the data node instances in the cluster"
}

variable "zone_awareness_enabled" {
  type        = "string"
  default     = "true"
  description = "Load balances your cluster across Availability Zones to increase availability"
}

variable "ebs_enabled" {
  type        = "string"
  default     = "false"
  description = "Do you need to store your data on EBS volumes?"
}

variable "ebs_volume_size" {
  type        = "string"
  default     = "10"
  description = "Size of the EBS volume to create"
}

variable "ebs_volume_type" {
  type        = "string"
  default     = "gp2"
  description = "The type of EBS volume to provision"
}

variable "description" {
  type        = "string"
  description = "Short description of the ElasticSearch Domain"
}

variable "snapshot_start_hour" {
  type        = "string"
  default     = "02"
  description = "Hour during which the service takes an automated daily snapshot of the indices"
}

variable "access_policies" {
  type        = "string"
  description = "The access policy in which to attach to the ElasticSearch domain"
}

output "arn" {
  value = "${aws_elasticsearch_domain.default.arn}"
}

output "domain_id" {
  value = "${aws_elasticsearch_domain.default.domain_id}"
}

output "endpoint" {
  value = "${aws_elasticsearch_domain.default.endpoint}"
}

output "kibana" {
  value = "${aws_elasticsearch_domain.default.endpoint}/_plugin/kibana"
}
