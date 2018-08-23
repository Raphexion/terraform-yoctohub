output "ip" {
  value = "${digitalocean_droplet.foobar.ipv4_address}"
}
