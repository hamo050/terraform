terraform {
  required_providers {
    system = {
      source = "neuspaces/system"
    }
  }
}


provider "system" {
  ssh {
    host        = "192.168.64.5"
    port        = 22
    user        = "root"
    private_key = file("~/.ssh/id_rsa")
  }
}

resource "system_packages_apt" "nginx" {
  package {
    name = "nginx"
  }
}

resource "system_service_systemd" "nginx" {
  name = "nginx"

#  enabled = true
  status  = "started"
}
