terraform {
  cloud {
    organization = "terraform-KP21-kinsey"

    workspaces {
      name = "KP21-dev"
    }
  }
}