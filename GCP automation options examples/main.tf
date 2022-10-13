# PoC for deploying a Compute Engine instance in a new project which requires a VPC, so we create a VPC first.
#
# 
# To setup the security context with GCP, the path to the JSON file containing the Service Account key has to be declared
# in the environment variable GOOGLE_APPLICATION_CREDENTIALS
# (e.g. export GOOGLE_APPLICATION_CREDENTIALS=/home/mark/svc-account.json)
#
# The Service Account used (specified above) for the terraform commands need to have the following roles:
# - Compute Instance Admin (v1)
# - Compute Network Admin
# - Service Account User
#
# When using the terraform plan/apply command you need to specify the three variables on the command line:  
# - The name of the project (-var="project_name=project1")
# - The name of the VPC to create (-var="vpc_name=test-vpc-01")
# - The name of the Compute Engine instance (-var="ce_name=test-ce-01")
# N.B. There is no default name for the project as obviously the project needs to be there already, as there is nothing
# in this terraform config to deploy a Project. You *must* provide the project name, but if you miss out the VPC and CE
# names, then the defaults will be used as listed in the resource entries below.
#
# The "depends_on" argument used in the resource definiton for the Compute Engine resource ensures that the required VPC
# exists before the Compute Engine instance is deployed.


variable "project_name" {
  type        = string
  description = "The name of the project where the resources will be deployed."
}

variable "vpc_name" {
  type        = string
  description = "The name of the vpc to create for the VM to use."
  default = "test-vpc-01"
}

variable "ce_name" {
  type        = string
  description = "The name of the Compute Engine instance to create."
  default = "test-ce-01"
}

provider "google" {
  project = var.project_name
  region  = "europe-west1"
  zone    = "europe-west1-b"
}



resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = true
  mtu                     = 1460
}

resource "google_compute_instance" "vm_instance" {
  name         = var.ce_name
  machine_type = "e2-small"
  allow_stopping_for_update = true
  depends_on = [google_compute_network.vpc_network]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = var.vpc_name
    access_config {
    }
  }
}





