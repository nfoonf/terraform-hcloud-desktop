resource "hcloud_server" "remote_desktop" {
  count       = 1
  name        = "rdp-server-1"
  image       = var.os_type
  server_type = var.server_type
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "rdp"
  }
  user_data = file("user_data.yml")
}