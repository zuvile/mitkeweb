terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.14"
    }
    sops = {
      source  = "carlpett/sops"
      version = "~> 1.3"
    }
  }

  backend "s3" {
    bucket = "terraform-mitkeweb"
    key    = "terraform.tfstate"
    endpoints = {
      s3 = "https://9665084c25c66fa7aeeeed63920768dd.r2.cloudflarestorage.com"
    }
    region                      = "auto"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    use_path_style              = true
  }
}
