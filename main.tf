module "bigtable" {
  source          = "./modules/bigtable"
  cluster_name = var.cluster_name
  zone         = var.zone
}