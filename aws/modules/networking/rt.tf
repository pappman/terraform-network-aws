resource "aws_route_table" "lab-rt-local" {
  vpc_id = "${aws_vpc.lab-vpc-local.id}"

  tags = {
    Name                                     = "rt-pub-${var.vpc-name}"
    # KubernetesCluster                        = "${var.cluster_name}"
    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    # "kubernetes.io/kops/role"                = "public"
  }
}

resource "aws_route_table" "private001-lab-rt-local" {
  vpc_id = "${aws_vpc.lab-vpc-local.id}"

  tags = {
    Name                                     = "rt-private-${var.zone-01}.${var.vpc-name}"
    # KubernetesCluster                        = "${var.cluster_name}"
    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    # "kubernetes.io/kops/role"                = "private-${var.zone01}"
  }
}

resource "aws_route_table" "private002-lab-rt-local" {
  vpc_id = "${aws_vpc.lab-vpc-local.id}"

  tags = {
    Name                                     = "rt-private-${var.zone-02}.${var.vpc-name}"
    # KubernetesCluster                        = "${var.cluster_name}"
    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    # "kubernetes.io/kops/role"                = "private-${var.zone02}"
  }
}

resource "aws_route_table_association" "private001-lab-rta-local" {
  subnet_id      = "${aws_subnet.private-subnet01-local.id}"
  route_table_id = "${aws_route_table.private001-lab-rt-local.id}"
}

resource "aws_route_table_association" "private002-lab-rta-local" {
  subnet_id      = "${aws_subnet.private-subnet02-local.id}"
  route_table_id = "${aws_route_table.private002-lab-rt-local.id}"
}

resource "aws_route_table_association" "utility001-lab-rta-local" {
  subnet_id      = "${aws_subnet.utility-subnet01-local.id}"
  route_table_id = "${aws_route_table.lab-rt-local.id}"
}

resource "aws_route_table_association" "utility002-lab-rta-local" {
  subnet_id      = "${aws_subnet.utility-subnet02-local.id}"
  route_table_id = "${aws_route_table.lab-rt-local.id}"
}

resource "aws_route" "rt0-0-0-0--0" {
  route_table_id         = "${aws_route_table.lab-rt-local.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.lab-igw-local.id}"
}

resource "aws_route" "private-a-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private001-lab-rt-local.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.lab-nat01-local.id}"
}

resource "aws_route" "private-b-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private002-lab-rt-local.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.lab-nat02-local.id}"
}
