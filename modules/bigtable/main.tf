data "terraform_remote_state" "project-and-networks" {
  backend = "remote"
  config = {
    organization = "AFRLDigitalMFG"
    workspaces = {
      name = "shared_vpc_projects"
    }
  }
}

//resource "google_project_service" "enable_bigtable_api" {
//  project = data.terraform_remote_state.project-and-networks.outputs.afrl-big-data-project-id
//  service = "bigtableadmin.googleapis.com"
//}


resource "google_bigtable_instance" "development-instance" {
  name          = "tf-instance"
  instance_type = "DEVELOPMENT"
  display_name = var.display_name
  project = "projects/${var.project_id}"

  cluster {
    cluster_id   = var.cluster_name
    zone         = var.zone
    storage_type = "HDD"
  }
//  depends_on = [google_project_service.enable_bigtable_api]
}

resource "google_bigtable_table" "table" {
  name          = "tf-table"
  project = "projects/${var.project_id}"
  instance_name = google_bigtable_instance.development-instance.name
  split_keys    = ["a", "b", "c"]
}