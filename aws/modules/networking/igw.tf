resource "aws_internet_gateway" "lab-igw-local" {
  vpc_id = "${aws_vpc.lab-vpc-local.id}"

  tags = {
    Name                                     = "igw.${var.vpc-name}"
    # KubernetesCluster                        = "${var.cluster_name}"
    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}
