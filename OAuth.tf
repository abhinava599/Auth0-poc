terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "0.40.0"
    }
  }
}

provider "auth0" {
}

resource "auth0_client" "terraform-secure-express" {
  name            = "Terraform Secure Express4"
  description     = "App for running Dockerized Express application via Terraform"
  app_type        = "regular_web"
  callbacks       = ["http://localhost:3000/callback"]
  oidc_conformant = true

  jwt_configuration {
    alg = "RS256"
  }
}
