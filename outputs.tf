output "vpc_id" {
    value = var.vpc_enabled && length(flexibleengine_vpc_v1.vpc) > 0 ? flexibleengine_vpc_v1.vpc[0].id : null
    description = "the vpc id used" 
}

output "vpc_subnets" {
    value     = tolist(flexibleengine_vpc_subnet_v1.vpc_subnets[0].subnet_id)
    description = "Subnet"
}