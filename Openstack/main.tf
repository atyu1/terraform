# Define required providers
terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "admin"
  tenant_name = "admin"
  password    = "pass"
  auth_url    = "https://10.8.21.1:5000/v3"
  region      = "RegionOne"
}

resource "openstack_compute_instance_v2" "basic" {
  name            = "basic"
  image_id        = "02ca196f-5d7d-4d63-9be0-6485a414a71b"
  flavor_id       = "513d8449-f549-4483-8ff4-4282e07a6fe7"
  security_groups = ["default"]

  network {
    name = "test-net"
  }
}