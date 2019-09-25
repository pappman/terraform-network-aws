module "networking" {
  source = "./modules/networking"

  region   = "${var.region}"
  zone-01  = "${var.zone-01}"
  zone-02  = "${var.zone-02}"
  vpc-name = "${var.vpc-name}"
  # cluster-name = "${var.cluster_name}"
}
