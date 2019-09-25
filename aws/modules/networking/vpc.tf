resource "aws_vpc" "lab-vpc-local" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name                                     = "${var.vpc-name}"
    # KubernetesCluster                        = "${var.cluster_name}"
    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}
