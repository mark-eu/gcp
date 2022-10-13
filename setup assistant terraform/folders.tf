resource "google_folder" "cloud-application-services" {
  display_name = "Cloud Application Services"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "cloud-application-services-team-1" {
  display_name = "Team 1"
  parent       = google_folder.cloud-application-services.name
}

resource "google_folder" "cloud-application-services-team-1-non-production" {
  display_name = "Non-Production"
  parent       = google_folder.cloud-application-services-team-1.name
}

resource "google_folder" "cloud-application-services-team-1-production" {
  display_name = "Production"
  parent       = google_folder.cloud-application-services-team-1.name
}

resource "google_folder" "cloud-application-services-team-2" {
  display_name = "Team 2"
  parent       = google_folder.cloud-application-services.name
}

resource "google_folder" "cloud-application-services-team-2-non-production" {
  display_name = "Non-Production"
  parent       = google_folder.cloud-application-services-team-2.name
}

resource "google_folder" "cloud-application-services-team-2-production" {
  display_name = "Production"
  parent       = google_folder.cloud-application-services-team-2.name
}

resource "google_folder" "cloud-application-services-team-3" {
  display_name = "Team 3"
  parent       = google_folder.cloud-application-services.name
}

resource "google_folder" "cloud-application-services-team-3-non-production" {
  display_name = "Non-Production"
  parent       = google_folder.cloud-application-services-team-3.name
}

resource "google_folder" "cloud-application-services-team-3-production" {
  display_name = "Production"
  parent       = google_folder.cloud-application-services-team-3.name
}

resource "google_folder" "cloud-application-services-team-4" {
  display_name = "Team 4"
  parent       = google_folder.cloud-application-services.name
}

resource "google_folder" "cloud-application-services-team-4-non-production" {
  display_name = "Non-Production"
  parent       = google_folder.cloud-application-services-team-4.name
}

resource "google_folder" "cloud-application-services-team-4-production" {
  display_name = "Production"
  parent       = google_folder.cloud-application-services-team-4.name
}

resource "google_folder" "cloud-platform-services" {
  display_name = "Cloud Platform Services"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "cloud-platform-services-team-1" {
  display_name = "Team 1"
  parent       = google_folder.cloud-platform-services.name
}

resource "google_folder" "cloud-platform-services-team-1-non-production" {
  display_name = "Non-Production"
  parent       = google_folder.cloud-platform-services-team-1.name
}

resource "google_folder" "cloud-platform-services-team-1-production" {
  display_name = "Production"
  parent       = google_folder.cloud-platform-services-team-1.name
}

resource "google_folder" "cloud-platform-services-team-2" {
  display_name = "Team 2"
  parent       = google_folder.cloud-platform-services.name
}

resource "google_folder" "cloud-platform-services-team-2-non-production" {
  display_name = "Non-Production"
  parent       = google_folder.cloud-platform-services-team-2.name
}

resource "google_folder" "cloud-platform-services-team-2-production" {
  display_name = "Production"
  parent       = google_folder.cloud-platform-services-team-2.name
}

resource "google_folder" "cloud-platform-services-team-3" {
  display_name = "Team 3"
  parent       = google_folder.cloud-platform-services.name
}

resource "google_folder" "cloud-platform-services-team-3-non-production" {
  display_name = "Non-Production"
  parent       = google_folder.cloud-platform-services-team-3.name
}

resource "google_folder" "cloud-platform-services-team-3-production" {
  display_name = "Production"
  parent       = google_folder.cloud-platform-services-team-3.name
}

resource "google_folder" "cloud-platform-services-team-4" {
  display_name = "Team 4"
  parent       = google_folder.cloud-platform-services.name
}

resource "google_folder" "cloud-platform-services-team-4-non-production" {
  display_name = "Non-Production"
  parent       = google_folder.cloud-platform-services-team-4.name
}

resource "google_folder" "cloud-platform-services-team-4-production" {
  display_name = "Production"
  parent       = google_folder.cloud-platform-services-team-4.name
}

resource "google_folder" "google-powerhouse" {
  display_name = "Google Powerhouse"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "google-powerhouse-team-1" {
  display_name = "Team 1"
  parent       = google_folder.google-powerhouse.name
}

resource "google_folder" "google-powerhouse-team-1-non-production" {
  display_name = "Non-Production"
  parent       = google_folder.google-powerhouse-team-1.name
}

resource "google_folder" "google-powerhouse-team-1-production" {
  display_name = "Production"
  parent       = google_folder.google-powerhouse-team-1.name
}

resource "google_folder" "google-powerhouse-team-2" {
  display_name = "Team 2"
  parent       = google_folder.google-powerhouse.name
}

resource "google_folder" "google-powerhouse-team-2-non-production" {
  display_name = "Non-Production"
  parent       = google_folder.google-powerhouse-team-2.name
}

resource "google_folder" "google-powerhouse-team-2-production" {
  display_name = "Production"
  parent       = google_folder.google-powerhouse-team-2.name
}

resource "google_folder" "google-powerhouse-team-3" {
  display_name = "Team 3"
  parent       = google_folder.google-powerhouse.name
}

resource "google_folder" "google-powerhouse-team-3-non-production" {
  display_name = "Non-Production"
  parent       = google_folder.google-powerhouse-team-3.name
}

resource "google_folder" "google-powerhouse-team-3-production" {
  display_name = "Production"
  parent       = google_folder.google-powerhouse-team-3.name
}

resource "google_folder" "google-powerhouse-team-4" {
  display_name = "Team 4"
  parent       = google_folder.google-powerhouse.name
}

resource "google_folder" "google-powerhouse-team-4-non-production" {
  display_name = "Non-Production"
  parent       = google_folder.google-powerhouse-team-4.name
}

resource "google_folder" "google-powerhouse-team-4-production" {
  display_name = "Production"
  parent       = google_folder.google-powerhouse-team-4.name
}

resource "google_folder" "shared" {
  display_name = "Shared"
  parent       = "organizations/${var.org_id}"
}
