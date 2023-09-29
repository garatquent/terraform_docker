terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  //host = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "build" {
    name = "my_docker_image"
    build {
        context = "../app"
    }
}

resource "docker_container" "container" {
    name = "my_docker_container"
    image = docker_image.build.image_id

    ports {
      internal = 8000
      external = 8000
    }
}