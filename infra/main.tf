terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
    host = "localhost:8080"
    //tcp://localhost:8080
}

ressource "docker_image" "build" {
    name = "my_docker_image"
    build {
        context = "./../app"
    }
}

ressource "docker_container" "container" {
    name = "my_docker_container"
    image = docker_image.build.image_id
}