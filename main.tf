resource "flexibleengine_vpc_v1" "vpc" {
    count  = var.vpc_enabled ? 1 : 0
    name   = var.vpc_name
    cidr   = var.vpc_cidr
    region = var.vpc_region
}

resource "flexibleengine_vpc_subnet_v1" "vpc_subnets" {
   dynamic "subnet" {
    for_each = var.vpc_subnets
    content {
      name              = subnet.value.subnet_name
      cidr              = subnet.value.subnet_cidr
      gateway_ip        = subnet.value.gateway_ip
      availability_zone = subnet.value.availability_zone
      vpc_id            = flexibleengine_vpc_v1.vpc.id[0]
    }
  }
}