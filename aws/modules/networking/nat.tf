resource "aws_nat_gateway" "lab-nat01-local" {
  allocation_id = "${aws_eip.lab-eip01-local.id}"
  subnet_id     = "${aws_subnet.utility-subnet01-local.id}"

  tags = {
    Name                                     = "nat01-${var.zone-01}.${var.vpc-name}"
    # KubernetesCluster                        = "${var.cluster_name}"
    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_nat_gateway" "lab-nat02-local" {
  allocation_id = "${aws_eip.lab-eip02-local.id}"
  subnet_id     = "${aws_subnet.utility-subnet02-local.id}"

  tags = {
    Name                                     = "nat02-${var.zone-02}.${var.vpc-name}"
    # KubernetesCluster                        = "${var.cluster_name}"
    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}
