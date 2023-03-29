// For using Pi-Hole without DHCP server capabilities

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "pihole" {
  name         = "pihole/pihole"
  keep_locally = false
}

resource "docker_container" "pihole" {
  image = docker_image.pihole.image_id
  name  = "pihole"

    restart = "unless-stopped"

    ports {
        internal = 80
        external = 80
    }
    ports {
        internal = 53
        external = 53
        protocol = "tcp"
    }
    ports {
        internal = 53
        external = 53
        protocol = "udp"
    }

    env = [
        "TZ=America/Chicago",
        "WEBPASSWORD=VerySecurePassword1234!"
    ]

    volumes {
        host_path = "/abs/path/to/etc-pihole"
        container_path = "/etc/pihole"
    }
    volumes {
        host_path = "/abs/path/to/etc-dnsmasq.d"
        container_path = "/etc/dnsmasq.d"
    }
}
