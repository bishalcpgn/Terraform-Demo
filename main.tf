
module "vpc-resources" {
    source = "./vpc-resources"
    vpc_cidr = "10.0.0.0/16"  
}

module "gateway-resources" {
    source = "./gateway-resources"
}

module "route-table-resources" {
    source = "./route-table-resources"
}

module "subnet-resources" {
    source = "./subnet-resources"
    availability_zone_private = "us-east-1a"
    availability_zone_public = "us-east-1a"
    public_subnet_cidr = "10.0.1.0/24"
    private_subnet_cidr = "10.0.2.0/24"
}

module "ec2-resources" {
    source = "./ec2-instance"
    ami_value = "ami-04a81a99f5ec58529"
    instance_type = "t2.micro"
}



