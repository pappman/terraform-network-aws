# output "cluster_name" {
#   value = "labdev.k8s.local"
# }

output "master_security_group_ids" {
  value = "${module.networking.master_security_group_ids}"
}

output "node_security_group_ids" {
  value = "${module.networking.node_security_group_ids}"
}

output "node_subnet_ids" {
  value = ["${module.networking.subnet_utility-01_id}", "${module.networking.subnet_utility-02_id}"]
}

output "route_table_private001_id" {
  value = "${module.networking.route_table_private001_id}"
}

output "route_table_private002_id" {
  value = "${module.networking.route_table_private002_id}"
}

output "route_table_public_id" {
  value = "${module.networking.route_table_public_id}"
}

output "subnet_01_id" {
  value = "${module.networking.subnet_01_id}"
}

output "subnet_02_id" {
  value = "${module.networking.subnet_02_id}"
}

output "subnet_utility-01_id" {
  value = "${module.networking.subnet_utility-01_id}"
}

output "subnet_utility-02_id" {
  value = "${module.networking.subnet_utility-02_id}"
}

output "vpc_cidr_block" {
  value = "${module.networking.vpc_cidr_block}"
}

output "vpc_id" {
  value = "${module.networking.vpc_id}"
}
