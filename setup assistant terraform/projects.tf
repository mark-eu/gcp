module "logging-nonprod-lh284-by382" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "logging-nonprod"
  project_id = "logging-nonprod-lh284-by382"
  org_id     = var.org_id
  folder_id  = google_folder.shared.name

  billing_account = var.billing_account
}

module "logging-prod-lh284-by382" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "logging-prod"
  project_id = "logging-prod-lh284-by382"
  org_id     = var.org_id
  folder_id  = google_folder.shared.name

  billing_account = var.billing_account
}

module "monitoring-nonprod-lh284-by382" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-nonprod"
  project_id = "monitoring-nonprod-lh284-by382"
  org_id     = var.org_id
  folder_id  = google_folder.shared.name

  billing_account = var.billing_account
}

module "monitoring-prod-lh284-by382" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-prod"
  project_id = "monitoring-prod-lh284-by382"
  org_id     = var.org_id
  folder_id  = google_folder.shared.name

  billing_account = var.billing_account
}

module "vpc-host-nonprod-lh284-by382" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-nonprod"
  project_id = "vpc-host-nonprod-lh284-by382"
  org_id     = var.org_id
  folder_id  = google_folder.shared.name

  billing_account = var.billing_account
}

module "vpc-host-prod-lh284-by382" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-prod"
  project_id = "vpc-host-prod-lh284-by382"
  org_id     = var.org_id
  folder_id  = google_folder.shared.name

  billing_account = var.billing_account
}
