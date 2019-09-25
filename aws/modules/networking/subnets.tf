resource "aws_subnet" "private-subnet01-local" {
  vpc_id            = "${aws_vpc.lab-vpc-local.id}"
  cidr_block        = "172.20.32.0/19"
  availability_zone = "${var.zone-01}"

  tags = {
    Name                                     = "${var.zone-01}.${var.vpc-name}"
    SubnetType                               = "Private"
    # KubernetesCluster                           = "${var.cluster_name}"
    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    # "kubernetes.io/role/internal-elb"           = "1"
  }
}

resource "aws_subnet" "private-subnet02-local" {
  vpc_id            = "${aws_vpc.lab-vpc-local.id}"
  cidr_block        = "172.20.64.0/19"
  availability_zone = "${var.zone-02}"

  tags = {
    Name                                     = "${var.zone-02}.${var.vpc-name}"
    SubnetType                               = "Private"
    # KubernetesCluster                        = "${var.cluster_name}"
    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    # "kubernetes.io/role/internal-elb"        = "1"
  }
}

resource "aws_subnet" "utility-subnet01-local" {
  vpc_id            = "${aws_vpc.lab-vpc-local.id}"
  cidr_block        = "172.20.0.0/22"
  availability_zone = "${var.zone-01}"

  tags = {
    Name                                     = "utility-${var.zone-01}.${var.vpc-name}"
    SubnetType                               = "Utility"
    # KubernetesCluster                        = "${var.cluster_name}"
    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    # "kubernetes.io/role/elb"                 = "1"
  }
}

resource "aws_subnet" "utility-subnet02-local" {
  vpc_id            = "${aws_vpc.lab-vpc-local.id}"
  cidr_block        = "172.20.4.0/22"
  availability_zone = "${var.zone-02}"

  tags = {
    Name                                     = "utility-${var.zone-02}.${var.vpc-name}"
    SubnetType                               = "Utility"
    # KubernetesCluster                        = "${var.cluster_name}"
    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    # "kubernetes.io/role/elb"                 = "1"
  }
}
