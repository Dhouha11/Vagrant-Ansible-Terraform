terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  # Configuration options
}

resource "docker_image" "mycv" {
  name         = "dhouhaaoui/mycv:latest"
  keep_locally = false
}

resource "docker_container" "mycv" {
  image = docker_image.mycv.latest
  name  = "cv_dhouha"
  ports {
    internal = 80
    external = 8080
  }
}
