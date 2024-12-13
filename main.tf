provider "google" {
  project = "gcp-labs-2024"
  
}
resource "google_compute_network" "vpc_custom_1"{
  name = "vpc-custom-1"
  auto_create_subnetworks = false
 }

resource "google_compute_subnetwork" "vpc_custom_1_subnet1" {
  name                    = "vpc-custom-1-subnet1"
  ip_cidr_range           = "10.1.0.0/24"
  region                  = "us-east1"
  network                 = google_compute_network.vpc_custom_1.name
}

resource "google_compute_subnetwork" "vpc_custom_1_subnet2" {
  name                    = "vpc-custom-1-subnet2"
  ip_cidr_range           = "10.2.0.0/24"
  region                  = "us-east4"
  network                 = google_compute_network.vpc_custom_1.name
}

resource "google_compute_subnetwork" "vpc_custom_1_subnet3" {
  name                    = "vpc-custom-1-subnet3"
  ip_cidr_range           = "10.3.0.0/24"
  region                  = "us-east5"
  network                 = google_compute_network.vpc_custom_1.name
}

resource "google_compute_network" "vpc_custom_2"{
  name = "vpc-custom-2"
  auto_create_subnetworks = false
 }

resource "google_compute_subnetwork" "vpc_custom_2_subnet1" {
  name                    = "vpc-custom-2-subnet1"
  ip_cidr_range           = "10.4.0.0/24"
  region                  = "us-west1"
  network                 = google_compute_network.vpc_custom_2.name
}

resource "google_compute_subnetwork" "vpc_custom_2_subnet2" {
  name                    = "vpc-custom-2-subnet2"
  ip_cidr_range           = "10.5.0.0/24"
  region                  = "us-west2"
  network                 = google_compute_network.vpc_custom_2.name
}

resource "google_compute_subnetwork" "vpc_custom_2_subnet3" {
  name                    = "vpc-custom-2-subnet3"
  ip_cidr_range           = "10.6.0.0/24"
  region                  = "us-west4"
  network                 = google_compute_network.vpc_custom_2.name
}

  resource "google_compute_network_peering" "peering-vpc-custom-1-to-vpc-custom-2" {
  name         = "vpc-custom-1-to-vpc-custom-2"
  network      = google_compute_network.vpc_custom_1.id
  peer_network = google_compute_network.vpc_custom_2.id

  import_custom_routes = true
  export_custom_routes = true
}

resource "google_compute_network_peering" "peering-vpc-custom-2-to-vpc-custom-1" {
  name         = "vpc-custom-2-to-vpc-custom-1"
  network      = google_compute_network.vpc_custom_2.id
  peer_network = google_compute_network.vpc_custom_1.id
}

