resource "aws_elasticsearch_domain" "default" {
  domain_name           = "${var.name}"
  elasticsearch_version = "${var.version}"

  access_policies = "${var.access_policies}"

  ebs_options {
    ebs_enabled = "${var.ebs_enabled}"
  }

  cluster_config {
    instance_count         = "${var.data_node_instance_count}"
    instance_type          = "${var.data_node_instance_type}"
    zone_awareness_enabled = "${var.zone_awareness_enabled}"
  }

  snapshot_options {
    automated_snapshot_start_hour = "${var.snapshot_start_hour}"
  }

  tags {
    Name = "${var.description}"
  }
}
