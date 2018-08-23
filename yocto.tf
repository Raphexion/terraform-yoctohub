resource "digitalocean_volume" "foobar" {
  region      = "nyc1"
  name        = "baz"
  size        = 100
  description = "an example volume"
}

resource "digitalocean_droplet" "foobar" {
  name       = "baz"
  size       = "1gb"
  image      = "ubuntu-18-04-x64"
  region     = "nyc1"
  volume_ids = ["${digitalocean_volume.foobar.id}"]
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]

  connection {
    user = "root"
    type = "ssh"
    private_key = "${file(var.pvt_key)}"
    timeout = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt-get update",
      "sudo apt-get -y install python python-yaml"
    ]
  }

  provisioner "local-exec" {
    command = "ansible-playbook -u root -i '${digitalocean_droplet.foobar.ipv4_address},' --private-key ${var.pvt_key} provision.yml"
  }
}
