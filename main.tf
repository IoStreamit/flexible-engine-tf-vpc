resource "flexibleengine_vpc_v1" "vpc" {
    count  = var.vpc_enabled ? 1 : 0
    name   = var.vpc_name
    cidr   = var.vpc_cidr
    region = var.vpc_region
}

resource "flexibleengine_vpc_subnet_v1" "vpc_subnets" {
  for_each          = {for subnet in var.vpc_subnets : subnet.subnet_cidr => subnet}
  name              = each.value.subnet_name
  cidr              = each.value.subnet_cidr
  gateway_ip        = each.value.subnet_gateway_ip
  availability_zone = each.value.subnet_availability_zone
  vpc_id            = flexibleengine_vpc_v1.vpc[0].id
  dhcp_enable       = each.value.subnet_dhcp_enable
  primary_dns       = each.value.subnet_primary_dns
  secondary_dns     = each.value.subnet_secondary_dns
}