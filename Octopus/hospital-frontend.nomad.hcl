job "hospital-frontend" {
  datacenters = ["dc1"]
  type = "service"

  group "frontend" {
    count = 1
    task "app" {
      driver = "docker"
      config {
        image = "867344436215.dkr.ecr.us-east-1.amazonaws.com/hospital-app-backend:latest"
        ports = ["http"]
      }
      resources {
        cpu    = 500
        memory = 256
        network {
          port "http" {}
        }
      }
    }
  }
}
