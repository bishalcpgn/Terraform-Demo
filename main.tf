
module "vpc_resources" {
    source = "./vpc_resources"
    vpc_cidr = "10.0.0.0/16"  
    availability_zone_private = "us-east-1"
    availability_zone_public = "us-east-1"
    public_subnet_cidr = "10.0.1.0/24"
    private_subnet_cidr = "10.0.2.0/24"
}

module "ec2_resources" {
    source = "./ec2_resources"
    subnet_id = module.vpc_resources.public_subnet_id
    security_group_id = module.vpc_resources.sg_private_id
    ami_value = "ami-04a81a99f5ec58529"
    instance_type = "t2.micro"

}



