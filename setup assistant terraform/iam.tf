module "organization-iam" {
  source  = "terraform-google-modules/iam/google//modules/organizations_iam"
  version = "~> 7.4"

  organizations = ["964730493005"]

  bindings = {
    
    "roles/bigquery.dataViewer" = [
      "group:gcp-security-admins@mkck.eu",
    ]
    
    "roles/billing.admin" = [
      "group:gcp-billing-admins@mkck.eu",
    ]
    
    "roles/compute.networkAdmin" = [
      "group:gcp-network-admins@mkck.eu",
    ]
    
    "roles/compute.securityAdmin" = [
      "group:gcp-network-admins@mkck.eu",
    ]
    
    "roles/compute.viewer" = [
      "group:gcp-security-admins@mkck.eu",
    ]
    
    "roles/compute.xpnAdmin" = [
      "group:gcp-network-admins@mkck.eu",
    ]
    
    "roles/container.viewer" = [
      "group:gcp-security-admins@mkck.eu",
    ]
    
    "roles/iam.organizationRoleViewer" = [
      "group:gcp-security-admins@mkck.eu",
    ]
    
    "roles/iam.securityReviewer" = [
      "group:gcp-security-admins@mkck.eu",
    ]
    
    "roles/logging.configWriter" = [
      "group:gcp-security-admins@mkck.eu",
    ]
    
    "roles/logging.privateLogViewer" = [
      "group:gcp-security-admins@mkck.eu",
    ]
    
    "roles/orgpolicy.policyAdmin" = [
      "group:gcp-security-admins@mkck.eu",
    ]
    
    "roles/orgpolicy.policyViewer" = [
      "group:gcp-security-admins@mkck.eu",
    ]
    
    "roles/resourcemanager.folderIamAdmin" = [
      "group:gcp-security-admins@mkck.eu",
    ]
    
    "roles/resourcemanager.folderViewer" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/resourcemanager.organizationAdmin" = [
      "group:gcp-organization-admins@mkck.eu",
    ]
    
    "roles/securitycenter.admin" = [
      "group:gcp-security-admins@mkck.eu",
    ]
    
  }
}


module "cloud-application-services-team-1-non-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.cloud-application-services-team-1-non-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
  }
}


module "cloud-application-services-team-1-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.cloud-application-services-team-1-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/errorreporting.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/logging.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/monitoring.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/servicemanagement.quotaAdmin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
  }
}


module "cloud-application-services-team-2-non-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.cloud-application-services-team-2-non-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
  }
}


module "cloud-application-services-team-2-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.cloud-application-services-team-2-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/errorreporting.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/logging.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/monitoring.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/servicemanagement.quotaAdmin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
  }
}


module "cloud-application-services-team-3-non-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.cloud-application-services-team-3-non-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
  }
}


module "cloud-application-services-team-3-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.cloud-application-services-team-3-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/errorreporting.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/logging.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/monitoring.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/servicemanagement.quotaAdmin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
  }
}


module "cloud-application-services-team-4-non-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.cloud-application-services-team-4-non-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
  }
}


module "cloud-application-services-team-4-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.cloud-application-services-team-4-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/errorreporting.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/logging.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/monitoring.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/servicemanagement.quotaAdmin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
  }
}


module "cloud-platform-services-team-1-non-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.cloud-platform-services-team-1-non-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
  }
}


module "cloud-platform-services-team-1-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.cloud-platform-services-team-1-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/errorreporting.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/logging.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/monitoring.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/servicemanagement.quotaAdmin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
  }
}


module "cloud-platform-services-team-2-non-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.cloud-platform-services-team-2-non-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
  }
}


module "cloud-platform-services-team-2-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.cloud-platform-services-team-2-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/errorreporting.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/logging.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/monitoring.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/servicemanagement.quotaAdmin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
  }
}


module "cloud-platform-services-team-3-non-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.cloud-platform-services-team-3-non-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
  }
}


module "cloud-platform-services-team-3-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.cloud-platform-services-team-3-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/errorreporting.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/logging.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/monitoring.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/servicemanagement.quotaAdmin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
  }
}


module "cloud-platform-services-team-4-non-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.cloud-platform-services-team-4-non-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
  }
}


module "cloud-platform-services-team-4-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.cloud-platform-services-team-4-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/errorreporting.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/logging.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/monitoring.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/servicemanagement.quotaAdmin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
  }
}


module "google-powerhouse-team-1-non-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.google-powerhouse-team-1-non-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
  }
}


module "google-powerhouse-team-1-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.google-powerhouse-team-1-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/errorreporting.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/logging.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/monitoring.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/servicemanagement.quotaAdmin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
  }
}


module "google-powerhouse-team-2-non-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.google-powerhouse-team-2-non-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
  }
}


module "google-powerhouse-team-2-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.google-powerhouse-team-2-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/errorreporting.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/logging.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/monitoring.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/servicemanagement.quotaAdmin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
  }
}


module "google-powerhouse-team-3-non-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.google-powerhouse-team-3-non-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
  }
}


module "google-powerhouse-team-3-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.google-powerhouse-team-3-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/errorreporting.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/logging.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/monitoring.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/servicemanagement.quotaAdmin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
  }
}


module "google-powerhouse-team-4-non-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.google-powerhouse-team-4-non-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-developers@mkck.eu",
    ]
    
  }
}


module "google-powerhouse-team-4-production-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.google-powerhouse-team-4-production.name]

  bindings = {
    
    "roles/compute.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/container.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/errorreporting.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/logging.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/monitoring.admin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
    "roles/servicemanagement.quotaAdmin" = [
      "group:gcp-devops@mkck.eu",
    ]
    
  }
}
