terraform {
  required_providers {
    prismacloud = {
      source = "PaloAltoNetworks/prismacloud"
      version = ">=1.6.1"
    }
  }
}

provider "prismacloud" {
  # Configuration options
  url= var.url
  username = var.prisma_access_key
  password = var.prisma_secret_key
}