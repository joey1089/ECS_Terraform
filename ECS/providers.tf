terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.1"
    }
  }
}


# Error not resolved
#- Installing kreuzwerker/docker v3.0.1...
# - Installed kreuzwerker/docker v3.0.1 (self-signed, key ID BD080C4571C6104C)

# Partner and community providers are signed by their developers.
# If you'd like to know more about provider signing, you can read about it here:
# https://www.terraform.io/docs/cli/plugins/signing.html
# ╷
# │ Error: Failed to query available provider packages
# │ 
# │ Could not retrieve the list of available versions for provider hashicorp/aws: no available releases match the given constraints
# │ ~> 3.0, >= 4.6.0, < 5.0.0
# ╵



# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}
