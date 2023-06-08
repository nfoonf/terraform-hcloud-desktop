# cluster/version.tf
terraform {
  required_version = ">= 1.4.6"
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = ">= 1.39.0"
    }
  }
}