# output "cluster_name" {
#   value = "${var.cluster_name}"
# }

output "vpc_id" {
  value = "${aws_vpc.lab-vpc-local.id}"
}

output "vpc_cidr_block" {
  value = "${aws_vpc.lab-vpc-local.cidr_block}"
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-lab-local.id}"]
}

output "node_security_group_ids" { 
  value = "${aws_security_group.nodes-lab-local.id}" 
}

# output "node_subnet_ids" {
#   value = ["${aws_subnet.labdev01-k8s-local.id}", "${aws_subnet.labdev02-k8s-local.id}"]
# }

output "route_table_private001_id" {
  value = "${aws_route_table.private001-lab-rt-local}"
}

output "route_table_private002_id" {
  value = "${aws_route_table.private002-lab-rt-local.id}"
}

output "route_table_public_id" {
  value = "${aws_route_table.lab-rt-local.id}"
}

output "subnet_01_id" {
  value = "${aws_subnet.private-subnet01-local.id}"
}

output "subnet_02_id" {
  value = "${aws_subnet.private-subnet02-local.id}"
}

output "subnet_utility-01_id" {
  value = "${aws_subnet.utility-subnet01-local.id}"
}

output "subnet_utility-02_id" {
  value = "${aws_subnet.utility-subnet02-local.id}"
}
