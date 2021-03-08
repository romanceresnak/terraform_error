terraform {
  backend "remote" {
    organization = "rc-terraform"

    workspaces {
      name = "rc-dev"
    }
  }
}