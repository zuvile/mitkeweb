resource "cloudflare_zone" "zivilemitke_com" {
  account = {
    id = var.cloudflare_account_id
  }
  name = "zivilemitke.com"
}

resource "cloudflare_zone" "zivilemitke_lt" {
  account = {
    id = var.cloudflare_account_id
  }
  name = "zivilemitke.lt"
}
