terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "0.40.0"
    }
  }
}

provider "auth0" {
  domain        = "dev-1vi7cmkd3q0w5v8f.uk.auth0.com"
  client_id     = "5JIMm1vu2ig9elmsHOPkwy8Vbnkczljd"
  client_secret = "1N7LkUL2o068U7-f1_wXTS4jcyIR0DXZtpZVQPXZ10bfDiI-3ryFhRL2ex0t6i88"
}


resource "auth0_client" "terraform-secure-express" {
  name            = "Terraform Secure Express-demo"
  description     = "App for running Dockerized Express application via Terraform"
  app_type        = "regular_web"
  callbacks       = ["http://localhost:3000/callback"]
  oidc_conformant = true

  jwt_configuration {
    alg = "RS256"
  }
}
