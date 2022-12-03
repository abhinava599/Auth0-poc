terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "0.40.0"
    }
  }
}

provider "auth0" {
  domain        = "dev-1z0jxvqw0tikzzhm.us.auth0.com"
  client_id     = "g0XdpnYPQRmhXGDucY3Sz573kwKLVSSN"
  client_secret = "atPPjQeg2Y8pUndsh3VLYygazq_4lFvgY6RK_C-Z1a76AK0MwAricvT3U7yO8i_d"
}


resource "auth0_client" "terraform-secure-express" {
  name            = "Terraform Secure Express"
  description     = "App for running Dockerized Express application via Terraform"
  app_type        = "regular_web"
  callbacks       = ["http://localhost:3000/callback"]
  oidc_conformant = true

  jwt_configuration {
    alg = "RS256"
  }
}
