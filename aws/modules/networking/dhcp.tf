resource "aws_vpc_dhcp_options" "lab-dhcp-local" {
  domain_name         = "${var.region}.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    Name                                     = "vpc_dhcp.${var.vpc-name}"
    # KubernetesCluster                        = "${var.cluster_name}"
    # "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_vpc_dhcp_options_association" "lab-dhcpassociation-local" {
  vpc_id          = "${aws_vpc.lab-vpc-local.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.lab-dhcp-local.id}"
}
