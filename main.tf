module "bigtable" {
  source          = "./modules/bigtable"
  cluster_name = var.cluster_name
  display_name = var.display_name
  project_id   = var.project_id
  zone         = var.zone
}