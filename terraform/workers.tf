resource "cloudflare_worker" "mitkeweb" {
  account_id = var.cloudflare_account_id
  name       = "mitkeweb"

  observability = {
    enabled = false
  }

  subdomain = {
    enabled          = false
    previews_enabled = false
  }
}

resource "cloudflare_worker_version" "mitkeweb_version" {
  account_id = var.cloudflare_account_id
  worker_id  = cloudflare_worker.mitkeweb.id

  compatibility_date = "2025-12-10"

  main_module = "mitkeweb.mjs"

  modules = [
    {
      name         = "mitkeweb.mjs"
      content_type = "application/javascript+module"
      content_file = "${path.module}/mitkeweb.mjs"
    }
  ]
}

resource "cloudflare_workers_deployment" "mitkeweb_deployment" {
  account_id  = var.cloudflare_account_id
  script_name = cloudflare_worker.mitkeweb.name

  strategy = "percentage"

  versions = [{
    percentage = 100
    version_id = cloudflare_worker_version.mitkeweb_version.id
  }]

  lifecycle {
    ignore_changes = [versions]
  }
}

resource "cloudflare_workers_custom_domain" "mitkeweb_zivilemitke_com_custom_domain" {
  account_id = var.cloudflare_account_id
  zone_id    = cloudflare_zone.zivilemitke_com.id
  service    = cloudflare_worker.mitkeweb.name
  hostname   = "zivilemitke.com"

  lifecycle {
    ignore_changes = [environment]
  }
}

resource "cloudflare_workers_custom_domain" "mitkeweb_zivilemitke_lt_custom_domain" {
  account_id = var.cloudflare_account_id
  zone_id    = cloudflare_zone.zivilemitke_lt.id
  service    = cloudflare_worker.mitkeweb.name
  hostname   = "zivilemitke.lt"

  lifecycle {
    ignore_changes = [environment]
  }
}


