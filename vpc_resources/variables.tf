variable "vpc_cidr" {
    description = "defines IP address range for VPC "
}

variable "availability_zone_private" {
    description = "defines availability zone for private subnet"
}

variable "availability_zone_public" {
    description = "defines availability zone for public subnet"
}

variable "public_subnet_cidr" {
    description = "defines IP address range for public subnet"
}

variable "private_subnet_cidr" {
    description = "defines IP address range for private subnet"
}

