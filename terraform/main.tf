provider "sops" {}

data "sops_file" "secrets" {
  source_file = "cloudflare-key.enc.json"
}

provider "cloudflare" {
  api_token = data.sops_file.secrets.data["cf_api_key"]
}
