# Build Docker Image from Dockerfile
resource "docker_image" "my_docker_image" {
  name         = "my-docker-image:latest"
  build {
    path = "${path.module}" # Path where Dockerfile is located, typically root of repo
  }
}

# Run Docker Container using the built image
resource "docker_container" "my_docker_container" {
  name  = "my-running-container"
  image = docker_image.my_docker_image.latest
  ports {
    internal = 80
    external = 8081
  }
}
