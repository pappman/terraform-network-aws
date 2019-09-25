resource "aws_eip" "lab-eip01-local" {
  vpc = true

  tags = {
    Name                                     = "eip-${var.zone-01}.${var.vpc-name}"
    # KubernetesCluster                        = "${var.cluster_name}"
    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_eip" "lab-eip02-local" {
  vpc = true
  
  tags = {
    Name                                     = "eip-${var.zone-02}.${var.vpc-name}"
    # KubernetesCluster                        = "${var.cluster_name}"
    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}
