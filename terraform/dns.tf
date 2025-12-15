resource "cloudflare_dns_record" "zivilemitke_com_www" {
  zone_id = cloudflare_zone.zivilemitke_com.id
  name    = "www"
  content = "zivilemitke.com"
  type    = "CNAME"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "zivilemitke_lt_www" {
  zone_id = cloudflare_zone.zivilemitke_lt.id
  name    = "www"
  content = "zivilemitke.lt"
  type    = "CNAME"
  proxied = true
  ttl     = 1
}
